<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<%

String username =
(String)session.getAttribute("user");

Connection con =
DBConnection.getConnection();

String query =
"SELECT * FROM employees WHERE username=?";

PreparedStatement pst =
        con.prepareStatement(query);

pst.setString(1, username);

ResultSet rs = pst.executeQuery();

if(rs.next()) {

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
    <title>Employee Dashboard</title>
</head>
<body>

<h1>Welcome <%= rs.getString("name") %></h1>

<hr>

<h2>Employee Details</h2>

<p>
Department:
<%= rs.getString("department") %>
</p>

<p>
Email:
<%= rs.getString("email") %>
</p>

<hr>

<h2>Payslip</h2>

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
    <td>HRA</td>
    <td><%= hra %></td>
</tr>

<tr>
    <td>DA</td>
    <td><%= da %></td>
</tr>

<tr>
    <td>Bonus</td>
    <td><%= bonus %></td>
</tr>

<tr>
    <td>Total Salary</td>
    <td><%= total %></td>
</tr>

</table>

</body>
</html>

<%

}

%>