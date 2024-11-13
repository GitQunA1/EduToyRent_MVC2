<%-- 
    Document   : ViewShopPage
    Created on : Oct 19, 2024, 4:59:01 PM
    Author     : Quyền
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-color: #F5F5FA;
                width: 100%;
                height: 100%;
            }
           .history_page{
                background-color: #E0E0E0;
                width: 100%;
                height: 25px;
                margin-top: 120px;
                margin-bottom: 10px;
            }
            .history_page a{
                margin-left: 70px;
            }
            .history_page a:hover{
                cursor: pointer;
            }
            .background_view_shop{
                background-color:#EAEAEA;
                width: 91%;
                height: auto;
                margin-top: 10px;
                margin-left: 70px;
                border-radius: 10px;
                padding-bottom: 20px;
                margin-bottom: 10px;
            }
            .shop_view img{
                width: 45px;
                height: 45px;
                border-radius: 25px;
                margin-top: 20px;
                margin-left: 20px;
            }
            .shop_view a{
                margin-left: 10px;
                margin-right: 200px;
            }
            .line{
                background-color: black;
                width: 100%;
                height: 1px;
                margin-top: 20px;
            }
            /* Bố cục chính của các sản phẩm */
            .Show_product {
                display: grid;
                grid-template-columns: repeat(7, 1fr);
                gap: 10px; /* Khoảng cách giữa các sản phẩm */
                padding: 10px;
            }

            .Show_product img {
                width: 100%;
                height: 180px; 
                border-radius: 5px;
                
                
            }

            .Show_product .product-box {
                display: flex;
                flex-direction: column; 
                justify-content: space-between;
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 13px;
                text-align: center;
                background-color: white;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                height: 300px; 
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
                background-color: #41B6A2;
                border: none;
                color: white;
                border-radius: 5px;
                cursor: pointer;
                
            }

             /* ------------------------------------------- */
            
        </style>
    </head>
    <body>
        
        <%@include file="UserNavigation.jsp" %>
        <div class="history_page">
            <a onclick="window.history.back()">Quay lại trang trước đó</a>
        </div>
        
        <div class="background_view_shop">
            <div class="shop_view">
                <img src="${shop.avatar}" />
                <a>${shop.name}</a>
            </div>
            <div class="line"></div>
            
            <div class="Advertising">
                <div class="Show_product">
                    <c:forEach var="list" items="${productOfShop}">
                        <div class="product-box">
                            <a href="MainController?txtPID=${list.pid}&action=viewProduct">
                                <img src="${list.image}"/>
                                <p>${list.name}</p>
                                <a>Giá: <fmt:formatNumber value="${list.price}" pattern="#,###"></fmt:formatNumber> đ </a>
                            </a>
                        </div>
                    </c:forEach>                       
                </div>   
            </div> 
        </div>
        <%@include file="HeaderPage.jsp" %>
    </body>
</html>
