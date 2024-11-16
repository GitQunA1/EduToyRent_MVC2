<%-- 
    Document   : MainOrderPage
    Created on : Oct 19, 2024, 2:50:20 PM
    Author     : Quyền
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            body{
                background-color: #F5F5FA;
                width: 100%;
                height: 100%;
            }
            .content_order{
                margin-top: 120.3px;
                background-color: white; 
                box-shadow: 0 1px 0 2px rgba(0, 0, 0, 0.3);
                padding-top: 15px;
                height: 30px;
                width: 99%;
                position: fixed;
                overflow: auto;
                z-index: 500;
            }
            .content_order a{
                margin-left: 100px;
                font-size: 17px;
                color: black;
                text-decoration: none;
            }
            .content_order a:hover{
                color: #209897;
                cursor: pointer;
                text-decoration: underline;
            }
            .content_order a.active { /* Thẻ được chọn sẽ có màu */
                color: #209897;
                text-decoration: underline;
            }
            .background_coler_Product{
                background-color: #F5F5FA;
                width: 80%;
                height: auto;
                margin-left: 150px;
                padding-bottom: 20px;
                z-index: -100;
                padding-top: 190px;

            }
            .backgrount_product{
                background-color: white;
                width: 80%;
                height: auto;
                margin-left: 130px;
                margin-bottom: 20px;
                border: 1.5px solid black;
                border-radius: 10px;
            }
            .Shop_Order_product{
                display: flex;
                position: relative;
            }

            .Shop_Order_product img{
                width: 40px;
                height: 40px;
                border-radius: 20px;
                margin-left: 10px;
                margin-top: 10px;
            }
            .Shop_Order_product a{
                margin-left: 10px;
                margin-top: 10px;
                font-size: 15px;
                margin-right: 350px;
            }
            .Shop_Order_product p{
                right: 45px;
                position: absolute;
                bottom: -20px;
            }
            .line_order{
                background-color: #333;
                width: 100%;
                height: 1.5px;
                margin-top: 10px;
            }
            .product_order{
                margin-left: 20px;
                margin-top: 15px;
                display: flex;
                padding-bottom: 15px;
                position: relative;
            }
            .product_order img{
                width: 150px;
                height: 180px;
            }
            .content_product_order{
                position: absolute;
                margin-left: 170px;
            }
            .content_product_order a{
                font-size: 18px;
                padding-right: 20px;
                line-height: 1.3;
                display: -webkit-box;
                -webkit-line-clamp: 2; /* Hiển thị tối đa 2 dòng */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis; 
            }
            .order_PriceAndQuantity a{
                font-size: 16px;
                margin-left: 200px;
                margin-top: 20px;
            }
            .review_product{
                position: absolute;
                bottom: -70px;
                margin-left: 600px;
                z-index: 1000;
                margin-right: -800px;
                color: #209897;
            }
            .background_report{
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.6); /* Màu đen mờ */
                z-index: 2000;
                display: flex;
                align-items: center; 
                justify-content: center;
            }
            .background_content_report{
                background-color: white;
                width: 500px;
                height: 400px;
                border-radius: 10px;
            }
            .background_content_report h3{
                display: flex;
                justify-content: center;

            }
        </style>

    </head>
    <body>

        <%@include  file="UserNavigation.jsp" %>
        <%--trạng thái đơn hàng xử lý txtcontent . xử lý MainController: action=InformationOrder --%>
        <div class="content_order">
            <a class="active" href="MainController?filter=all&action=InformationOrder&txtcontent=0">Tất cả</a>
            <a href="MainController?filter=pending&action=InformationOrder&txtcontent=1">Chờ vận chuyển</a>
            <a href="MainController?filter=shipping&action=InformationOrder&txtcontent=2">Đang vận chuyển</a>
            <a href="MainController?filter=rented&action=InformationOrder&txtcontent=3">Đang thuê</a>
            <a href="MainController?filter=review&action=InformationOrder&txtcontent=9">Cần đánh giá</a>
            <a href="MainController?filter=return&action=InformationOrder&txtcontent=4">Trả hàng</a>
            <a href="MainController?filter=canceled&action=InformationOrder&txtcontent=7">Hủy đơn</a>
            <a href="MainController?filter=history&action=InformationOrder&txtcontent=10">Lịch sử</a>
        </div>

        <c:choose>
            <c:when test="${ not empty orderDetail }">
                <div class="background_coler_Product">
                    <c:forEach var="od" items="${orderDetail}">
                        <c:forEach var="pd" items="${pdetail}">
                            <c:if test="${od.odid == pd.odid}">
                                <c:forEach var="pr" items="${product}">
                                    <c:if test="${od.pid == pr.pid}">
                                        <c:forEach var="so" items="${shop}">
                                            <c:if test="${so.soid == od.soid}">
                                                <div class="backgrount_product">
                                                    <div class="Shop_Order_product">

                                                        <img src="${so.avatar}" />
                                                        <a>${so.name}</a>
                                                        <p>
                                                            <c:choose>
                                                                <c:when test="${od.status == 1}">Chờ vận chuyển</c:when>
                                                                <c:when test="${od.status == 2}">Đang vận chuyển</c:when>
                                                                <c:when test="${od.status == 3}">Đang Thuê</c:when>
                                                                <c:when test="${od.status == 9 || od.status == 10}">Giao thành công</c:when>
                                                                <c:when test="${od.status == 4 || od.status == 5 || od.status == 6}">Đang trả hàng</c:when>
                                                                <c:when test="${od.status == 7 || od.status == 8}">Hủy đơn</c:when>
                                                            </c:choose>
                                                        </p>
                                                    </div>
                                                    <div class="line_order"></div>
                                                    <div class="product_order">
                                                        <img src="${pr.image}" />
                                                        <div class="content_product_order">
                                                            <a>${pr.name}</a>
                                                            <div class="order_PriceAndQuantity">
                                                                <a>Giá: <fmt:formatNumber value="${pd.price}" pattern="#,###" /> đ</a>
                                                                <a>Số lượng: ${od.quantity}</a>
                                                                <c:choose>
                                                                    <c:when test="${od.rentTime == 7}">
                                                                        <a>Thời gian thuê: 1 tuần</a>
                                                                    </c:when>
                                                                    <c:when test="${od.rentTime == 14}">
                                                                        <a>Thời gian thuê: 2 tuần</a>
                                                                    </c:when>
                                                                    <c:when test="${od.rentTime == 30}">
                                                                        <a>Thời gian thuê: 1 tháng</a>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                            <c:if test="${od.status == 9}">
                                                                <a class="review_product" href="">Đánh giá sản phẩm</a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div> 
                                            </c:if>                                   
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </c:forEach>

                </div>

            </c:when>
            <c:otherwise>
                <a style="margin-top: 500px; z-index: 100;">trống</a>
            </c:otherwise>
        </c:choose>
        
            <form action="MainController" method="post">
                <input type="hidden" value="viewReport" name="action"/>
                <input type="hidden" value="${od.odid}" name="txtODID"/>
                <input class="view_Report" type="submit" value="Xem báo cáo"/>
            </form>
              <c:if test="${od.status == 6}">  
            <div class="background_report">
                <div class="background_content_report">
                    <h3>Báo cáo thiệt hại</h3>
                    <a>Giá thuê: ${rentFee}</a>
                    <a>Tiền cọc: ${deposit}</a>
                    <a>Thiệt hại: ${damaged}%</a>
                    <a>Cần đền bù: ${compensation}</a>
                    <a>Tiền trả lại: ${deposit-compensation}</a>
                </div>
            </div>      
        </c:if>



        <script src="JS/ButtonAuto.js"></script>

    </body>
</html>
