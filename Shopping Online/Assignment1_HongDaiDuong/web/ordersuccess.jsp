<%-- 
    Document   : ordersuccess
    Created on : Jan 16, 2021, 10:50:35 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
    </head>
    <body>
    <center>
        <h1><font color="pink">Order Successfully</font></h1>
        <p>--- You order successfully at <b>${date}</b> ---</p>
        <p>--- Your order id: <b>${id}</b> ---</p>
        <h2><i>Thank you very much</i></h2>
        <form action="process" method="POST">
            <input type="submit" value="Home"/>
            <input type="submit" value="View History" name="btAction"/> 
        </form>
    </center>
    </body>
</html>
