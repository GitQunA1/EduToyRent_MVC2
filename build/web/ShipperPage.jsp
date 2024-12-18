<%-- 
    Document   : ShipperPage
    Created on : Nov 13, 2024, 1:16:02 PM
    Author     : HagiLee
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .SOD{
                width: 75%;
                margin: 0 auto;
                margin-top: 50px;
            }
            .ShowOrderDetail{
                margin-bottom: 20px;
                background-color: #EEEEEE;
                width: 1090px;
                height: auto;
                border-radius: 10px;
                padding-bottom: 20px; 
            }
            .info{
                display: flex;
                margin-left: 29px;
                padding-top: 10px;
                position: relative;
            }
            .info1 img{
                width: 120px;
                height: 120px;
            }
            .info1 a{
                font-size: 12px;
            }
            .info2{
                margin-left: 30px;
            }
            .info2 p {
                font-size: 20px;
                width: 820px;
                margin-bottom: 40px;
                line-height: 1.2em; /* Chiều cao của một dòng */
                max-height: 2.4em; /* Giới hạn chiều cao cho 2 dòng */
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: normal;
                display: block;
                word-break: break-word;
            }


            .info2 a{
                font-size: 10px;
            }
            .logout-btn-container {
                position: fixed;
                bottom: 20px;
                right: 20px;
            }
            .logout-btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                background-color: tomato;
                color: white;
                cursor: pointer;
                font-size: 16px;
            }
        </style>
    </head>
    <body>

        <c:if test="${not empty allODList}">

            <div class="SOD">
                <c:forEach var="OwnerODID" items="${allODList}">
                    <c:forEach var="product" items="${ProuductOrdered}">
                        <c:if test="${OwnerODID.pid == product.pid}">
                            <div class="ShowOrderDetail">
                                <div class="info">
                                    <div class="info1">
                                        <a>PID: ${OwnerODID.pid}</a><br>
                                        <img src="${product.image}"/>
                                    </div>
                                    <div class="info2">
                                        <p>${product.name}</p><br>
                                        <a>Số lượng: ${OwnerODID.quantity}</a><br>
                                        <c:if test="${OwnerODID.rentTime > 0}">
                                            <a>Thời gian thuê: ${OwnerODID.rentTime} ngày</a>
                                        </c:if>
                                    </div>
                                    <div class="info3">
                                        <form action="MainController" method="post">
                                            <input type="hidden" value="${OwnerODID.odid}" name="txtODID"/>
                                            <c:if test="${OwnerODID.rentTime > 0}">
                                                <c:if test="${not empty OwnerODID.dateEnd}">
                                                    <c:if test="${OwnerODID.status == 3}">
                                                        <input type="hidden" value="4" name="txtStatusUpdate"/>
                                                        <input type="submit" value="Đã nhận"/>
                                                    </c:if>
                                                    <c:if test="${OwnerODID.status == 4}">
                                                        <input type="hidden" value="5" name="txtStatusUpdate"/>
                                                        <input type="submit" value="Đã hoàn trả"/>
                                                    </c:if>
                                                </c:if>
                                              
                                                <c:if test="${empty OwnerODID.dateEnd}">
                                                    <input type="hidden" value="3" name="txtStatusUpdate"/>
                                                    <input type="hidden" value="${OwnerODID.rentTime}" name="txtRentTime"/>
                                                    <input type="submit" value="Đã giao"/>
                                                </c:if>
                                            </c:if>

                                            <c:if test="${OwnerODID.rentTime == 0}">
                                                <input type="hidden" value="9" name="txtStatusUpdate"/>
                                                <input type="submit" value="Đã giao"/>
                                            </c:if>
                                            <input type="hidden" value="UpdateOrder" name="action"/>   
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </div>
        </c:if>
        <div class="logout-btn-container">
            <form action="MainController" method="post">
                <button type="submit" class="logout-btn">Đăng xuất</button>
                <input type="hidden" name="action" value="LogoutController"/>
            </form>
        </div>
    </body>
</html>
