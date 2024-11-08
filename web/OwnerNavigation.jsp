<%-- 
    Document   : OwnerNavigation
    Created on : Oct 19, 2024, 5:03:43 PM
    Author     : Quyền
--%>

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
            .logo_Navigation{ 
                width: 75px;
                height: 75px;
                margin-left: 100px;
                margin-right: 10px; 
                margin-top: 10px;
                border: 3px solid #DCAC0C;
                border-radius: 7px;
            }
            .button_navigation{
                display: flex;
            }
            .shop_feature{
                display: flex;
                margin-top: 80px;
            }
            .shop_feature input[type="submit"]{
                margin-left: 100px;
                width: 120px;
                height: 25px;
                border-radius: 7px;
                border: none;
                background-color: #F0F0F0;

            }
            .Notic{
                width: 30px;
                height: 30px;
                background-color: #FF74B8;
            }
            .button_notic{
                background-color: #FF74B8;
                border: none;
                margin-top: 33px;
                margin-left: 135px;
            }
            .button_acc{
                margin-top: 35px;
                margin-left: 20px;
            }
            .button_acc input{
                width: 110px;
                height: 30px;
                border-radius: 5px;
                border: none;
                background-color: white;
            }
            .active_button {
                background-color: #DCAC0C; /* Choose a color to indicate the active button */
                color: #37A28F;
                font-weight: bold;
            }



        </style>

    </head>
    <body>

        <div class="backgrount_navigation">
            <div class="button_navigation">
                <a href="MainController?action=home">
                    <img class="logo_Navigation" src="Image/Logo.jpg" /> 
                </a>
                <div class="shop_feature">
                    <form action="MainController" method="post">
                        <input type="hidden" value="revenue" name="action"/>
                        <input type="submit" value="Doanh thu" 
                               class="<%= "revenue".equals(request.getParameter("currentPage")) ? "active_button" : ""%>"/>
                    </form>
                    <form action="MainController" method="post">
                        <input type="hidden" value="ownerProduct" name="action"/>
                        <input type="submit" value="Sản phẩm" 
                               class="<%= "ownerProduct".equals(request.getParameter("currentPage")) ? "active_button" : ""%>"/>
                    </form>
                    <form action="MainController" method="post">
                        <input type="hidden" value="ownerOrder" name="action"/>
                        <input type="submit" value="Đơn hàng" 
                               class="<%= "ownerOrder".equals(request.getParameter("currentPage")) ? "active_button" : ""%>"/>
                    </form>

                    <form action="MainController" method="post">
                        <input type="hidden" value="owneRegister" name="action"/>
                        <input type="submit" value="Thêm sản phẩm" 
                               class="<%= "owneRegister".equals(request.getParameter("currentPage")) ? "active_button" : ""%>"/>
                    </form>
                </div>
                <form action="MainController" method="post">
                    <button class="button_notic" type="submit">
                        <img class="Notic" src="Image/ThongBao.png"/>
                    </button>
                    <input type="hidden" value="" name="action"/> 
                </form>
                <form class="button_acc" action="MainController" method="post">
                    <input type="hidden" value="AccountPage" name="action"/>
                    <input type="submit" value="Tài khoản"/>
                </form>
            </div>
        </div>

    </body>
</html>
