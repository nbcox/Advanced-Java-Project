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
            ResultSet rs = null;
            String user = request.getParameter("username");
            String password = request.getParameter("password");
            try {
                conn = JdbcManager.getConnection();
                stmt = conn.createStatement();

                String sqlcmd = "select * from accounts where username='"
                        + user + "' and password= '" + password + "'";
                rs = stmt.executeQuery(sqlcmd);

                rs.next();
                if (rs.getString("username").equals(user)
                        && rs.getString("password").equals(password)) {
                    session.setAttribute("username", user);
                    session.setAttribute("password", password);
        %>
        <h2>Congratulations! User successfully logged in.</h2>
        <p><a href="Dashboard.jsp">Go to Dashboard</a></p>
        <%
        } else {
        %>
        <h2>Invalid username or password</h2>
        <%
            }
        } catch (SQLException e) {
        %>
        <h2>Error! Could not login.</h2>
        <%= e.getMessage()%>
        <%
            } finally {
                JdbcManager.close(stmt);
                JdbcManager.close(conn);
                rs.close();
            }
        %>
    </body>
</html>
