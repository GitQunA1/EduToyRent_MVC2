<%-- 
    Document   : SearchProductPage
    Created on : Oct 21, 2024, 1:20:23 PM
    Author     : Quyền
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
             body, html {
                margin: 0;
                padding: 0;
                height: 100%;
                overflow: auto; 
                background-color: #F2F2F2;
            }
            .backgrount_navigation{
                background-color: #FF74B8;
                width: 99%;
                height: 120px; 
                position: relative;
                position: fixed;   
                z-index: 1000;
            }
            .navigation_first{
                display: flex;
            }
            .logo_Navigation{ 
                width: 75px;
                height: 75px;
                margin-left: 100px;
                margin-top: 10px;
                border: 3px solid #DCAC0C;
                border-radius: 7px;
            }
            .Search_navigation{
                margin-left: 100px;
                margin-bottom: -50px;
            }

            .Search_navigation form {
                display: flex;
                align-items: center;
                position: relative; 
                margin-top: 45px;
                margin-left: 70px;
            }

            .Search_navigation input[type="text"] {
                width: 420px;
                height: 31px;                
                border-radius: 15px; 
                font-size: 13px;
                padding-left: 10px;
                box-sizing: border-box;
                padding-right: 80px;
            }

            .Search_navigation button {
                position: absolute;
                top: 3px;
                right: 4px;
                width: 70px;
                height: 25px;
                background-color: #FF74B8; 
                color: white;
                border: none;
                border-radius: 15px;
                cursor: pointer;
            }
            .Order_navigation{
                margin-left: 150px;
                margin-top: 45px;
            }
            .Order_navigation input[type="submit"]{
                width: 110px;
                height: 30px;
                border-radius: 5px;
                border: none;
                background-color: white;
            }
            
            .Cart_navigation_img{
                width: 30px;
                height: 28px;      
            }
            .Cart_navigation button {
                width: 110px;
                height: 30px;
                display: flex; 
                align-items: center; 
                justify-content: center; 
                border: none; 
                border-radius: 5px; 
                background-color: white;
                cursor: pointer; 
            }
            .Cart_navigation{
                margin-left: 60px;
                margin-top: 45px; 
            }
            .content_cart{
                margin-left: 3px;
            }
            .Account_navigation input[type="submit"]{
                width: 110px;
                height: 30px;
                border-radius: 5px;
                border: none;
                background-color: white;
            }
            .Account_navigation{
                margin-left: 30px;
                margin-top: 45px; 
            }
            .content_search{
                display: flex; 
            }
            .search_Gender{
                margin-right: 100px;
                margin-left: 360px;
               
            }
           
            .genre-list, .Age-list{
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 11;
                border-radius: 10px;
                margin-top: 10px;
            }
            .genre-list a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: inline-table;               
            }
            .genre-list a:hover, .Age-list a:hover{
                color: #238E7B;
                text-decoration: underline;
            }
            .search_Age button, .search_Gender button{
                width: 90px;
                height: 20px;
                border-radius: 6px;
                border: none;
                background-color: white;
                margin-left: 10px;
            }
            
            .Age-list a{
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: inline-table; 
            }
            
            
            
            
            
            .Advertising{
                padding-top: 10px;
                margin-left: 70px;
                margin-right: 70px;
                border-radius: 10px;
                margin-bottom: 50px;
                padding-bottom: 100px;
                background-color: #FADED7;
            }
            .Show_product {
                display: grid;
                grid-template-columns: repeat(7, 1fr);
                gap: 10px; 
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
                font-family: Arial;
                font-size: 14px;
                display: -webkit-box;
                -webkit-line-clamp: 2; 
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                max-height: 40px; 
                text-align: left;
                color: #27272a;  
                align-self: stretch;
                text-transform: none;
                line-height: 1.5;
            }

            .Show_product a {
                font-family: Arial;
                display: block;
                font-size: 17px;
                color: #333;
                text-decoration: none;
            }
            .Show_product form {
                margin-top: 10px;
            }
            .product-box{
                margin-bottom: 20px;
            }
            .notification img{
                width: 35px;
                height: 35px;
                margin-top: 43px;
                margin-left: 80px;
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



         <div class="backgrount_navigation">
            <div class="navigation_first">
                <a href="MainController?action=home">
                    <img class="logo_Navigation" src="Image/Logo.jpg" /> 
                </a>
 

                <%-- thanh tìm kiếm xử lý: txtSearch. xử lý trong Maincontroller: value="SearchProduct" name="action"--%>
                <div class="Search_navigation">
                    <form action="MainController" method="Get" >
                        <input type="text" name="txtSearch" placeholder="Tìm kiếm"/>
                        <input type="hidden" value="${qRent}" name="txtQRent"/>
                        <input type="hidden" value="${qSell}" name="txtQSell"/>
                        <input type="hidden" value="${qStype}" name="txtStype"/>
                        <input type="hidden" value="SearchProduct" name="action"/>
                        <button type="submit">Tìm kiếm</button>
                    </form>
                </div>


                <%-- vào trang đơn hàng. xử lý MainContronller: value="OrderPage" name="action" --%>
                <div class="Order_navigation">
                    <form action="MainController" method="post">
                        <input type="hidden" value="InformationOrder" name="action" />
                        <input type="submit" value="Đơn hàng" />
                    </form>
                </div>


                <%-- vào giỏ hàng. xử lý MainContronller: value="CartPage" name="action" --%>
                <div class="Cart_navigation">
                    <form action="MainController" method="post">
                        <input type="hidden" value="CartPage" name="action"/>
                        
                        <button type="submit">
                            <img class="Cart_navigation_img" src="Image/Cart.png"/>
                            
                            <span class="content_cart">Giỏ hàng</span> 
                        </button>                          
                    </form>
                </div>

                <div class="notification">
                    <a href=""><img src="Image/ThongBao.png" /></a>
                </div>
                
                
                <%-- vào trang tài khoản. xử lý MainContronller: value="AccountPage" name="action"--%>
                <div class="Account_navigation">
                    <form action="MainController" method="post">
                        <input type="hidden" value="AccountPage" name="action"/>
                        <input type="submit" value="Tài khoản"/>
                    </form>
                </div>           
            </div>
            <%--  tìm kiếm theo thể loại xử lý txtgender  xử lý MainContronller: action=SearchGender--%>
            <div class="content_search">
                <div class="search_Gender">
                    <button id="showGenresBtn">Thể loại</button>
                    <div id="genreList" class="genre-list" style="display: none;"> 
                        <a href="MainController?action=SearchGender&txtcategory=Toán học&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Toán học</a>                                        
                        <a href="MainController?action=SearchGender&txtcategory=Giải đố&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Giải đố</a><br>                                      
                        <a href="MainController?action=SearchGender&txtcategory=Ngôn ngữ&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Ngôn ngữ</a>
                        <a href="MainController?action=SearchGender&txtcategory=Kĩ thuật&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Kĩ thuật</a><br>  
                        <a href="MainController?action=SearchGender&txtcategory=Khoa học&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Khoa học</a>
                        <a href="MainController?action=SearchGender&txtcategory=Nghệ thuật&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Nghệ thuật</a><br>
                        <a href="MainController?action=SearchGender&txtcategory=Xếp hình&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Xếp hình</a>
                        <a href="MainController?action=SearchGender&txtcategory=Mô phỏng&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Mô phỏng</a><br>
                        <a href="MainController?action=SearchGender&txtcategory=Thiên văn&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Thiên văn</a>
                        <a href="MainController?action=SearchGender&txtcategory=Địa lý&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Địa lý</a><br>
                        <a href="MainController?action=SearchGender&txtcategory=Thể chất&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">Thể chất</a>
                    </div>
                </div>

                <%--Tìm kiếm theo tuổi xử lý txtMinAge, txtMaxAge . Xử lý MainController: action=SearchAge--%>
                <div class="search_Age">
                    <button id="showByeEag">Độ tuổi</button>
                    <div id="AgeList" class="Age-list" style="display: none;"> 
                        <a href="MainController?action=SearchAge&txtMinAge=1&txtMaxAge=3&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">1-3 tuổi</a>
                        <a href="MainController?action=SearchAge&txtMinAge=3&txtMaxAge=5&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">3-5 tuổi</a><br>
                        <a href="MainController?action=SearchAge&txtMinAge=5&txtMaxAge=7&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">5-7 tuổi</a>
                        <a href="MainController?action=SearchAge&txtMinAge=7&txtMaxAge=10&txtQRent=${qRent}&txtQSell=${qSell}&txtStype=${qStype}">7-10 tuổi</a>
                    </div>
                </div>
            </div>     
        </div>
        <div class="history_page">
            <a onclick="window.history.back()">Quay lại trang trước đó</a>
        </div>
 
        
        <c:choose>
            <c:when test="${not empty ProductSearch}">
                <div  class="Advertising">
                    <div class="Show_product">
                        <c:forEach var="procuct" items="${ProductSearch}">
                            <div class="product-box">
                                <a href="MainController?txtPID=${procuct.pid}&action=viewProduct">
                                    <img src="${procuct.image}"/>
                                    <p><c:out value="${procuct.name}"></c:out></p>
                                    <a>Giá: <fmt:formatNumber value="${procuct.price}" pattern="#,###"></fmt:formatNumber> đ </a>
                                    </a>
                                  
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
                    
        <%@include file="HeaderPage.jsp" %>
        <script src="JS/ListGender.js"></script>
    </body>
</html>
