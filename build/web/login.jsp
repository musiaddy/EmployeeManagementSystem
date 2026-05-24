<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>

body{
    background-color:#f2f2f2;
    font-family:Arial;
}

.container{
    width:80%;
    margin:auto;
    margin-top:40px;
    background:white;
    padding:20px;
    border:1px solid #ccc;
}

h1,h2,h3{
    color:darkblue;
}

table{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}

table, th, td{
    border:1px solid gray;
}

th{
    background-color:darkblue;
    color:white;
    padding:10px;
}

td{
    padding:10px;
    text-align:center;
}

a{
    text-decoration:none;
    color:blue;
    font-weight:bold;
}

input[type=text],
input[type=password],
input[type=email],
input[type=number],
select{
    width:90%;
    padding:8px;
    margin-top:5px;
}

input[type=submit]{
    background-color:darkblue;
    color:white;
    padding:10px 20px;
    border:none;
    cursor:pointer;
}

input[type=submit]:hover{
    background-color:blue;
}

.form-box{
    width:350px;
    margin:auto;
    margin-top:50px;
    background:white;
    padding:20px;
    border:1px solid gray;
}

</style>
</head>
<body>

    <div class="form-box">

<h2 align="center">
    Employee Management Login
</h2>

<form action="LoginServlet" method="post">

        Username:
        <input type="text" name="username">
        <br><br>

        Password:
        <input type="password" name="password">
        <br><br>

        Role:
        <select name="role">

            <option value="admin">
                Admin
            </option>

            <option value="employee">
                Employee
            </option>

        </select>

        <br><br>

        <input type="submit" value="Login">

    </form>
    </div>
</body>
</html>