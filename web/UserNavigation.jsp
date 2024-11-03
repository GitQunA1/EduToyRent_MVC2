<%-- 
    Document   : UserNavigation
    Created on : Oct 17, 2024, 10:36:30 PM
    Author     : Quyền
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            body, html {
                margin: 0;
                padding: 0;
                height: 100%;
                overflow: auto;         
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
                margin-left: 100px;
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
                margin-left: 100px;
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
                    <form action="MainController" method="post">
                        <input type="text" name="txtSearch" placeholder="Tìm kiếm"/>
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
                        <a href="MainController?action=SearchGender&txtcategory=Toán học">Toán học</a>                                        
                        <a href="MainController?action=SearchGender&txtcategory=Giải đố">Giải đố</a><br>                                      
                        <a href="MainController?action=SearchGender&txtcategory=Ngôn ngữ">Ngôn ngữ</a>
                        <a href="MainController?action=SearchGender&txtcategory=Kĩ thuật">Kĩ thuật</a><br>  
                        <a href="MainController?action=SearchGender&txtcategory=Khoa học">Khoa học</a>
                        <a href="MainController?action=SearchGender&txtcategory=Nghệ thuật">Nghệ thuật</a><br>
                        <a href="MainController?action=SearchGender&txtcategory=Xếp hình">Xếp hình</a>
                        <a href="MainController?action=SearchGender&txtcategory=Mô phỏng">Mô phỏng</a><br>
                        <a href="MainController?action=SearchGender&txtcategory=Thiên văn">Thiên văn</a>
                        <a href="MainController?action=SearchGender&txtcategory=Địa lý">Địa lý</a><br>
                        <a href="MainController?action=SearchGender&txtcategory=Thể chất">Thể chất</a>
                    </div>
                </div>

                <%--Tìm kiếm theo tuổi xử lý txtMinAge, txtMaxAge . Xử lý MainController: action=SearchAge--%>
                <div class="search_Age">
                    <button id="showByeEag">Độ tuổi</button>
                    <div id="AgeList" class="Age-list" style="display: none;"> 
                        <a href="MainController?action=SearchAge&txtMinAge=1&txtMaxAge=3">1-3 tuổi</a>
                        <a href="MainController?action=SearchAge&txtMinAge=3&txtMaxAge=5">3-5 tuổi</a><br>
                        <a href="MainController?action=SearchAge&txtMinAge=5&txtMaxAge=7">5-7 tuổi</a>
                        <a href="MainController?action=SearchAge&txtMinAge=7&txtMaxAge=10">7-10 tuổi</a>
                    </div>
                </div>
            </div>
               
                   
                
            
        </div>
        
                <script src="JS/ListGender.js"></script>
    </body>
</html>

