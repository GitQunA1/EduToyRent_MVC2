<%-- 
    Document   : HeaderPage
    Created on : Nov 9, 2024, 2:56:57 PM
    Author     : Quyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            .background_header{
                background-color: rgb(255, 224, 230);
                width: 100%;
                height: 250px;
                display: flex;
            }
            .header_content{
                margin-left: 150px;
            }
            
            .header_content p{
                font-size: 18px;
                text-transform: uppercase;
            }
            .header_content a{
                display: block;
                margin-bottom: 1px;
            }
        </style>
    </head>
    <body>
        <div class="background_header">
        <div class="header_content">
            <p>Hỗ trợ khách hàng</p>
            <a>Báo lỗi hệ thống</a><br>
            <a>Hướng dẫn đặt hàng</a><br>
            <a>Yêu cầu hỗ trợ</a><br>
        </div>
        <div class="header_content">
            <p>Về EduToyRent</p>
            <a>Giới thiệu EduToyRent</a><br>
            <a>Chính sách bảo mật</a><br>
            <a>Điều khoản sử dụng</a><br>
        </div>
        <div class="header_content">
            <p>Hợp tác và liên kết</p>
            <a>Bán hàng cùng EduToyRent</a><br>
        </div>
        <div class="header_content">
            <p>Phương thức thanh toán</p>
            
        </div>
    </div>
    </body>
</html>
