<%-- 
    Document   : addform
    Created on : Jan 12, 2021, 3:35:43 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adding Food</title>
    </head>
    <body>
        <p><font color="blue">Hello, ${sessionScope.fn}</font></p>
        <form action="process" method="POST">
            <input type="submit" value="Back To Home" name="bt"/>
        </form>
        <center>
            <h1><font color="darkseagreen">Add Food Form</font></h1>
            <form action="addfood" method="POST">
                <table>
                    <c:set var="err" value="${requestScope.ERRORS}"/>
                    <tr>
                        <td><b>Name: </b></td>
                        <td><input type="text" name="name" value="${param.name}"/>(5-50 chars)</td>
                    </tr>
                    <c:if test="${not empty err.nameErr}">
                        <tr>
                            <td><font color="red">${err.nameErr}</font></td>
                        </tr>
                    </c:if>
                    <tr>
                        <td><b>Price: </b></td>
                        <td><input type="text" name="price" value="${param.price}"/> VNĐ</td>
                    </tr>
                    <c:if test="${not empty err.priceErr}">
                        <tr>
                            <td><font color="red">${err.priceErr}</font></td>
                        </tr>
                    </c:if>
                    <tr>
                        <td><b>Img URL: </b></td>
                        <td><input type="text" name="img" value="${param.img}"/></td>
                    </tr>
                    
                    <tr>
                        <td><b>Quantity: </b></td>
                        <td><input type="text" name="quantity" value="${param.quantity}"/></td>
                    </tr>
                    <c:if test="${not empty err.quantityErr}">
                        <tr>
                            <td><font color="red">${err.quantityErr}</font></td>
                        </tr>
                    </c:if>
                    <tr>
                        <td><b>Category: </b></td>
                        <td>
                            <select name="cbbox">
                                <c:forEach items="${sessionScope.cupdate}" var="c">
                                    <option>${c.cid}-${c.cname}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    
                </table>
                <br/>
                <input type="submit" name="" value="Add" onclick="return confirm('Are you sure to add ?')"/>
            </form>
        </center>
    </body>
</html>
