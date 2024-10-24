<%-- 
    Document   : RegisterPage
    Created on : Oct 18, 2024, 8:15:45 PM
    Author     : Quyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            .register_screen{
                display: flex;
                margin-left: 200px;
            }
            
            .register_content{
                margin-top: 50px;
            }
            
            .img_register{
                 box-shadow: 2px 5px 8px 8px rgba(0, 0, 0, 0.3);
                 margin-top: 50px;
                 margin-left: 70px;
                 border-radius: 10px;
                 border: 5px solid #DCAC0C;
            }
                       
            .topic_register{
                font-size: 45px;
                text-transform: uppercase;
            }
            
            .register_content input[type="text"]{
                width: 350px;
                height: 35px;
                margin-top: 30px;               
                border-radius: 5px;
                padding-left: 15px;
            }
            .register_content form{
                margin-top: 20px;
            }
            
            .register_content form a{
                color: #BDBDBD;               
            }
            
            .register_content input[type="submit"]{
                width: 200px;
                height: 30px;
                border-radius: 5px;
                background-color: #FFAB40;
                margin-top: 30px;
                margin-left: 80px;
            }
            .register_content input[type="submit"]:hover{
               background-color: #209897;
               color: white;
            }
            .register{
                margin-top: 60px;
            }
            .register a{
                font-size: 18px;
            }
            
        </style>
        
    </head>
    <body>
        
        <div class="register_screen">
            <div class="register_content">
                
                <a class="topic_register">Tạo tài khoản mới</a><br><br>
                <a>Giúp bạn có trải nghiệm tốt hơn, dễ dàng quản lý đăng kí sản phẩm và tìm nhanh <br> thông tin theo dõi đơn hàng đã thanh toán.</a>
               
                <%-- form dăng kí tài khoản xử lý thông tin txtEmail, txtName, txtPassword, confirmPassword.  xử lý trong Maincontroller: value="registerAccount" name="action"--%>
                <form action="" method="post">
                    <input type="text" name="txtEmail" placeholder="Email" required/><br>
                    <input type="text" name="txtName" placeholder="Họ và tên" required/><br>
                    <input type="text" name="txtPassword" placeholder="mật khẩu" required/><br>
                    <a>Mật khẩu từ 3-20 kí tự không bao gồm các kí tự đặc biệt.</a><br>
                    <input type="text" name="confirmPassword" placeholder="Nhập lại mật khẩu" required/><br>
                    <input type="hidden" value="registerAccount" name="action"/>
                    <input type="submit" value="Tạo tài khoản" />      
                </form>
                
                <%-- chuyển sang trang đăng kí <không chỉnh lại>--%>
                <div class="register">
                    <a>Bạn đã có tài khoản!</a>
                    <a href="LoginPage.jsp">Quay lại</a>
                </div>
                
            </div>
            <img class="img_register" src="Image/Logo.jpg" />
        </div>
        
    </body>
</html>
