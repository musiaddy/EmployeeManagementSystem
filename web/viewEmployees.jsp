<%-- 
    Document   : viewEmployees.jsp
    Created on : 23 May 2026, 2:23:57 pm
    Author     : adityaraja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Employees</title>
</head>
<body>

    <h2>Employee List</h2>
<h3>Sort By:</h3>

<a href="viewEmployees.jsp?sort=name">
    Name
</a>

|

<a href="viewEmployees.jsp?sort=department">
    Department
</a>

|

<a href="viewEmployees.jsp?sort=salary">
    Salary
</a>

<br><br>
    <table border="1">

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Salary</th>
            <th>Action</th>
            <th>edit</th>
            <th>PaySlip</th>
        </tr>

<%

int pageSize = 5;

int pageNumber = 1;

if(request.getParameter("page") != null){

    pageNumber =
    Integer.parseInt(request.getParameter("page"));

}

int start =
(pageNumber - 1) * pageSize;

try {

    Connection con = DBConnection.getConnection();

    String sort =
    request.getParameter("sort");

    String query =
    "SELECT * FROM employees";

    if(sort != null){

        query += " ORDER BY " + sort;

    }

    query += " LIMIT " + start + "," + pageSize;

    PreparedStatement pst =
            con.prepareStatement(query);

    ResultSet rs = pst.executeQuery();

    while(rs.next()) {

%>

        <tr>

            <td><%= rs.getInt("emp_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("department") %></td>
            <td><%= rs.getDouble("salary") %></td>
            <td>
    <a href="DeleteEmployeeServlet?id=<%= rs.getInt("emp_id") %>">
        Delete
    </a>
</td>
<td>
    <a href="editEmployee.jsp?id=<%= rs.getInt("emp_id") %>">
        Edit
    </a>
</td>
        <td>
    <a href="payslip.jsp?id=<%= rs.getInt("emp_id") %>">
        Payslip
    </a>
</td>
        </tr>

<%

        }

    } catch(Exception e) {

        out.println(e);

    }

%>

    </table>
<br><br>

<%

if(pageNumber > 1){

%>

<a href="viewEmployees.jsp?page=<%= pageNumber - 1 %>">
    Previous
</a>

|

<%

}

%>

<a href="viewEmployees.jsp?page=<%= pageNumber + 1 %>">
    Next
</a>
</body>
</html>