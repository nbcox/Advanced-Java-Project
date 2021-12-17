<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session Information</title>
    </head>
    <body>
        <%
            try {
                response.setContentType("text/html");
                PrintWriter writer = response.getWriter();
                writer.println("<html><body>");
                if (session == null) {
                    writer.println("You are not logged in");
                } else {
                    writer.println("Thank you, you are already logged in");
                    writer.println("Here is the data in your session");
                    Enumeration names = session.getAttributeNames();
                    while (names.hasMoreElements()) {
                        String name = (String) names.nextElement();
                        Object value = session.getAttribute(name);
                        writer.println("<p>name=" + name + " value=" + value);
                    }
                }
                writer.println(
                        "<p><a href=\"login.html\">Return" + "</a> to login page");
                writer.println("</body></html>");
                writer.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <a href='/logout'>logout</a>
    </body>
</html>
