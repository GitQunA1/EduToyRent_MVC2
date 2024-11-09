<%-- 
    Document   : ProductDetails
    Created on : Nov 8, 2024, 10:25:27 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi Tiết Sản Phẩm</title>
    <style>
        /* Styling for the product details layout */
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
            border-radius: 8px;
            font-family: Arial, sans-serif;
        }
        .product-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .product-header h1 {
            font-size: 28px;
            color: #333;
        }
        .product-image {
            text-align: center;
            margin-bottom: 20px;
        }
        .product-image img {
            max-width: 300px;
            height: auto;
            border-radius: 8px;
        }
        .product-info {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .info-section {
            flex: 1 1 45%;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .info-section label {
            font-weight: bold;
            color: #555;
        }
        .info-section p {
            margin: 5px 0;
            color: #333;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="product-header">
            <h1>Chi Tiết Sản Phẩm: ${product.name}</h1>
        </div>
        
        <div class="product-image">
            <img src="${product.image}" alt="${product.name}">
        </div>

        <div class="product-info">
            <!-- Display product details -->
            <div class="info-section">
                <label>Mã sản phẩm:</label>
                <p>${product.pid}</p>
            </div>

            <div class="info-section">
                <label>Mã cửa hàng:</label>
                <p>${product.soid}</p>
            </div>

            <div class="info-section">
                <label>Giá:</label>
                <p><fmt:formatNumber value="${product.price}" pattern="#,###"/> đ</p>
            </div>

            <div class="info-section">
                <label>Số lượng bán:</label>
                <p>${product.qSell}</p>
            </div>

            <div class="info-section">
                <label>Số lượng thuê:</label>
                <p>${product.qRent}</p>
            </div>

            <div class="info-section">
                <label>Độ tuổi phù hợp:</label>
                <p>${product.age}+</p>
            </div>

            <div class="info-section">
                <label>Thương hiệu:</label>
                <p>${product.brand}</p>
            </div>

            <div class="info-section">
                <label>Xuất xứ:</label>
                <p>${product.origin}</p>
            </div>

            <div class="info-section">
                <label>Mô tả:</label>
                <p>${product.description}</p>
            </div>

            <div class="info-section">
                <label>Loại sản phẩm:</label>
                <p>${product.category}</p>
            </div>

            <div class="info-section">
                <label>Phân loại:</label>
                <p>${product.type == 1 ? "Sản phẩm bán" : "Sản phẩm thuê"}</p>
            </div>

            <div class="info-section">
                <label>Trạng thái:</label>
                <p>${product.status}</p>
            </div>
        </div>
        
        <a href="MainController?action=BackShopPage" class="back-link">← Quay lại danh sách sản phẩm</a>
    </div>
</body>
</html>
