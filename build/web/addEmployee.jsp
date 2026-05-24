<%-- 
    Document   : addEmployee.jsp
    Created on : 23 May 2026, 2:13:35 pm
    Author     : adityaraja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
</head>
<body>

    <h2>Add Employee</h2>

    <form action="AddEmployeeServlet" method="post">

        Name:
        <input type="text" name="name">
        <br><br>

        Email:
        <input type="email" name="email">
        <br><br>

        Department:
        <input type="text" name="department">
        <br><br>

        Salary:
        <input type="number" name="salary">
        <br><br>

        <input type="submit"
       value="Add Employee"
       onclick="this.disabled=true; this.form.submit();">
    </form>

</body>
</html>