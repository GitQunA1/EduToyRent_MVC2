<%-- 
    Document   : shopincome
    Created on : 05-11-2024, 22:37:27
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Sản phẩm</title>
        <style>
            body {
                background-color: #f2f2f2;
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
                margin-top: 100px;
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
                position: relative;
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
        <jsp:include page="OwnerNavigation.jsp">
            <jsp:param name="currentPage" value="revenue" />
        </jsp:include>
        <!-- Nội dung chính -->
        <div class="content">
            <!-- Các nút lọc thời gian -->
            <div class="filter-buttons">
                <form action="GetIncomeProduct" method="GET">
                    <button class="filter-button" type="submit" name="timePeriod" value="today">Hôm nay</button>
                    <button class="filter-button" type="submit" name="timePeriod" value="yesterday">Hôm qua</button>
                    <button class="filter-button" type="submit" name="timePeriod" value="last7days">7 ngày</button>
                    <button class="filter-button" type="submit" name="timePeriod" value="all">Tất cả</button>
                    <!-- Tùy chỉnh -->
                </form>
            </div>

            <!-- Ô hiển thị doanh thu và đơn hàng -->
            <div class="info-box-container">
                <!-- Tổng doanh thu -->
                <div class="info-box">
                    <p>Doanh thu</p>
                    <h2>
                        ${totalIncome} Đ
                    </h2>
                </div>
                <!-- Tổng số lượng đã bán -->
                <div class="info-box">
                    <p>Đơn hàng bán</p>
                    <h2>
                        ${totalSellQuantity}
                    </h2>
                </div>
                <!-- Tổng số lượng đã cho thuê -->
                <div class="info-box">
                    <p>Đơn hàng cho thuê</p>
                    <h2>
                        ${totalRentQuantity}
                    </h2>
                </div>
            </div>

            <div class="product-ranking">
                <h3>Xếp hạng sản phẩm</h3>
                <c:forEach var="income" items="${incomeList}">
                    <!-- Duyệt qua productList để tìm sản phẩm với PID khớp -->
                    <c:forEach var="product" items="${productList}">
                        <c:if test="${income.pid == product.pid}">
                            <div class="product-card">
                                <div class="product-image-container">
                                    <p class="pid">PID: ${income.pid}</p>
                                    <img src="${product.image}" alt="${product.name}" class="product-image">
                                </div>
                                <div class="product-info">
                                    <h4 class="product-title">${product.name}</h4>
                                    <div class="product-details">
                                        <div>
                                            <strong>Doanh thu:</strong> 
                                            <c:if test="${income.incSell > 0}">
                                                ${income.incSell}
                                            </c:if>
                                            <c:if test="${income.incSell <= 0 && income.incRent > 0}">
                                                ${income.incRent}
                                            </c:if>
                                        </div>
                                        <div><strong>Số lượng đã bán:</strong> ${income.qSell}</div>
                                        <div><strong>Số lượng đã cho thuê:</strong> ${income.qRent}</div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </div>
        </div>
    </body>
</html>