<%-- 
    Document   : viewhistory
    Created on : Jan 16, 2021, 1:09:38 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
        <style type="text/css">
            td{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <p><font color="green">Hello, ${sessionScope.fn}</font></p>
        <form action="process" method="POST">
            <input type="submit" value="Back To Home"/>
            <input type="submit" value="All Orders" name="btAction"/>
        </form>
    <center>
        <h1><font color="darkseagreen">History Order</font></h1>
        <p><font color="grey">** Date must be correct format dd/mm/yyyy - Ex: 12/01/2000 **</font></p>
        <p><font color="grey">** Name is name of food **</font></p>
        <form action="searchorder" method="POST">
            <input type="text" name="search" value="${param.search}" placeholder="Search by name or date"/>
            <input type="submit" value="Search"/>
        </form>
            <c:if test="${not empty order}">
                <c:if test="${empty value}">
                    <h3><font color="sienna">- All Orders - </font></h3>
                </c:if>
                <c:if test="${not empty value}">
                    <h3><font color="sienna">- Result of '${value}' -</font></h3>
                </c:if>    
            <c:set var="total" value="0"></c:set>
            <table width="60%" border="1">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Date</th>
                        <th>Order ID</th>
                        <th>Total Quantity</th>
                        <th>Total Price</th>
                        <th>Payment</th>
                        <th>Address</th>
                        <th>Option</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach var="o" items="${order}" varStatus="d">
                        <c:set var="total" value="${total + o.price}"></c:set>
                        <tr>
                            <td>${d.count}</td>
                            <td>${o.date}</td>
                            <td>${o.id}</td>
                            <td>${o.quantity}</td>
                            <td>${o.price}VNĐ</td>
                            <td>${o.payment}</td>
                            <td>${o.address}</td>
                            <td><a href="detail?id=${o.id}&date=${o.date}&total=${o.price}&pay=${o.payment}">Detail</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h3><font color="cadetblue">Total Used: ${total}VNĐ</font></h3>
            </c:if>
            <%--------%>  
            <c:if test="${empty detail}">
                <c:if test="${empty order}">
                    <c:if test="${empty test}">
                        <p><font color="grey">- Not yet order anything -</font></p>
                    </c:if>
                    <c:if test="${not empty test}">
                        <p><font color="grey">- No result -</font></p>
                    </c:if>    
                </c:if>
            </c:if>
            <%--------%>        
            <%--detail--%>
            <c:if test="${not empty detail}">
                <h3><font color="sienna">- Details - </font></h3>
                <p><b>Order ID: </b>${id}</p>
                <p><b>Date: </b>${date}</p>
                <p><b>Total: </b>${total}VNĐ</p>
                <p><b>Payment: </b>${pay}</p>
                <table width="60%" border="1">
                    <thead>
                        <tr>
                            <th>Number</th>
                            <th>Food Name</th>
                            <th>Food ID</th>
                            <th>Unit Price</th>
                            <th>Quantity</th>
                            <th>Total Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${detail}" varStatus="d">
                            <tr>
                                <td>${d.count}</td>
                                <td>${o.fname}</td>
                                <td>${o.fid}</td>
                                <td>${o.uprice}</td>
                                <td>${o.quantity}</td>
                                <td>${o.tprice}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
    </center>
</body>
</html>
