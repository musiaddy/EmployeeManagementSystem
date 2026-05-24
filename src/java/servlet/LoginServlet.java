package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        Connection con = DBConnection.getConnection();

        try {

    String role =
    request.getParameter("role");

    String query =
    "SELECT * FROM users WHERE username=? AND password=? AND role=?";

    PreparedStatement pst =
            con.prepareStatement(query);

    pst.setString(1, username);
    pst.setString(2, password);
    pst.setString(3, role);

    ResultSet rs = pst.executeQuery();

    if(rs.next()) {

        HttpSession session =
                request.getSession();

        session.setAttribute("user", username);

        session.setAttribute("role", role);

        if(role.equals("admin")) {

            response.sendRedirect(
                    "adminDashboard.jsp"
            );

        } else {

            response.sendRedirect(
                    "employeeDashboard.jsp"
            );

        }

    } else {

        out.println(
        "<h1>Invalid Username or Password</h1>"
        );

    }

} catch(Exception e) {

    out.println(e);

}
    }
}