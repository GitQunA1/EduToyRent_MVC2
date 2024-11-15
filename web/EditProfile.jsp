<%-- 
    Document   : EditProfile
    Created on : Nov 13, 2024, 12:16:26 AM
    Author     : LENOVO
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
        <title>Edit Profile</title>
        <style>
            body {
                background-color: #FFFFE0; /* Đổi nền của toàn trang thành xám nhạt */
                font-family: Arial, sans-serif;
            }
            .edit-form {
                width: 500px;
                margin: 40px auto;
                padding: 25px;
                border: 1px solid #ddd;
                border-radius: 8px;
                background-color: #e6e6e6; /* Màu nền cho form chỉnh sửa */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .edit-form h2 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
            .edit-form label {
                display: block;
                margin-top: 10px;
                color: #555;
                font-weight: bold;
            }
            .edit-form input, .edit-form textarea {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .button-container {
                margin-top: 20px;
                display: flex;
                justify-content: space-between;
            }
            .button-container input[type="submit"],
            .button-container input[type="button"] {
                width: 48%;
                padding: 12px;
                border: none;
                border-radius: 5px;
                background-color: #4CAF50; /* Màu nút Lưu */
                color: white;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .button-container input[type="button"] {
                background-color: #d9534f; /* Màu nút Hủy */
            }
            .button-container input[type="submit"]:hover {
                background-color: #45a049;
            }
            .button-container input[type="button"]:hover {
                background-color: #c9302c;
            }
        </style>
    </head>
    <body>
        <%  
            HttpSession sessions = request.getSession();
            User us = (User) sessions.getAttribute("UserAccount");
            Customer cus = (Customer) sessions.getAttribute("Customer");
        %>

        <div class="edit-form">
            <h2>Chỉnh sửa Thông tin Cá nhân</h2>
            <form action="MainController" method="get" enctype="multipart/form-data">
                
                <label>Họ và Tên:</label>
                <input type="text" name="txtName" value="<%= cus.getName() %>" required />

                <label>Giới tính:</label>
                <input type="text" name="txtSex" value="<%= cus.getSex() %>" required />

                <label>Ngày sinh:</label>
                <input type="date" name="txtBirthday" value="<fmt:formatDate value="<%= cus.getBirthday() %>" pattern="yyyy-MM-dd" />" required />

                <label>Email:</label>
                <input type="email" name="txtEmail" value="<%= us.getEmail() %>" readonly />

                <label>SĐT:</label>
                <input type="text" name="txtPhone" value="<%= us.getPhone() %>" required />

                <label>Địa chỉ:</label>
                <textarea name="txtAddress" rows="3" required><%= cus.getAddress() %></textarea>

                <label>Chọn ảnh đại diện:</label>
                <input type="file" name="fileAvatar" />

                <label>Hoặc nhập URL ảnh đại diện:</label>
                <input type="text" name="txtAvatarUrl" value="<%= cus.getAvatar() %>" placeholder="Nhập URL ảnh đại diện..." />

                <input type="hidden" name="action" value="UpdateProfile"/>

                <div class="button-container">
                    <input type="submit" value="Lưu"/>
                    <input type="button" value="Hủy" onclick="window.history.back()"/>
                </div>
            </form>
        </div>
    </body>
</html>
