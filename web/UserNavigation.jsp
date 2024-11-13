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
            
            .Order_navigation{
                margin-left: 135px;
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
            
            body, html {
                margin: 0;
                padding: 0;
                height: 100%;
                overflow: auto;         
            }
            
            .publicize a{
                font-size: 25px;
                color: rgb(50, 50, 50);
                font-family: "Comic Sans MS", cursive;
            }
            .publicize{
                margin-left: 60px;
                margin-top: 20px;
            }
            .publicize_two{
                margin-left: 100px;
            }
            .notification img{
                width: 35px;
                height: 35px;
                margin-top: 43px;
                margin-left: 80px;
            }
        </style>
        
    </head>
    
    <body>
        
        <div class="backgrount_navigation">
            <div class="navigation_first">
                <a href="MainController?action=home">
                    <img class="logo_Navigation" src="Image/Logo.jpg" /> 
                </a>
                
                <div class="publicize">
                    <a class="publicize_one">Thỏa sức sáng tạo - học hỏi không ngừng</a><br><br>
                    <a class="publicize_two">Gieo mầm tri thức - hướng tới tương lai</a>
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
                
                <div class="notification" onclick="toggleNotification()">
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
        </div>
                
                <div id="notificationContent" style="display: none; border: 1px solid #ccc; padding: 20px;">
                    <p>Nội dung thông báo</p>
                    <button onclick="closeNotification()">Đóng</button>
                </div>
                <script>
            // Hàm để bật hoặc tắt thẻ thông báo
            function toggleNotification() {
                const notificationContent = document.getElementById('notificationContent');
                notificationContent.style.display = notificationContent.style.display === 'none' ? 'block' : 'none';
            }

            // Hàm để tắt thẻ thông báo khi nhấn nút đóng
            function closeNotification() {
                document.getElementById('notificationContent').style.display = 'none';
            }
                </script>
    </body>
</html>

