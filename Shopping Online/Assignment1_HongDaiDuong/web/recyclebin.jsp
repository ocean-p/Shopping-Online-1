<%-- 
    Document   : recyclebin
    Created on : Jan 11, 2021, 9:35:11 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recycle Bin</title>
        <style type="text/css">
           section {
                display: inline-block;
            }
            .img {
                text-align: center;
                border: 1px solid green;
                padding: 5px; 
                margin: 5px;
                height : 250px;
                width: 200px;
                float: left;
            }
        </style>
    </head>
    <body>
        <p><font color="blue">Hello, ${sessionScope.fn}</font></p>
        <form action="process" method="POST">
            <input type="submit" value="Back To Home" name="bt"/>
        </form>
        <br/>
        <form action="bin" method="POST">
            <input type="submit" value="Refresh" name="bt"/>
        </form>
        <center>
        <h1>Recycle Bin</h1>
        <p><font color="grey">-Please restore for updating-</font></p>
        <form action="searchinbin" method="POST">
            <input type="text" name="search" value="${param.search}" placeholder="Search by name"/>
            <input type="submit" value="Search" name="btAction" />
        </form>
        </center>
        
        <c:if test="${empty food}">
            <br/>
            <center>
                <font color="grey">No food was deleted</font><br/>
            </center>
        </c:if>
        <br/>
        <form action="restorefood" method="POST">
            <section>
                <c:forEach var="f" items="${food}">
                    <div class="img">
                        <b>${f.fid}-${f.fname } (SL: ${f.quantity})</b> <br/> 
                        <img src="${f.fimg}" width="130"/> <br/>
                        <br/>
                        ${f.fprice }VNĐ <br/>
                       
                        <input type="checkbox" name="items" value="${f.fid}"/>
                    </div>
                </c:forEach>
            </section>
            <br/>
            <section>
            <input type="submit" value="Restore Selected Food" onclick="return confirm('Are you sure to restore seleted food ?')"/>
            </section>
        </form>
    </body>
</html>
