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
