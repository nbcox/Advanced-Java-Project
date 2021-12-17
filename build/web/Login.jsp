<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.apress.jdbc.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Confirmation</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                font-family: sans-serif;
            }
            .layout{
                width:100%;
                height: 100vh;
                background-image: linear-gradient(rgba(50, 50, 50, 0.75),rgba(20,20,20,0.75)),url("./Images/pageBackground.jpg");
                background-size: cover;
                background-position: center;
            }
            .content{
                width: 100%;
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                text-align: center;
                color: #fff;
            }
            .content h1{
                font-size: 50px;
            }
            button{
                width: 200px;
                padding: 15px 0;
                text-align: center;
                margin: 20px 10px;
                border-radius: 25px;
                font-weight: bold;
                border: 2px solid #009688;
                background: transparent;
                color: #fff;
                cursor: pointer;
                position: relative;
                overflow: hidden;
            }
            span{
                background: #009688;
                height: 100%;
                width: 0%;
                border-radius: 25px;
                position: absolute;
                left: 0;
                bottom: 0;
                z-index: -1;
                transition: 0.5s;
            }
        </style>
    </head>
    <body>
        <div class="layout">
            <div class="content">
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
                <div>
                    <form action="Dashboard.jsp">
                        <button type="submit"><span></span>Enter Dashboard</button><br>
                    </form>
                </div>
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
            </div>
        </div>
    </body>
</html>
