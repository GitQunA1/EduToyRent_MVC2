<%-- 
    Document   : shopincome
    Created on : 05-11-2024, 22:37:27
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý Sản phẩm</title>
    <style>
        /* CSS */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f2f2f2;
        }

        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #ff66b3;
            padding: 15px 25px;
            color: white;
            height: 120px;
        }

        .logo {
            width: 70px;
            margin-right: auto;
        }

        .nav-buttons {
            display: flex;
            justify-content: space-around;
            flex: 1;
        }

        .nav-button {
            background-color: white;
            color: black;
            border: none;
            padding: 10px 20px;
            margin: 0 10px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 10px;
            font-size: 16px;
        }

        .nav-button.active {
            background-color: #00e6ac;
            color: white;
        }

        .account-section {
            display: flex;
            align-items: center;
        }

        .icon {
            width: 24px;
            margin-right: 40px;
            
        }

        .account-button{
            background: white;
            border: 1px solid #000;
            border-radius: 10%;
            padding: 5px;
            cursor: pointer;
            font-size: 14px;
            color: black;
        }

        .content {
            padding: 30px;
            max-width: 1200px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Nút lọc thời gian */
        .filter-buttons {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            gap: 150px;
        }

        .filter-button {
            padding: 10px 15px;
            margin: 0 10px;
            background-color: #f2f2f2;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .filter-button:hover {
            background-color: #ddd;
        }

        /* Ô hiển thị thông tin */
        .info-box-container {
            display: flex;
            justify-content: space-around;
            margin-bottom: 30px;
        }

        .info-box {
            width: 30%;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .info-box p {
            font-size: 1rem;
            color: #666;
            margin-bottom: 5px;
        }

        .info-box h2 {
            font-size: 1.5rem;
            color: #333;
            font-weight: bold;
        }

        /* Xếp hạng sản phẩm */
        .product-ranking {
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        .product-ranking h3 {
            font-size: 1.2rem;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        .product-card {
            display: flex;
            align-items: center;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            margin: 10px 0;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product-image-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-right: 15px;
            text-align: center;
        }

        .product-image {
            width: 80px;
            height: 80px;
            border-radius: 5px;
            object-fit: cover;
        }

        .product-info {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            width: 100%;
            font-size: 0.9rem;
            color: #333;
        }

        .product-details {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            font-size: 0.9rem;
            color: #333;
        }

        .product-details div {
            text-align: center;
            flex: 1;
        }

        .product-details div:not(:last-child) {
            border-right: 1px solid #ddd;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: bold;
            margin: 5px 0;
            color: #333;
        }

        .pid {
            font-size: 0.8rem;
            color: #666;
        }
        
        
    </style>
</head>
<body>
    <!-- Thanh điều hướng -->
<%--    <div class="navbar">
        <img src="Image\Logo.jpg" alt="Logo" class="logo">
        <div class="nav-buttons">
            <button class="nav-button active">Doanh thu</button>
            <button class="nav-button">Sản phẩm</button>
            <button class="nav-button">Đơn hàng</button>
            <button class="nav-button">Thêm sản phẩm</button>
        </div>
        <div class="account-section">
            <img src="Image\ThongBao.jpg" alt="Thông báo" class="icon">
            <button class="account-button">Tài khoản</button>
           
        </div>
    </div>
--%>
    <%@include file="OwnerNavigation.jsp" %>
    <!-- Nội dung chính -->
    <div class="content">
        <!-- Các nút lọc thời gian -->
        <div class="filter-buttons">
            <button class="filter-button">hôm nay</button>
            <button class="filter-button">hôm qua</button>
            <button class="filter-button">7 ngày</button>
            <button class="filter-button">tùy chỉnh</button>
        </div>

        <!-- Ô hiển thị doanh thu và đơn hàng -->
        <div class="info-box-container">
            <div class="info-box">
                <p>doanh thu</p>
                <h2>1,000,000 Đ</h2>
            </div>
            <div class="info-box">
                <p>đơn hàng bán</p>
                <h2>100</h2>
            </div>
            <div class="info-box">
                <p>đơn hàng cho thuê</p>
                <h2>15</h2>
            </div>
        </div>

        <!-- Phần Xếp hạng sản phẩm -->
        <div class="product-ranking">
            <h3>Xếp hạng sản phẩm</h3>
            
            <!-- Sản phẩm mẫu 1 -->
            <div class="product-card">
                <div class="product-image-container">
                    <p class="pid">PID: P93768909</p>
                    <img src="https://thebookland.vn/contents/1670045337198_Mathlink%20Cubes%20Numberblocks%20%201-10%20(1).jpg" alt="Xếp Hình Demo" class="product-image">
                </div>
                <div class="product-info">
                    <h4 class="product-title">Xếp Hình Demo</h4>
                    <div class="product-details">
                        <div><strong>Doanh thu:</strong> 1,000,000</div>
                        <div><strong>Số lượng đã bán:</strong> 10</div>
                        <div><strong>Số lượng đã cho thuê:</strong> 8</div>
                    </div>
                </div>
            </div>
            
            <!-- Sản phẩm mẫu 2 -->
            <div class="product-card">
                <div class="product-image-container">
                    <p class="pid">PID: P93768910</p>
                    <img src="https://thebookland.vn/images/1689223695931_BrainBolt%20Genius%20(2).jpg" alt="Xếp Hình Tháp" class="product-image">
                </div>
                <div class="product-info">
                    <h4 class="product-title">Xếp Hình Tháp</h4>
                    <div class="product-details">
                        <div><strong>Doanh thu:</strong> 500,000</div>
                        <div><strong>Số lượng đã bán:</strong> 10</div>
                        <div><strong>Số lượng đã cho thuê:</strong> 8</div>