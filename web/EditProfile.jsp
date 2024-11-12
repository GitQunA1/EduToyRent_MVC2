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
            .edit-form {
                width: 500px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 8px;
                background-color: #f9f9f9;
            }
            .edit-form label {
                display: block;
                margin-top: 10px;
            }
            .edit-form input, .edit-form textarea {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
            }
            .button-container {
                margin-top: 15px;
                display: flex;
                justify-content: space-between;
            }
            .button-container button {
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                background-color: skyblue;
                color: white;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%  HttpSession sessions = request.getSession();
            User us = (User) sessions.getAttribute("UserAccount");
            Customer cus = (Customer) sessions.getAttribute("Customer");
        %>

        <div class="edit-form">
            <h2>Chỉnh sửa Thông tin Cá nhân</h2>
            <form action="UpdateProfileController" method="post" enctype="multipart/form-data">
                
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
                <input type="text" name="txtAvatarUrl" placeholder="Nhập URL ảnh đại diện..." />

                <div class="button-container">
                    <button type="submit">Lưu</button>
                    <button type="button" onclick="window.location.href='Profile.jsp'">Hủy</button>
                </div>
            </form>
        </div>
    </body>
</html>

