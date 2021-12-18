<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome Page</title>
        <link rel = "stylesheet" type = "text/css" href = "css/welcome.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>
        <div class="banner">
            <div class = "nav">
                <ul>
                    <li> <a href = "#"> Home </a></li>
                    <li> <a href = "login.html"> Login </a></li>
                    <li> <a href = "register.html"> Register </a></li>
                </ul>
            </div>
        </div>
        <div class="content">
            <h1>Welcome to the User Management Web Application</h1>
            <div>
                <form action="login.html">
                    <button type="submit"><span></span>Login</button><br>
                </form>
                <form action="register.html">
                    <button type="submit"><span></span>Register</button><br>
                </form>
            </div>
        </div>
    </body>
</html>