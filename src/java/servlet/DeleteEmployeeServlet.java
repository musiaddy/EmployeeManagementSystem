/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
        Integer.parseInt(request.getParameter("id"));

        try {

            Connection con = DBConnection.getConnection();

            String query =
            "DELETE FROM employees WHERE emp_id=?";

            PreparedStatement pst =
                    con.prepareStatement(query);

            pst.setInt(1, id);

            pst.executeUpdate();

            response.sendRedirect("viewEmployees.jsp");

        } catch(Exception e) {

            response.getWriter().println(e);

        }
    }
}