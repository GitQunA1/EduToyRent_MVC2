<%-- 
    Document   : LoginPage
    Created on : Oct 18, 2024, 8:14:08 PM
    Author     : Quyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            .Login_Screen{
                display: flex; 
                margin-top: 100px;               
            }
            .conten_Login{
                margin-left: 100px;
                margin-top: 50px
            }
            .conten_Login input[type="text"]{
                width: 100%;
                min-width:350px;
                height: 35px;
                border: none;
                margin-top: 30px;
                border-radius: 5px;
                padding-left: 15px;
                font-size: 14px;
            }
            .img_logo{
                width: 470px; 
                height: 500px; 
                border-radius: 15px; 
                box-shadow: 0 10px 10px rgba(0, 0, 0, 0.3);
                margin-left: 180px;
                border: 5px solid #DCAC0C;
            }
            
            .conten_Login a{
                font-size: 50px;
                
            }
            
            .conten_Login input[type="submit"]{
                width: 200px;
                height: 35px;
                border-radius: 5px;
                margin-top: 70px;
                background-color: white;
                margin-left: 90px;
                position: absolute;
                background-color: #FFAB40;
            }
            
            .conten_Login input[type="submit"]:hover{
               background-color: #209897;
               color: white;
            }
            
            .register_content{
                margin-top: 150px;
                
                position: absolute;
            }
            .register_content a{
                font-size: 18px;
            }
            .conten_Login p{
                color: red;
                position: absolute;
            }
            .conten_Login input[type="text"]:focus{
                outline: none;
            }
        </style>
        
    </head>
    <body style="background-color:#FF74B8;">
          <div class="Login_Screen" >
            <div>
                <img class="img_logo" src="Image\Logo.jpg"/>
            </div>
            <div class="conten_Login">
                <%-- form đăng nhập xử lý txtEmail, txtPassword . xư lý MainController: value="Login" name="action" --%>
                <form action="MainController" method="post">
                    <a>Đăng nhập</a><br>
                    <input type="text" name="txtEmail" placeholder="Email" value="${txtEmail}" required/><br>
                    <input type="text" name="txtPassword" placeholder="Password" /><br>
                    <input type="hidden" value="Login" name="action"/>
                    <p>${ERROR}</p>
                    <input type="submit" value="Đăng nhập"/>   
                 </form>
                <div class="register_content">
                   <a>Bạn lần đầu đến với Toys Kids? </a>
                   <a href="RegisterPage.jsp"> Đăng kí</a> 
                </div>                
            </div>
        </div>
                    
    </body>
</html>
