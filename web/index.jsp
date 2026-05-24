<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <title>Employee Management System</title>

    <style>

        body{
            background-color:#f2f2f2;
            font-family:Arial;
            text-align:center;
        }

        .main-box{
            width:500px;
            margin:auto;
            margin-top:100px;
            background:white;
            padding:30px;
            border:1px solid gray;
        }

        h1{
            color:darkblue;
        }

        p{
            font-size:18px;
        }

        a{
            text-decoration:none;
        }

        .btn{
            background-color:darkblue;
            color:white;
            padding:12px 25px;
            border:none;
            font-size:16px;
            cursor:pointer;
        }

        .btn:hover{
            background-color:blue;
        }

    </style>

</head>

<body>

    <div class="main-box">

        <h1>
            Employee Management System
        </h1>

        <hr>

        <p>
            Advanced Java Project
        </p>

        <p>
            Manage Employees, Payslips and
            Authentication
        </p>

        <br>

        <a href="login.jsp">

            <button class="btn">
                Login Here
            </button>

        </a>

    </div>

</body>

</html>