<%-- 
    Document   : admin
    Created on : Jan 9, 2021, 2:45:22 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
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
        </style>
    </head>
    <body>
        <p><font color="blue">Hello, ${sessionScope.fn}</font></p>
        <form action="process" method="POST">
            <input type="submit" value="Logout" name="btAction" onclick="return confirm('Are you sure to Logout ?')"/>
            <input type="submit" value="Add Food" name="btAction"/>
            <input type="submit" value="Recycle Bin" name="btAction"/>
        </form>
        <center>
            <h1>Welcome to HANA shop</h1>
            
            <form action="process" method="POST">
                <input type="submit" value="Home" name="bt" />
                <br/>
                <p><font color="grey">-This is admin page-</font></p>
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
        <c:if test="${empty food}">
            <center>
                <font color="grey">No food is available</font><br/>
            </center>
        </c:if>
        <form action="deletefood" method="POST">
            <section>
                <c:forEach var="f" items="${food}">
                    <div class="img">
                        <b>${f.fid}-${f.fname } (SL: ${f.quantity})</b> <br/> 
                        <img src="${f.fimg}" width="130"/> <br/>
                        <br/>
                        ${f.fprice }VNĐ <br/>
                        <a href="updateform?id=${f.fid}">Update</a>
                        --
                        <input type="checkbox" name="items" value="${f.fid}"/>
                    </div>
                </c:forEach>
            </section>
            <br/>
            <section>
            <input type="submit" value="Delete Selected Food" onclick="return confirm('Are you sure to delete seleted food ?')"/>
            </section>
        </form>
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
    </body>
</html>
