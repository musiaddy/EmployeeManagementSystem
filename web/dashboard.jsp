<%-- 
    Document   : dashboard.jsp
    Created on : 23 May 2026, 2:01:41 pm
    Author     : adityaraja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("user");

    if(user == null){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>

    <h1>Welcome Admin</h1>

</body>
</html>