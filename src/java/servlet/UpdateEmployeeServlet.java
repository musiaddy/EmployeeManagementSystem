package servlet;

import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
        Integer.parseInt(request.getParameter("id"));

        String name =
        request.getParameter("name");

        String email =
        request.getParameter("email");

        String department =
        request.getParameter("department");

        double salary =
        Double.parseDouble(request.getParameter("salary"));

        try {

            Connection con = DBConnection.getConnection();

            String query =
            "UPDATE employees SET name=?, email=?, department=?, salary=? WHERE emp_id=?";

            PreparedStatement pst =
                    con.prepareStatement(query);

            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, department);
            pst.setDouble(4, salary);
            pst.setInt(5, id);

            pst.executeUpdate();

            response.sendRedirect("viewEmployees.jsp");

        } catch(Exception e) {

            response.getWriter().println(e);

        }
    }
}