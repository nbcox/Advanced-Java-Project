<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session Information</title>
        <link rel = "stylesheet" type = "text/css" href = "css/dashboard.css">
    </head>
    <body>
        <div class = "sideMenu">
            <ul>
                <li><a href="Dashboard.jsp">Dashboard Home</a></li>
                <li><a href="#">Session Information</a></li>
                <li><a href="password.html">Change Password</a></li>
                <li><a href="Logout.jsp">Log Out</a></li>
            </ul>
        </div>
        <div class="content">
            <h1>Session Information</h1>
            <%
                try {
                    if (session == null) {
            %>
            <h2>You are not logged in</h2>
            <%
            } else {
            %>
            <h2>Here is the data in your session:</h2>
            <%
                Enumeration names = session.getAttributeNames();
                while (names.hasMoreElements()) {
                    String name = (String) names.nextElement();
                    Object value = session.getAttribute(name);
                    //writer.println("<p>name=" + name + " value=" + value);
%>
            <p>name=<%=name%>, value=<%=value%></p>
            <%
                        }
                    }
                    //writer.println(
                    //"<p><a href=\"login.html\">Return" + "</a> to login page");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </body>
</html>
