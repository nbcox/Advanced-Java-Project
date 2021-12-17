<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Confirmation</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                font-family: sans-serif;
            }
        </style>
    </head>
    <body>
        <h1>Register Confirmation</h1>
        <%
            Connection conn = null;
            Statement stmt = null;
            try {
                conn = JdbcManager.getConnection();
                stmt = conn.createStatement();

                String sqlcmd = "insert into accounts values ('"
                        + request.getParameter("username") + "', '"
                        + request.getParameter("password") + "')";
                int result = stmt.executeUpdate(sqlcmd);

                if (result == 1) {
        %>
        Congratulations! Account successfully registered.
        <p><a href="login.html">Login</a></p>
        <%      } else {
        %>
        Data was not inserted into database. Reason for failure is unknown
        <%        }
        } catch (SQLException e) {
        %>
        <%= e.getMessage()%>

        <%
                e.printStackTrace();
            } finally {
                JdbcManager.close(stmt);
                JdbcManager.close(conn);
            }
        %>
    </body>
</html>
