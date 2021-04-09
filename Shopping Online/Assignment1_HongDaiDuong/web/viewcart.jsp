<%-- 
    Document   : viewcart
    Created on : Jan 14, 2021, 1:30:48 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <style type="text/css">
            td{
                text-align: center;
            }
            span{
                padding: 20px;
                font-size: 20px;
            }
            a.minus,a.plus{
                text-decoration: none;
                padding: 10px;
                color: white;
            }
            a.minus{
                background-color: red;
            }
            a.plus{
                background-color: blue;
            }
        </style>
    </head>
    <body>
        <p><font color="green">Hello, ${sessionScope.fn}</font></p>
        <form action="process" method="POST">
            <input type="submit" value="Back To Home" name="bt"/>
        </form>
    <center>
        <h1><font color="darkseagreen">Your Cart</font></h1>
        <c:if test="${not empty message}">
            <p><font color="red">${message}</font></p>
        </c:if>
        <c:if test="${not empty success}">
            <p><font color="green">${success}</font></p>
        </c:if>    
        <c:if test="${not empty sessionScope.cart}">
            <form action="removecart" method="POST"> 
                <table width="80%" border="1">
                    <thead>
                        <tr>
                            <th>Number</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price/per 1</th>
                            <th>Quantity</th>
                            <th>Price/Quantity</th>
                            <th>Option</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:set var="total" value="0" scope="session"></c:set>
                        <c:forEach var="c" items="${sessionScope.cart}" varStatus="d">
                            <c:set var="total" value="${total + c.fd.fprice*c.quantity}" scope="session"></c:set>
                            <tr>
                                <td>${d.count}</td>
                                <td>${c.fd.fname}</td>
                                <td><img src="${c.fd.fimg}" width="80"/></td>
                                <td>${c.fd.fprice}</td>
                                <td><span><a href="minus?id=${c.fd.fid}" class="minus">-</a></span>${c.quantity}<span><a href="plus?id=${c.fd.fid}" class="plus">+</a></span></td>
                                <td>${c.fd.fprice*c.quantity}</td>
                                <td><input type="checkbox" value="${c.fd.fid}" name="items"/></td>

                            </tr>

                        </c:forEach>
                    </tbody>
                    <tr>
                        <td colspan="5"><b>Total: </b></td>
                        <td><b>${total} VNĐ</b></td>
                        <td><input type="submit" value="Remove" onclick="return confirm('Are you sure to remove ?')"/></td>
                    </tr>

                </table>
            </form>               
            <br/>
            <form action="order" method="POST">
                <b>Payment*: </b><select name="payment">
                    <option>COD</option>
                    <option>Momo</option>
                    <option>Banking</option>
                </select><br/>
                <br/>
                <b>Address*: </b><input type="text" name="address" value="${param.address}" /><br/>
                <c:if test="${not empty addresserr}">
                    <p><font color="red">${addresserr}</font></p>
                </c:if>
                
                <br/>
                <input type="submit" value="Order" onclick="return confirm('Are you sure to order ?')"/>
            </form>
        </c:if>
            

        <c:if test="${empty sessionScope.cart}">
            <p><font color="grey">No food in cart</font></p>
        </c:if>
        <c:if test="${not empty quantityErr}">
        <br/>
            <c:forEach var="e" items="${quantityErr}">
                <font color="red">'${e}'-</font>
            </c:forEach>
                <p><font color="red">greater than available quantity</font></p>
        </c:if>
        <c:if test="${not empty deleteErr}">
        <br/>
            <c:forEach var="e" items="${deleteErr}">
                <font color="red">'${e}'-</font>
            </c:forEach>
                <p><font color="red">This food was not available.</font></p>
        </c:if>            
    </center>
</body>
</html>
