<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Confirmation</title>
    </head>
    <body>
        <h1>Login Confirmation</h1>
        <%
            Connection conn = null;
            Statement stmt = null;
            try {
                conn = JdbcManager.getConnection();
                stmt = conn.createStatement();

                String sqlcmd = "insert into accounts values ('"
                        + request.getParameter("user") + "', '"
                        + request.getParameter("password") + "')";
                int result = stmt.executeUpdate(sqlcmd);

                if (result == 1) {
        %>
        Data successfully inserted into database
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
