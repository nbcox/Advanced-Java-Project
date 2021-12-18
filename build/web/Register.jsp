<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Confirmation</title>
        <link rel = "stylesheet" type = "text/css" href = "css/login_jsp.css">
    </head>
    <body>
        <div class="layout">
            <div class="content">
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
                <h2>Congratulations! Account successfully registered.</h2>
                <div>
                    <form action="login.html">
                        <button type="submit"><span></span>Login</button><br>
                    </form>
                </div>
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
            </div>
        </div>
    </body>
</html>
