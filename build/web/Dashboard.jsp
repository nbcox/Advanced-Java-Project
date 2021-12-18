<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel = "stylesheet" type = "text/css" href = "css/dashboard.css">
    </head>
    <body>
        <%
            PrintWriter writer = response.getWriter();
            session = request.getSession(false);
            if (session == null) {
                writer.println("You are not logged in");
            }
        %>
        <div class = "sideMenu">
            <ul>
                <li><a href="#">Dashboard Home</a></li>
                <li><a href="SessionInfo.jsp">Session Information</a></li>
                <li><a href="password.html">Change Password</a></li>
                <li><a href="Logout.jsp">Log Out</a></li>
            </ul>
        </div>
        <div class="content">
            <h1>User Management Web Application Dashboard</h1>
        </div>
    </div>
</body>
</html>
