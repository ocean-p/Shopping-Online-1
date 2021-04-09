<%-- 
    Document   : updateform
    Created on : Jan 12, 2021, 1:06:04 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating Food</title>
    </head>
    <body>
        <p><font color="blue">Hello, ${sessionScope.fn}</font></p>
        <form action="process" method="POST">
            <input type="submit" value="Back To Home" name="bt"/>
        </form>
        <br/>
        
        <center>
            <h1><font color="darkseagreen">Update Food Form</font></h1>
            <form action="updatefood" method="POST">
                <table>
                    <c:set var="err" value="${requestScope.ERRORS}"/>
                    <c:set var="f" value="${sessionScope.fupdate}"/>
                    <tr>
                        <td><b>Create Time: </b></td>
                        <td>${f.createtime}</td>
                    </tr>
                    <tr>
                        <td><b>ID: </b></td>
                        <td>${f.fid}</td>
                    </tr>
                    
                    <tr>
                        <td><b>Name: </b></td>
                        <td><input type="text" name="name" value="${f.fname}"/>(5-50 chars)</td>
                    </tr>
                    <c:if test="${not empty err.nameErr}">
                        <tr>
                            <td><font color="red">${err.nameErr}</font></td>
                        </tr>
                    </c:if>
                    <tr>
                        <td><b>Price: </b></td>
                        <td><input type="text" name="price" value="${f.fprice}"/> VNĐ</td>
                    </tr>
                    <c:if test="${not empty err.priceErr}">
                        <tr>
                            <td><font color="red">${err.priceErr}</font></td>
                        </tr>
                    </c:if>
                    <tr>
                        <td><b>Img URL: </b></td>
                        <td><input type="text" name="img" value="${f.fimg}"/></td>
                    </tr>
                    
                    <tr>
                        <td><b>Quantity: </b></td>
                        <td><input type="text" name="quantity" value="${f.quantity}"/></td>
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
                                    <option ${f.cid==c.cid?"selected":""}>${c.cid}-${c.cname}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <input type="hidden" name="id" value="${f.fid}"/>
                    <input type="hidden" name="isdelete" value="${f.isdelete}"/>
                    <input type="hidden" name="time" value="${f.createtime}"/>
                </table>
                <br/>
                <input type="submit" name="" value="Update" onclick="return confirm('Are you sure to update ?')"/>
            </form>
        </center>
    </body>
</html>
