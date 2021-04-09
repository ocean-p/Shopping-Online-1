<%-- 
    Document   : home
    Created on : Jan 9, 2021, 1:41:56 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style type="text/css">
            section{
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
            td{
                border: 1px solid orange;
                padding: 10px;
                margin-top: 5px;
                width: 100px;
                text-align: center;
                border-radius: 5px;
            }
            a.cate{
                text-decoration: none;
                color: olive;
                font-style: oblique;
            }
            td:hover{
                background-color: lightgrey;
            }
            .page{
                border: 1px solid grey;
                width: 30px;
                padding: 5px;
            }
            .paging{
                text-decoration: none;
            }
            .bs{
                text-align: center;
                border: 1px solid green;
                padding: 5px; 
                margin: 5px;
                height : 250px;
                width: 200px;
            }
            
        </style>
    </head>
    <body>
        <center>
            <h1>Welcome to HANA shop</h1>
            <form action="process" method="POST">
                <input type="submit" value="Home" name="bt" />
                <input type="submit" value="Top 5 New" name="btAction"/>
                <input type="submit" value="Best Seller" name="btAction"/><br/>
                <br/>
                <font color="grey">Please <a href="login.jsp">Login</a> to buy food</font><br/>
                <br/>
                <input type="text" name="search" value="${param.search}" placeholder="Search by name"/>
                <input type="submit" value="Search" name="btAction" />
            </form>
            <br/>
            <form action="money" method="POST">
                <input type="text" name="from" value="${param.from}" placeholder="From"/>VNĐ
                <input type="text" name="to" value="${param.to}" placeholder="To"/>VNĐ
                <input type="submit" value="Search" name="btAction" />
            </form>    
            <br/>
            <table>
                <tr>
                    <c:forEach var="c" items="${category}">
                        <td style="${c.cid==cateid? "background-color:lightgrey":""}"><a class="cate" href="category?id=${c.cid}" >${c.cname}</a></td>
                    </c:forEach>
                </tr>
            </table>
                   
        </center>
        <br/>
        <%--Empty List--%>
        <c:if test="${empty food}">
            <c:if test="${empty best}">    
                <center>
                    <font color="grey">No food is available</font><br/>
                </center>
            </c:if>
        </c:if>
        <%------------------------%>
        <%--List food--%>
        <section>
            <c:if test="${not empty top5food}">
                <font color="purple"><h3>${top5food}</h3></font>
            </c:if>
            <c:forEach var="f" items="${food}">
                <c:if test="${f.quantity>0}">
                <div class="img">
                    <b>${f.fname}</b> (SL: ${f.quantity})<br/>
                    
                    <img src="${f.fimg}" width="150"/> <br/>
                    <br/>
                    ${f.fprice }VNĐ <br/>
                    
                </div>
                </c:if>
            </c:forEach>
        </section>
        <%-----------------------------%>
            <%--Paging--%>
            <c:if test="${page > 1}">
                <center>
                <br/>
                <table>
                    <tr>
                        <c:forEach begin="1" end="${page}" var="i">
                            <td class="page" style="${number == i? "background-color:dodgerblue":""}"><a class="paging" href="process?index=${i}">${i}</a></td>
                        </c:forEach>
                    </tr>
                </table>
                </center>    
            </c:if>
            <%-------------------%>
        <%--Best Seller--%>
        <c:if test="${not empty best}">
            <center>
                <h3><font color="purple"><i>Best Seller</i></font></h3>
                <div class="bs">
                    <b>${best.fname}</b> (SL: ${best.quantity})<br/>
                    
                    <img src="${best.fimg}" width="150"/> <br/>
                    <br/>
                    ${best.fprice }VNĐ <br/>
                    
                </div>
            </center>
        </c:if>
    </body>
</html>
