<%-- 
    Document   : editEmployee
    Created on : 23 May 2026, 4:53:52 pm
    Author     : adityaraja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<%

    int id =
    Integer.parseInt(request.getParameter("id"));

    Connection con = DBConnection.getConnection();

    String query =
    "SELECT * FROM employees WHERE emp_id=?";

    PreparedStatement pst =
            con.prepareStatement(query);

    pst.setInt(1, id);

    ResultSet rs = pst.executeQuery();

    rs.next();

%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
</head>
<body>

<h2>Edit Employee</h2>

<form action="UpdateEmployeeServlet" method="post">

    <input type="hidden"
           name="id"
           value="<%= rs.getInt("emp_id") %>">

    Name:
    <input type="text"
           name="name"
           value="<%= rs.getString("name") %>">
    <br><br>

    Email:
    <input type="text"
           name="email"
           value="<%= rs.getString("email") %>">
    <br><br>

    Department:
    <input type="text"
           name="department"
           value="<%= rs.getString("department") %>">
    <br><br>

    Salary:
    <input type="number"
           name="salary"
           value="<%= rs.getDouble("salary") %>">
    <br><br>

    <input type="submit" value="Update Employee">

</form>
<a href="LogoutServlet">Logout</a>
</body>
</html>
