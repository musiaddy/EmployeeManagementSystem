package servlet;

import util.DBConnection;
import util.EmailUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        double salary =
                Double.parseDouble(request.getParameter("salary"));

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        try {

            Connection con = DBConnection.getConnection();
            String username =name.toLowerCase().replace(" ", "") + ((int)(Math.random()*100));

            String generatedPassword ="emp" + ((int)(Math.random()*10000));
            String query =
            "INSERT INTO employees(name,email,department,salary,username) VALUES(?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, department);
            pst.setDouble(4, salary);
            pst.setString(5, username);
            int rows = pst.executeUpdate();
            if(rows > 0) {
                String userQuery =
                "INSERT INTO users(username,password,role) VALUES(?,?,?)";

                PreparedStatement userPst = con.prepareStatement(userQuery);

                userPst.setString(1, username);

                userPst.setString(2, generatedPassword);

                userPst.setString(3, "employee");

                userPst.executeUpdate();
                EmailUtil.sendEmail(email,name,department,salary,username,generatedPassword);
                out.println("<h1>Employee Added Successfully</h1>");

            } else {

                out.println("<h1>Failed To Add Employee</h1>");

            }

        } catch(Exception e) {

            out.println(e);

        }
    }
}