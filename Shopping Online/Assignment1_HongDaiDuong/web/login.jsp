<%-- 
    Document   : login
    Created on : Jan 9, 2021, 1:29:59 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <a href="process">Back</a>
        <center>
        <h1>HANA Shop</h1>
        <p><font color="grey">Please login to continue</font></p>
        <form action="process" method="POST">
            <table>
                <tr>
                    <td>Username: </td>
                    <td><input type="text" name="username" value="${param.username}" /></td>
                </tr>
                
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="password" value=""/></td>
                </tr>
                <c:if test="${not empty err}">
                   <font color="red">${err}</font>
                </c:if>
            </table>
            <br/>
            <input type="submit" value="Login" name="btAction" />
            
        </form>
        </center>
    </body>
</html>
