<%-- 
    Document   : ViewProductPage
    Created on : Oct 19, 2024, 4:57:51 PM
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
                background-color: #efefef;
            }
            .Advertising{
                background-color: white;
                margin-left: 70px;
                margin-right: 70px;
                border-radius: 10px;                              
                height: 500px;
                display: flex;
                margin-bottom: 20px;
                margin-top: 10px;
            }
            .Advertising_Content{
                background-color: white;
                margin-left: 70px;
                margin-right: 70px;
                border-radius: 10px;
                height: auto;
                padding-top: 10px;
                padding-bottom: 30px;
            }
            .img_product img{
                width: 380px;
                height: 450px;
                margin-left: 80px; 
                margin-top: 25px;
                border: 1px solid black; 
                border-radius: 10px;
            }
            .body_product{          
                margin-left: 70px; 
                position: relative;
            }
            .body_product p{
                font-size: 27px;
                font-weight: bold; 
                margin-right: 50px;
                line-height: 1.3;
                display: -webkit-box;
                -webkit-line-clamp: 2; /* Hiển thị tối đa 2 dòng */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis; 

            }
            .buttont_add input{
                width: 170px;
                height: 35px;
                border-radius: 10px;
                margin-top: 30px;
                background-color: white;
                border: none;              
            } 
            .buttont_add input[type="submit"]{
                margin-left: 150px;
                background-color: #FFBD68;
            }
            .Advertising_Content p{
                padding-left: 20px;
                margin-left: 50px;
                line-height: 1.6;
                margin-right: 100px;
                font-size: 17px;
            }
            .Advertising_Content a{
                margin-left: 71px;
                font-size: 18px;
            }
            .Advertising_Content h2{
                font-size: 25px;
                text-decoration: underline;
                margin-left: 50px;
            }
            /* Bố cục chính của các sản phẩm */
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
                color: #333;
                border: none;
                border-radius: 5px;
                cursor: pointer;

            }

            /* ------------------------------------------- */
            .detail_shop_product{
                background-color: white;
                margin-left: 70px;
                margin-right: 70px;
                border-radius: 10px;
                height: auto;
                padding-top: 10px;
                padding-bottom: 30px;
                margin-top: 20px;
            }
            .shop_owner{
                margin-left: 10px;
            }
            .line{
                background-color: black;
                height: 2px;
                width: 99.3%;
                margin-top: 10px;

            }
            .shop_owner_Content{
                display: flex;
            }
            .shop_owner_Content a{
                margin-left: 20px;
                font-size: 16px;
                margin-top: 10px;
                flex-grow: 1;  
                margin-right: 15px;
            }
            .shop_owner_Content img{
                width: 50px;
                height: 50px;
                border-radius: 30px;
                border: 2px solid black; 
                margin-left: 20px;
            }
            .shop_owner_Content input[type="submit"]{
                width: 100px;
                height: 30px;
                background-color: white;
                margin-right: 110px;
                margin-top: 10px;
                border-radius: 10px;
            }
            .Shop_Product_content{
                display: flex;
                margin-left: 50px;
            }
            .Shop_Product_content a{
                margin-left: 800px;
                margin-top: 15px;
                color: black;
            }
            .description{
                margin-left: 120px;
            }
            .quantity-container {  
                margin-left: 100px;
            }
            .quantity-container a{
                font-size: 23px;

            }

            .quantity-btn {
                width: 30px;
                height: 20px;
                background-color: #37A28F;
                color: white;
                border: none;
                text-align: center;
                cursor: pointer;
                font-size: 18px;
                margin: 0 10px;
                border-radius: 5px;
            }

            .quantity-btn:hover {
                background-color: #197878;
            }

            #quantity {
                width: 70px; 
                height: 25px;
                text-align: center;
                border: 1px solid #ccc;
                border-radius: 5px;

            }
            #quantityRent{
                width: 70px; 
                height: 25px;
                text-align: center;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .quantity-container button{
                margin-top: 30px;
                width: 40px;
                height: 25px;
            }
            .body_buy_product{
                position: absolute;
                bottom: 70px; 

            }
            .duration-button {
                margin: 5px; 
                background-color: #ccc;
                color: #333;
                cursor: pointer;
                border-radius: 5px;
            }
            .duration-button.active {
                background-color: #37A28F; 
                color: white;
            }
            .rental-duration button{
                width: 100px;
                background-color: white;

            }
            .rental-duration{
                margin-left: 95px;
                position: absolute;
                bottom: 150px;
                display: flex;
                height: 33px;
            }
            .hidden {
                display: none;
            }
            .visible {
                display: block;
            }
            quantity-container-Rent{
                align-items: center;
                jutify-content: center;

            }
            .quantity-container-Rent a{
                font-size: 23px;
                margin-left: 100px;

            }
            .quantity-container-Rent button{
                margin-top: 30px;
                width: 40px;
                height: 25px;
            }
            .Notification{
                position: absolute;
                bottom: 110px;
                margin-left: 135px;
                font-size: 17px;
            }
            .buyOrRent{
                display: flex;
                margin-left: 50px;
            }
            .buyOrRent a{
                color: black;
                margin-top: 15px;
                margin-left: 1000px;
            }
            .background_comment {
                height: auto;
                background-color: white;
                margin-left: 70px;
                margin-right: 70px;
                border-radius: 10px;                                              
                margin-top: 10px;
                margin-bottom: 20px;
                border-radius: 10px;
                padding-top: 10px;
                padding-bottom: 20px;
            }

            .comment {
                background-color: #efefef;
                width: 90%;
                max-width: 975px;
                margin: 0 auto;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 10px;
                
            }

            .user_comment {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 10px;
                position: relative;
            }

             .user_comment{
                display: flex;
                position: relative;
            }
             .user_comment img{
                width: 40px;
                height: 40px;
                border-radius: 20px;
                margin-left: 10px;
                margin-top: 5px;
            }
            .user_comment a{
                position: absolute;
                margin-left: 60px;
                padding-right: 290px;
                
            }
            .user_comment p{
                margin-left: 760px;
                text-transform: uppercase;
                bottom: 5px;
                position: absolute;
                bottom: -17px;
            }

            .background_content_comment {
                background-color: white;
                border: 1px solid #ccc;
                padding: 15px;
                border-radius: 10px;
                margin-top: 10px;
            }

            .satisfaction {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
                color: #444;
            }

            .content_comment_user {
                display: block;
                margin-bottom: 15px;
                padding-right: 30px;
                white-space: pre-wrap;
                word-wrap: break-word;
                font-size: 15px;
                color: #333;
                margin-left: 20px;
            }

            .img_comment {
                width: 100px;
                height: 100px;
                border-radius: 8px;
                margin-top: 10px;
                margin-left: 20px;
            }

            .line_comment {
                background-color: #D3D3D3;
                width: 100%;
                height: 1px;
                margin: 15px 0;
            }

            .shop_satisfaction {
                color: #888;
                font-size: 14px;
                display: block;
                margin-left: 45px;
                margin-top: -30px;
                margin-right: 290px;
            }
            .Comment_frame{
                overflow-y: auto;
                background-color: white;
                margin-left: 70px;
                margin-right: 70px;
                border-radius: 10px;                                              
                margin-top: 10px;
                border-radius: 10px;               
                scrollbar-width: none; 
                -ms-overflow-style: none;
                 max-height: 2000px;
                margin-bottom: 20px;
            }
            .background_comment h3{
                margin-left: 30px;
            }
            .shop_comment_img{
                width: 25px;
                height: 25px;
                border-radius: 20px;
                margin-left: 10px;
               
            }
            .content_comment_shop{
                color: #888;
                font-size: 14px;
                display: block;
                margin-left: 60px;
                margin-top: 20px;
            }
            .time_comment_shop{
                color: #888;
                font-size: 14px;
                display: block;
                margin-top: -16px;
                margin-left: 750px;
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
        </style>

    </head>
    <body>
        <%@include file="UserNavigation.jsp" %>
        <div class="history_page">
                    <a onclick="window.history.back()">Quay lại trang trước đó</a>
        </div>
        
        <div class="Advertising">
            <div class="img_product">
                <img  src="${productDetail.image}"/>  
            </div>
            <div class="body_product">
                <p>${productDetail.name}</p> 
                <div class="body_and_buttom">
                    <c:choose>
                        <c:when test="${productDetail.qRent > 0}">
                            <div class="body_buy_product">
                                <div class="rental-duration">
                                    <button class="duration-button active" onclick="selectDuration(this, '7')">1 Tuần</button>
                                    <button class="duration-button" onclick="selectDuration(this, '14')">2 Tuần</button>
                                    <button class="duration-button" onclick="selectDuration(this, '30')">1 Tháng</button>
                                </div>

                                <form class="buttont_add" action="MainController" method="post">

                                    <div class="quantity-container-Rent" style="margin-bottom: 135px;">
                                        <a>Giá: <fmt:formatNumber value="${productDetail.price}" pattern="#,###"></fmt:formatNumber> đ</a><br>
                                            <a>Số lượng:</a>

                                            
                                            <input type="text"  value="1" name="txtQuantity" readonly>
                                            
                                            <input type="hidden" value="${productDetail.price}" name="txtPrice">
                                        <input type="hidden" value="${productDetail.pid}" name="txtPID"/>
                                        <input type="hidden" id="selectedDuration" name="selectedDuration" value="7"> 
                                        <input type="hidden" value="AddToCart" name="action"/>
                                    </div>
                                    <a class="Notification">${success}</a>
                                    <input type="submit" value="Thêm vào giỏ hàng"/>
                                </form>
                            </div>

                        </c:when>
                        <c:otherwise>
                            <div class="body_buy_product">
                                <form class="buttont_add" action="MainController" method="post">
                                    <div class="quantity-container" style="margin-bottom: 105px;">
                                        <a>Giá: <fmt:formatNumber value="${productDetail.price}" pattern="#,###"></fmt:formatNumber> đ</a><br>
                                            <a>Số lượng:</a>
                                            <button type="button" class="quantity-btn" onclick="decreaseQuantity()">-</button>
                                            <input type="text" id="quantity" value="1" name="txtQuantity" readonly>
                                            <button type="button" class="quantity-btn" onclick="increaseQuantity()">+</button>
                                        </div>
                                        <input type="hidden" value="${productDetail.price}" name="txtPrice">
                                    <input type="hidden" value="${productDetail.pid}" name="txtPID"/>
                                    <input type="hidden" name="selectedDuration" value="0">  
                                    <input type="hidden" value="AddToCart" name="action"/>
                                    <a class="Notification">${success}</a>
                                    <input type="submit" value="Thêm vào giỏ hàng"/>                              
                                </form>
                            </div>    
                        </c:otherwise>
                    </c:choose>

                </div>       
            </div>
        </div>

        <div class="Advertising_Content">
            <h2>Mô tả sản phẩm</h2>
            <p class="description_name">Tên sản phẩm: ${productDetail.name}</p>
            <p>Thương hiệu: ${productDetail.brand}</p>
            <p>Xuất sứ: ${productDetail.origin}</p>           
            <p>Thể loại: ${productDetail.category}</p>
            <p>Độ tuổi sử dụng: ${productDetail.age}+ </p>
            <a>Nội dung mô tả:</a>
            <p style="margin-left: 100px;">
                <c:out value="${description}" escapeXml="false" />
            </p>
        </div>

        <div class="detail_shop_product">
            <c:choose>
                <c:when test="${productDetail.qSell > 0 and productDetail.type == 1}">
                    <div class="shop_owner">
                        <div class="shop_owner_Content">

                            <img src="<c:out value="${shop.avatar}"></c:out>" />
                            <a><c:out value="${shop.name}"></c:out></a>
                            <c:set var="soid" value="${shop.soid}"></c:set>
                                
                        </div>                        
                        <div class="line"></div>

                    </div>

                    <div class="Shop_information_product">
                        <div class="Shop_Product_content">
                            <p>Top sản phẩm bán chạy trong ngày</p>
                            <a href="MainController?action=ViewShop&txtSOID=${soid}">Xem thêm sản phẩm từ shop</a>
                        </div>
                        <div class="Show_product">
                            <c:forEach var="procuct" items="${highIncList}">
                                <div class="product-box">
                                    <a href="MainController?txtPID=${procuct.pid}&action=viewProduct">
                                        <img src="${procuct.image}"/>
                                        <p>${procuct.name}</p>
                                        <a>Giá: <fmt:formatNumber value="${procuct.price}" pattern="#,###"></fmt:formatNumber> đ </a>
                                        </a>
                                        
                                </div>
                            </c:forEach>  
                        </div>
                    </div> 
                </c:when>
                <c:otherwise>

                    <div class="Shop_information_product">
                        <div class="buyOrRent">
                            <p>Sản phẩm liên quan</p>
                            <c:if test="${productDetail.qSell == 1 and productDetail.type == 2}">
                                <a  href="MainController?action=ProductFilter&txtOption=2">Xem thêm sản phẩm</a>
                            </c:if>
                            <c:if test="${productDetail.qRent == 1 and productDetail.type == 2}">
                                <a  href="MainController?action=ProductFilter&txtOption=1">Xem thêm sản phẩm</a>
                            </c:if>
                        </div>
                        <div class="Show_product">
                            <c:forEach var="procuctcus" items="${listproduct}">
                                <div class="product-box">
                                    <a href="MainController?txtPID=${procuctcus.pid}&action=viewProduct">
                                        <img src="${procuctcus.image}"/>
                                        <p>${procuctcus.name}</p>
                                        <a>Giá: <fmt:formatNumber value="${procuctcus.price}" pattern="#,###"></fmt:formatNumber> đ </a>
                                    </a>
                                </div>
                            </c:forEach>  
                        </div>
                    </div> 
                </c:otherwise>
            </c:choose>        
        </div>


        <div class="background_comment">
            <h3>Khách hàng đánh giá</h3>
            <c:choose>
                <c:when test="${ not empty comment}">
                    <div class="Comment_frame">
                        <c:forEach var="comment" items="${comment}">
                            <div class="comment">
                                <div class="user_comment">
                                    <c:forEach var="custom" items="${customerList}">
                                        <c:if test="${comment.uid == custom.uid}">
                                            <img src="${custom.avatar}" />
                                            <a>${custom.name}</a>
                                        </c:if>
                                    </c:forEach>
                                    <p><fmt:formatDate value="${comment.date}" pattern="dd-MM-yyyy HH:mm:ss"></fmt:formatDate></p>
                                    </div>
                                    <div class="background_content_comment">
                                        <a class="satisfaction">Độ hài lòng: ${comment.satisfaction}</a>
                                    <a class="content_comment_user">${comment.comment}</a>
                                    <c:if test="${ not empty comment.image}">
                                        <img class="img_comment" src="${comment.image}" />
                                    </c:if>
                                    <div class="line_comment" ></div>

                                    <img class="shop_comment_img" src="${shop.avatar}"/>
                                    <a class="shop_satisfaction">${shop.name} đã trả lời</a>
                                    <c:forEach var="rep" items="${reply}">
                                        <c:if test="${comment.cid == rep.cid}">
                                            <a class="time_comment_shop"><fmt:formatDate value="${reply.date}" pattern="dd-MM-yyyy HH:mm:ss"></fmt:formatDate></a>
                                            <a class="content_comment_shop">${rep.comment}</a>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <a style="justify-content: center; text-align: center;display: flex;">Sản phẩm chưa có đánh giá nào!</a>
                </c:otherwise>
            </c:choose>
        </div> 
            
        
        <%@include file="HeaderPage.jsp" %>
        <script src="JS/ViewAndUpdate.js"></script> 
        <script src="JS/TimeRent.js"></script> 
    </body>
</html>
