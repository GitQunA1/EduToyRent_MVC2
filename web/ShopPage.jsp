
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="JS/Button_themsoluong.js"></script>
        <style>
            /* Các kiểu dáng sẵn có */
            .Nav_Bar {
                height: 100%;
                width: 350px;
                margin-top: 120px;
                background-color: #F2F1F1;
                position: fixed;
            }
            .Search img {
                width: 15px;
                height: 15px;
                margin-top: 2px;
            }
            .Search button[type="submit"] {
                position: absolute;
                border: none;
                margin-left: 240px;
                background: none;
            }
            .Search form {
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .Search {
                padding-top: 30px;
            }
            .Search input[type="text"] {
                padding-right: 15px;
                height: 25px;
                width: 250px;
                border-radius: 7px;
            }
            .feature {
                margin-top: 50px;
            }
            .feature a {
                display: block;
                text-align: center;
                margin-bottom: 30px;
                text-decoration: none;
                color: black;
            }

            /* Các kiểu dáng mới cho khu vực hiển thị sản phẩm */
            .Show_product {
                margin-left: 400px; /* Điều chỉnh dựa trên chiều rộng Nav_Bar */
                padding: 20px;
            }
            .product-box {
                display: flex;
                align-items: center;
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                padding: 15px;
                margin-bottom: 15px;
                border-radius: 8px;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            }
            .product-box img {
                width: 80px;
                height: 80px;
                border-radius: 4px;
                margin-right: 15px;
            }
            .product-details {
                flex-grow: 1;
                max-width: calc(100% - 150px); /* Giới hạn chiều rộng, cách nút thêm số lượng */
                word-wrap: break-word; /* Tự động xuống dòng nếu quá dài */
            }
            .product-details p {
                margin: 0;
                font-size: 16px;
                font-weight: bold;
                color: #333;
            }
            .product-details a {
                display: block;
                font-size: 14px;
                color: #666;
            }
            .product-actions {
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                margin-left: auto; /* Đảm bảo khu vực này luôn nằm bên phải */
                width: 150px; /* Đặt chiều rộng cố định cho khu vực nút */
            }
            .product-actions button {
                width: 100%; /* Đảm bảo nút có chiều rộng 100% của vùng chứa */
                padding: 5px 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .product-actions button:hover {
                background-color: #45a049;
            }
            .product-actions a {
                font-size: 12px;
                color: #007bff;
                margin-top: 5px;
                text-decoration: none;
            }
            .product-actions a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <%@include file="ShopNavigation.jsp" %>

        <div class="Nav_Bar">
            <div class="Search">
                <form action="MainController" method="post">
                    <input type="text" name="search" placeholder="Tìm kiếm"/>
                    <input type="hidden" value="" name="action"/>
                    <button type="submit">
                        <img src="Image/KinhLup.jpg"/>
                    </button>
                </form>
            </div>
            <div class="feature">
                <a href="MainController?action=OwnerProduct&txtStatus=1">Đang hoạt động</a>
                <a href="MainController?action=OwnerProduct&txtStatus=2">Còn ít tồn kho</a>
                <a href="MainController?action=OwnerProduct&txtStatus=3">Đang xét duyệt</a>
                <a href="MainController?action=OwnerProduct&txtStatus=4">Không thành công</a>
                <a href="MainController?action=OwnerProduct&txtStatus=5">Đóng băng</a>
            </div>
        </div>

        <div class="Show_product">
            <c:forEach var="product" items="${list}">
                <div class="product-box">
                    <img src="${product.image}" alt="${product.name}">
                    <div class="product-details">
                        <p>${product.name}</p>
                        <a>Giá: <fmt:formatNumber value="${product.price}" pattern="#,###"/> đ</a>
                        <p>Số lượng bán: ${product.qSell}</p>
                        <p>Số lượng thuê: ${product.qRent}</p>
                    </div>
                    <div class="product-actions">
                        <button onclick="toggleInput(${product.pid})">Thêm số lượng</button>
                        <input type="number" id="quantityInput-${product.pid}" style="display:none;" placeholder="Nhập số lượng" />
                        <button onclick="updateQuantity(${product.pid})" style="display:none;" id="saveBtn-${product.pid}">Lưu</button>
                        <a href="MainController?action=ProductDetails&pid=${product.pid}">Chi tiết</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
</html>