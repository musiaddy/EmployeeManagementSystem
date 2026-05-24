<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<%

int id =
Integer.parseInt(request.getParameter("id"));

Connection con =
DBConnection.getConnection();

String query =
"SELECT * FROM employees WHERE emp_id=?";

PreparedStatement pst =
        con.prepareStatement(query);

pst.setInt(1, id);

ResultSet rs = pst.executeQuery();

rs.next();

double salary =
rs.getDouble("salary");

double hra =
salary * 0.20;

double da =
salary * 0.10;

double bonus =
salary * 0.05;

double total =
salary + hra + da + bonus;

%>

<!DOCTYPE html>
<html>
<head>
    <title>Payslip</title>
</head>
<body>

<h1>Employee Payslip</h1>

<hr>

<h3>Name:
<%= rs.getString("name") %>
</h3>

<h3>Department:
<%= rs.getString("department") %>
</h3>

<hr>

<table border="1">

<tr>
    <th>Component</th>
    <th>Amount</th>
</tr>

<tr>
    <td>Basic Salary</td>
    <td><%= salary %></td>
</tr>

<tr>
    <td>HRA (20%)</td>
    <td><%= hra %></td>
</tr>

<tr>
    <td>DA (10%)</td>
    <td><%= da %></td>
</tr>

<tr>
    <td>Bonus (5%)</td>
    <td><%= bonus %></td>
</tr>

<tr>
    <td>Total Salary</td>
    <td><%= total %></td>
</tr>

</table>

</body>
</html>