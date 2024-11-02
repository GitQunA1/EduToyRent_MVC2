<%-- 
    Document   : ProfileCustomer
    Created on : Oct 26, 2024, 4:09:51 PM
    Author     : Quyền
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Entity.Customer"%>
<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            .background{
                margin-top: 200px;
                position: absolute;
                height: 400px;
                width: 1000px;
                background-color: wheat;
                left: 50%;
                transform: translateX(-50%);
            }
            .background img{
                margin-left: 66.8%;
                margin-top: 50px;
                height: 300px;
                width: 300px;
            }
            .profile{
                position: absolute;
                margin-top: 30px;
                margin-left: 30px;
                padding-top: 20px;
                padding-left:  50px;
                padding-right:  50px;
                padding-bottom: 50px;
                border:  solid skyblue; 
                border-radius: 10px; 
                background-color: rgba(255, 255, 255, 0.1); 
                display: inline-block;
                z-index: 20;    
                width: 500px;
                height: 265px;
            }
            .line{
                height: 2px;
                width: 500px;
                background-color: black;
                margin-top: 10px;
                margin-bottom: 20px;
            }
            
            .profile input{
                background-color: transparent;
                outline: none;
                width: 300px;
                text-decoration : underline;
                border: none;
            }
            .profile textArea{
                width: 400px;
                resize: none;
                margin-left: 35px;
                background-color: transparent;
                outline: none;
                border: none;
                text-decoration : underline;
            }
            .address{
                display: flex;
                align-items: flex-start;
            }

        </style>

    </head>
    <body>
        <%  HttpSession sessions = request.getSession();
            User us = (User) sessions.getAttribute("UserAccount");
            Customer cus = (Customer) sessions.getAttribute("Customer");
        %>
        <%@include file="UserNavigation.jsp" %>
        <div class="background">
            
        <div class="profile">
            <label style="font-size: 25px">Thông tin cá nhân</label><br>
            <div class="line"></div>
            <label>Họ và Tên:   </label>
            <input type="text" name="txtName" value="<%= cus.getName()%>" style="margin-left: 20px"/><br><br>
            <label>Giới tính:   </label>
            <input type="text" name="txtSex" value="<%= cus.getSex()%>" style="margin-left: 29px"><br><br>
            <label>Ngày sinh:   </label>
            <input type="text" name="txtBirthday" value="<fmt:formatDate value="<%= cus.getBirthday()%>" pattern="dd / MM / yyyy "></fmt:formatDate>" style="margin-left: 20px"></a><br><br>
            <label>Email:   </label>  
            <a style="margin-left: 48px"><%= us.getEmail()%></a><br><br>
            <label>SĐT:   </label>
            <input type="text" name="txtPhone" value="<%= us.getPhone()%>" style="margin-left: 57px"></a><br><br>
            <div class="address">
                <label style="width: 60px">Địa chỉ:   </label>
            <textarea rows="3" name="txtAddress"><%= cus.getAddress()%></textarea>
            </div>
        </div> 
        <img src="<%= cus.getAvatar()%>">
        </div>
        



    </body>
</html>
