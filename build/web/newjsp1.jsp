<%-- 
    Document   : newjsp1
    Created on : Nov 20, 2024, 3:21:29 PM
    Author     : Quyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            body{
                background-color: #555;
                width: 100%;
                height: 100%;
                font-family: arial;
            }
            .email{
                background-color: white;
                height: auto;
                width: 80%;
                padding-top: 20px;
                padding-bottom: 20px;
                margin: 0 auto; 
                position: absolute; 
                top: 50%; 
                left: 50%; 
                transform: translate(-50%, -50%); 
                
            }
            
            .email h2{
                display: flex;
                justify-content: center;
            }
            .email_header{
                margin-left: 70px;
                margin-right: 100px;
            }
            .email_header a{
                line-height: 1.5;
            }
            .line{
                background-color: #555;
                width: 150%;
                height: 2px;
                margin-left: -100px;
                margin-top: 20px;
                margin-bottom: 10px;
            }
            .email_body h3{
                margin-left: 50px;
            }
            .email_body{
                position: relative;
            }
            .product{
                
                margin-left: 100px;
            }
            .product img{
                width: 110px;
                height: 120px;
                border: 1px solid #333;
            }
            .name{
                font-weight: bold; 
                max-height: 3.2em; 
                line-height: 1.4em; 
                overflow: hidden; 
                display: block;
                bottom: 100px;   
                margin-right: 150px;
                margin-left: 125px;
                position: absolute;
            }
            .quantity{
                position: absolute;
                bottom: 50px;
                margin-left: 50px;
            }
            .rent_time{
                position: absolute;
                bottom: 50px;
                margin-left: 280px;
            }
            .start{
                position: absolute;
                bottom: 10px;
                margin-left: 50px;
                
            }
            .end{
                position: absolute;
                bottom: 10px;
                margin-left: 280px;
            }
            .end_email{
                text-align: center;
                justify-content: center;
                margin-left: -80px;
            }
        </style>
        
    </head>
    <body>
        <div class="email">
            <h2>Thông báo tới hạn trả hàng</h2>
            <div class="content_email">
                <div class="email_header">
                    <a>Xin chào quyền,</a><br><br>
                    <a>Bạn có 1 đơn hàng thuê sắp tới hạn trả hàng, vui lòng chuẩn bị đơn hàng trước khi 
                        nhân viên giao hàng của chúng tôi tới nhận lại hàng. Để xem chi tiết đơn hàng vui lòng xem </a>
                    <a href="http://localhost:8084/EduToyRent/"> tại đây.</a>
                </div>
                <div class="line"></div>
                <div class="email_body">
                    <h3>Thông tin sản phẩm</h3>
                    <div class="product">
                        <img src="https://i.pinimg.com/564x/24/21/85/242185eaef43192fc3f9646932fe3b46.jpg"/>
                        <a class="name">ahahahahahahahahahahahahahahatttttT</a>
                        <a class="quantity">Số lượng: 1</a>
                        <a class="rent_time">Thời gian thuê: 1 tuần</a>
                        <a class="start">Bắt đầu: 11-11-2024</a>
                        <a class="end">kết thúc: 20-11-2024</a>
                    </div>
                </div>
                <div class="line"></div>
                <div class="end_email">
                    <h3>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</h3>
                    <a>Mọi thắc mặc vui lòng liên hệ cho chúng tôi qua hotline: 0999999999</a><br><br>
                    <a>Vui lòng không trả lời thư này.</a>
                </div>
            </div>
        </div>
        
    </body>
</html>
