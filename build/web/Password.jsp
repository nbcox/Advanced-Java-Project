<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel = "stylesheet" type = "text/css" href = "css/password_jsp.css">
    </head>
    <body>
        <div class = "sideMenu">
            <ul>
                <li><a href="Dashboard.jsp">Dashboard Home</a></li>
                <li><a href="SessionInfo.jsp">Session Information</a></li>
                <li><a href="password.html">Change Password</a></li>
                <li><a href="Logout.jsp">Log Out</a></li>
            </ul>
        </div>
        <div class="content">
            <h1>Change Password</h1>

            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                String user = (String) session.getAttribute("username");
                String password = (String) session.getAttribute("password");
                try {
                    conn = JdbcManager.getConnection();
                    stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
                            ResultSet.CONCUR_UPDATABLE);

                    String sqlcmd = "select * from accounts where username='"
                            + user + "'";
                    rs = stmt.executeQuery(sqlcmd);

                    rs.next();
                    if (rs.getString("username").equals(user)) {
                        rs.updateString("password", request.getParameter("password"));
                        rs.updateRow();
            %>
            <h2>Congratulations! Your password has been successfully changed.</h2>
            <%
                }
            } catch (SQLException e) {
            %>
            <h2>Error! Password could not be changed.</h2>
            <%= e.getMessage()%>
            <%
                } finally {
                    JdbcManager.close(stmt);
                    JdbcManager.close(conn);
                    rs.close();
                }
            %>
        </div>
    </div>
</body>
</html>
