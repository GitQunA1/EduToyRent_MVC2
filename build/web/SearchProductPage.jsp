<%-- 
    Document   : SearchProductPage
    Created on : Oct 21, 2024, 1:20:23 PM
    Author     : Quyền
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            body{
                background-color: #EAEAEA;
            }
            .Advertising{
               
                background-color: #FFBCDD;
                padding-top: 20px;
                margin-left: 70px;
                margin-right: 70px;
                border-radius: 10px;
                margin-bottom: 50px;
                padding-bottom: 100px;
            }
            .Show_product {
                display: grid;
                grid-template-columns: repeat(7, 1fr);
                gap: 10px; /* Khoảng cách giữa các sản phẩm */
                padding: 10px;
                
            }

            .Show_product img {
                width: 157px;
                height: 180px; 
                border-radius: 5px;
                object-fit: cover; 
            }

            .Show_product .product-box {
                display: flex;
                flex-direction: column; 
                justify-content: space-between;
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 13px;
                text-align: center;
                background-color: #f9f9f9;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                height: 350px; 
            }

            
            .Show_product p {
                margin: 10px 0;
                font-weight: bold;
                font-size: 15px;
                display: -webkit-box;
                -webkit-line-clamp: 2; /* Hiển thị tối đa 2 dòng */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis; 
                max-height: 40px; 
            }

            .Show_product a {
                
                display: block;
                font-size: 17px;
                color: #333;
            }
            .Show_product form {
                margin-top: 10px;
            }

            .product-box input[type="submit"] {
                margin-top: 10px;
                height: 25px;
                background-color: #FFBD68;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                
            }
            .product-box{
                margin-bottom: 20px;
            }
        </style>
        
    </head>
    <body>
        <%@include file="UserNavigation.jsp" %>
        
        <c:choose>
            <c:when test="${not empty ProductSearch}">
                <div style="margin-top: 123px;" class="Advertising">
                    <div class="Show_product">
                        <c:forEach var="procuct" items="${ProductSearch}">
                            <div class="product-box">
                                <a href="MainController?txtPID=${procuct.pid}&action=viewProduct">
                                    <img src="${procuct.image}"/>
                                    <p><c:out value="${procuct.name}"></c:out></p>
                                    <a>Giá: <fmt:formatNumber value="${procuct.price}" pattern="#,###"></fmt:formatNumber> đ </a>
                                    </a>
                                    <form action="MainController" method="post">
                                        <input type="hidden" value="${procuct.pid}" name="txtPID"/>   
                                    <input type="hidden" value="AddCart" name="action"/>
                                    <input type="submit" value="Thêm vào giỏ hàng" />
                                </form>
                            </div>
                        </c:forEach>                       
                    </div> 
                </div>
            </c:when>
            <c:otherwise>
                <div style="align-items: center; height: 100%; display: flex; justify-content: center;">
                    <c:out value="Không tìm thấy sản phẩm"></c:out>
                </div>               
            </c:otherwise>
        </c:choose>

        
    </body>
</html>
