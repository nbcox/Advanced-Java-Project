<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session Information</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                font-family: sans-serif;
            }
            .sideMenu{
                background-color:rgba(0, 0, 0, 0.75);
                width: 250px;
                position: absolute;
                top: 0;
                bottom: 0px;
                align-items: center;
                padding-top: 100px;
            }
            .sideMenu ul li{
                list-style: none;
                display: inline-block;
                margin: 10px 20px;
                position: relative;
            }
            .sideMenu ul li a{
                display: block;
                color:white;
                text-decoration: none;
                padding: 20px 30px;
            }
            .sideMenu ul li::after{
                content: "";
                height: 3px;
                width: 0;
                background: #009688;
                position: absolute;
                left: 0;
                bottom: 0;
                transition: 0.5s;
            }
            .sideMenu ul li:hover::after{
                width: 100%;
            }
            body{
                width:100%;
                height: 100vh;
                background-image: linear-gradient(rgba(50, 50, 50, 0.75),rgba(20,20,20,0.75)),url("./Images/pageBackground.jpg");
                background-size: cover;
                background-position: center
            }
            .content{
                width: 50%;
                position: absolute;
                top: 30%;
                transform: translateX(+50%);
                color: #fff;
                border: 1px solid #ccc;
                box-sizing: border-box;
                padding: 15px;
                margin: 50px 0 50px 120px;
            }
            .content h1{
                font-size: 50px;
                text-align: center;
                font-family:sans-serif;
                margin-top:20px;
                margin-right:50px;
                color:white;
                text-decoration: none;
            }
            button{
                width: 80px;
                padding: 15px 0;
                text-align: center;
                margin: 20px 10px;
                border-radius: 25px;
                font-weight: bold;
                border: 2px solid #009688;
                background: transparent;
                color:#fff;
                cursor: pointer;
                position: relative;
                overflow: hidden;
            }
            .sideMenu h3{
                display: block;
                color:white;
                text-decoration: none;
                padding: 20px 30px;
            }
        </style>
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
            <h2>Thank you, you are already logged in</h2>
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
