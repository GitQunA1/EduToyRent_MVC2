<%-- 
    Document   : CartPage
    Created on : Oct 19, 2024, 4:55:38 PM
    Author     : Quyền
--%>
<%@page import="Entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            .Background_cart{
                background-color: white;
                width: 80%;
                height: auto;
                
                
                padding-top: 135px;
                padding-bottom: 30px;
            }
            .background_product_cart{
                background-color: #E8E8E8;
                width: 1100px;
                height: auto;
                padding-right: 20px;
                padding-top: 10px;
                padding-bottom: 20px;
                margin-left: 45px;
                margin-bottom: 10px;
                
            }
            
            .shopOwner_cart{
                display: flex;
                margin-left: 30px;
            }
            .shopOwner_cart img{
                width: 45px;
                height: 45px;
                border-radius: 30px;
                border: 2px solid black; 
                
            }
            .shopOwner_cart a{
                margin-left: 20px;
                font-size: 16px;
                margin-top: 10px;
                flex-grow: 1;  
                margin-right: 15px;
            }
            .channel{
                background-color: black;
                height: 2px;
                width: 98%;
                margin-top: 10px;
                margin-bottom: 10px;
                margin-left: 23px;
            }
            .product_cart{
                display: flex;
                margin-left: 20px;
                position: relative;
            }
            .img_product_cart{
                width: 130px;
                height: 150px;
                border: 1.5px solid; 
                border-color: #333;
                margin-left: 20px;
            }
            .content_product_cart{
                margin-left: 40px;
                margin-right: 50px;
            }
            .name_product_cart{
                font-size: 18px;
                line-height: 1.3;
                 display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis; 
                margin-bottom: 30px;
            }
            .price_cart{
                font-size: 17px;
                margin-left: 50px;
                margin-right: 50px;
            }
            .content_product_Change_cart{
                margin-bottom: 20px;
               
            }
            .content_product_Change_cart form{
                margin-left: 50px;
            }
            .quantity-btn-text{
                width: 50px;
                text-align: center;
                height: 21px;
            }
            .quantity-btn{
                margin-top: 20px;
                background-color: #37A28F;    
                width: 25px;
                height: 25px;
                color: white;
                font-size: 17px;
            }
            .quantity-btn:hover{
                cursor: pointer;
            }
            .Price_total_Product{
                font-size: 17px;
                margin-left: 50px;
                margin-bottom: 20px;
            }
            .rent-time-btn.active {
                background-color: #37A28F; 
                color: white;
            }
            .botton_cart_rent{
                margin-left: 50px;
            }
            .content_product_Change_cart_bottom{
               margin-bottom: 20px;
            }
            .cart_rent_time{
                margin-top: 20px;
            }
            .flex_cart{
                display: flex;
            }
            .price_cart_rent{
                font-size: 17px;
                margin-left: 50px;
                margin-right: 50px;
            }
            .conten_cart_price a {
                display: block;
                margin-left: 190px;
            }
            .navbart_cart_background{
                background-color: #E8E8E8;
                position: absolute;
                z-index: 500;
                width: 303px;
                height: 85%;
                right: 15px;
                bottom: 0px;
            } 
            .checkbox_cart input[type="checkbox"]{
                width: 20px;
                height: 20px;
                display: inline-block;
            }
            .button_delete_cart{
                position: absolute;
                margin-left: 770px;
                bottom: 5px;
            }
            .button_delete_cart input[type="submit"]{
                width: 100px;
                height: 25px;
                border-radius: 10px;
                background-color: #37A28F;
                color: white;
            }
            .button_delete_cart input[type="submit"]:hover{
                cursor: pointer;
            }
            .error_cart{
                margin-top: 300px; 
                text-align: center; 
                position: relative; 
                left: -150px;
                font-size: 17px;
            }
            .link_maine_cart{
                color: #37A28F;
                line-height: 1.5;
            }
            .button_Payment{
               position: absolute;
               bottom: 150px;
               left: 75px;
            }
            .button_Payment input[type="submit"]{
                width: 160px;
                height: 30px;
                border-radius: 10px;
                background-color: #F34545;
                color: white;
                
            }
            .price_total_cart{
               position: absolute;
               bottom: 230px;
               left: 50px;
            }
            .price_total_cart a{
                font-size: 17px;
            }
            .background_payment {
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

            /* CSS cho nội dung ở giữa */
            .background_order_payment {
                background-color: white;
                width: 600px;
                max-height: 90vh; 
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                overflow-y: scroll; 
                scrollbar-width: none; 
                -ms-overflow-style: none; 
                border-radius: 10px;
            }
            .background_order_payment::-webkit-scrollbar{
                display: none;
            }
            .topic_Payment img{
                width: 40px;
                height: 40px;
            }
            .topic_Payment img:hover{
               cursor: pointer;
            }
            .topic_Payment{
                background-color:  white;
                position: fixed;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
                width: 600px;
                z-index: 2500;
            }
            .topic_Payment strong{
                font-size: 22px;
                margin-left: 150px;
                
                
            }
            .horizontal_lines{
                background-color: black;
                height: 1px;
                width: 100%;
            }
            .order_summary{
                margin-top: 55px;
            }
            .topic_address{
                display: flex;
                margin-left: 10px;               
            }
            .topic_address a{
                font-size: 17px;
            }
            .change_address{
                margin-left: 400px;
                color: black;
            }
            .address_order{
                margin-top: 20px;
                margin-left: 100px;
                margin-bottom: 20px;
            }
            .address_order a{
                margin-right: 100px;
            }
            .product_order{
                background-color: #E8E8E8;
                width: 550px;
                height: auto;
                margin-top: 15px;
                margin-left: 25px;
                border-radius: 5px;
                position: relative;
            }
            .product_order_Shop{
                display: flex;
                padding-top: 10px;
                padding-bottom: 5px;
            }
            .product_order_Shop img{
                width: 40px;
                height: 40px;
                border-radius: 20px;
                margin-left: 10px;
            }
            .product_order_Shop a{
                font-size: 13px;
                margin-left: 10px;
                margin-right: 20px;
            }
            .product_order_Shop_content{
                display: flex;
                
            }
            .product_order_Shop_content img{
                width: 90px;
                height: 110px;
                margin-left: 10px;
                margin-top: 10px;
                margin-bottom: 10px;
                margin-right: 10px;
            }
            .content_product_order a{
               margin-top: 10px;
               font-size: 14px;
               position: absolute;
            }
            .content_product_order_price{
               margin-top: 70px;
               font-size: 14px;
               position: absolute;
               margin-left: 140px;
            }
            .content_product_order_quantity{
               margin-top: 70px;
               font-size: 14px;
               position: absolute;
               margin-left: 250px;
            }
            .content_product_order_time{
               margin-top: 100px;
               font-size: 14px;
               position: absolute;
               margin-left: 250px;
            }
            .Detailed_summary{
                margin-top: 10px;
                position: relative;
            }
            .Detailed_summary a{
                margin-left: 20px;
                padding-top: 10px;
                position: absolute;
                font-size: 17px;
            }
            .Detailed_summary_topic a{
                position: absolute;
                margin-top: 40px;
                margin-left: 120px;
            }
            .Detailed_summary_price a{
                position: absolute;
                margin-left: 300px;
                margin-top: -106px; 
            }
            .payment_choose{
                position: relative;
                margin-bottom: 200px;
            }
            .payment_choose a{
                margin-left: 20px;
                padding-top: 10px;
                position: absolute;
                font-size: 17px;
            }
            .payment_choose_bank a{
                position: absolute;
                margin-top: 50px;
                margin-left: 100px;
            }
            .payment_choose_radio input{
                position: absolute;
                margin-top: 25px;
                margin-left: 350px;
                width: 20px;
                height: 20px;
            }
            .payment_choose_radio input[type="radio"]:checked{
                background-color: red;
            }
            .checkbox_point{
                position: absolute;
                margin-top: -133px;
                margin-left: 400px;
                transform: scale(1.3);
            }
            .background_payment_botton{
                background-color:  #E8E8E8;
                height: 100px;
                width: 100%;
                margin-top: -100px;
            }
            .background_payment_botton input{
                width: 150px;
                height: 27px;
                border-radius: 10px;
                margin-top: 30px;
                margin-left: 225px;
                background-color: #F34545;
                color: white;
            }
        </style>
        
    </head>
    <body>
        <%@include file="UserNavigation.jsp" %>
        
        
            <c:choose>
                <c:when test="${not empty cart}">
                    <div class="Background_cart">
                    <c:forEach var="c" items="${cart}">
                        <c:choose>
                            <c:when test="${c.rentTime == 0}" >                                            
                                <c:forEach var="products" items="${products}">
                                    <c:if test="${c.pid == products.pid}">
                                        <c:set var="p" value="${products}"></c:set>
                                        <c:forEach var="shopOwners" items="${shopOwners}">
                                            <c:if test="${p.soid == shopOwners.soid}">
                                                <c:set var="o" value="${shopOwners}"></c:set>
                                                    
                                                    <div class="background_product_cart">
                                                        <div class="shopOwner_cart">
                                                            <img src="${o.avatar}"/>
                                                            <a>${o.name}</a>
                                                        </div>
                                                        <div class="channel"></div>
                                                        <div class="product_cart">
                                                            <img class="img_product_cart" src="${p.image}"/>   
                                                            <div class="content_product_cart">
                                                                <a class="name_product_cart">${p.name}</a>

                                                                <div class="content_product_Change_cart">
                                                                    <a class="price_cart_rent">Giá: <fmt:formatNumber value="${p.price}" pattern="#,###"></fmt:formatNumber> đ</a>
                                                                    <form id="updateFormBuy${c.caid}" action="MainController" method="post">
                                                                        <button type="button" class="quantity-btn" onclick="changeQuantity(-1, 'updateFormBuy${c.caid}', 'buyQuantity${c.caid}')">-</button>
                                                                        <input class="quantity-btn-text" type="text" id="buyQuantity${c.caid}" name="txtQuantity" value="${c.quantity}" readonly>
                                                                        <button type="button" class="quantity-btn" onclick="changeQuantity(1, 'updateFormBuy${c.caid}', 'buyQuantity${c.caid}')">+</button>
                                                                        <input type="hidden" name="txtTimeRent" value="0">
                                                                        <input type="hidden" name="txtPrice" value="${p.price}">
                                                                        <input type="hidden" name="txtCAID" value="${c.caid}">
                                                                        <input type="hidden" name="action" value="updateCart">
                                                                    </form>
                                                                        
                                                                </div> 
                                                                <a class="Price_total_Product">Cần thanh toán: <fmt:formatNumber value="${c.total}" pattern="#,###"></fmt:formatNumber> đ</a>  
                                                                <div class="button_delete_cart">
                                                                    <form action="MainController" method="post">
                                                                        <input type="hidden" value="${c.caid}" name="txtCAID"/>
                                                                        <input type="hidden" value="DeleteCart" name="action"/>
                                                                        <input type="submit" value="Xóa" />
                                                                    </form>
                                                                </div>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                            </c:if>                                                       
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>                                               
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="products" items="${products}">
                                    <c:if test="${c.pid == products.pid}">
                                        <c:set var="p" value="${products}"></c:set>
                                        <c:forEach var="shopOwners" items="${shopOwners}">
                                            <c:if test="${p.soid == shopOwners.soid}">
                                                <c:set var="o" value="${shopOwners}"></c:set>
                                                <div class="background_product_cart">
                                                    <div class="shopOwner_cart">
                                                        <img src="${o.avatar}"/>
                                                        <a>${o.name}</a>
          
                                                    </div>
                                                        <div class="channel"></div>
                                                        <div class="product_cart">
                                                            <img class="img_product_cart" src="${p.image}"/>   
                                                            <div class="content_product_cart">
                                                                <a class="name_product_cart">${p.name}</a>
                                                                <div class="flex_cart">
                                                                    <div class="content_product_Change_cart_bottom">
                                                                        <a class="price_cart">Giá: <fmt:formatNumber value="${p.price}" pattern="#,###"></fmt:formatNumber> đ</a><br>
                                                                        <form id="updateFormRent${c.caid}" action="MainController" method="post" class="botton_cart_rent">
                                                                            <button type="button" class="quantity-btn" onclick="changeQuantity(-1, 'updateFormRent${c.caid}', 'rentQuantity${c.caid}')">-</button>
                                                                            <input class="quantity-btn-text" type="text" id="rentQuantity${c.caid}" name="txtQuantity" value="${c.quantity}" readonly>
                                                                            <button type="button" class="quantity-btn" onclick="changeQuantity(1, 'updateFormRent${c.caid}', 'rentQuantity${c.caid}')">+</button>
                                                                            <input type="hidden" name="txtPrice" value="${p.price}">
                                                                            <input type="hidden" name="txtCAID" value="${c.caid}">
                                                                            <input type="hidden" name="action" value="updateCart">
                                                                            <input type="hidden" name="txtTimeRent" id="txtTimeRent${c.caid}" value="${c.rentTime}">

                                                                            <!-- Nút chọn thời gian thuê -->
                                                                            <div class="cart_rent_time">
                                                                                <button type="button" class="rent-time-btn ${c.rentTime == 7 ? 'active' : ''}" onclick="setRentTime(${c.caid}, 7)">1 tuần</button>
                                                                                <button type="button" class="rent-time-btn ${c.rentTime == 14 ? 'active' : ''}" onclick="setRentTime(${c.caid}, 14)">2 tuần</button>
                                                                                <button type="button" class="rent-time-btn ${c.rentTime == 30 ? 'active' : ''}" onclick="setRentTime(${c.caid}, 30)">1 tháng</button>
                                                                            </div>
                                                                        </form>
                                                                    </div> 
                                                                    <div class="conten_cart_price">
                                                                        <a class="Price_total_Product">Giá thuê: <fmt:formatNumber value="${c.total}" pattern="#,###"></fmt:formatNumber> đ</a>
                                                                        <a class="Price_total_Product">Tiền cọc: <fmt:formatNumber value="${p.price * c.quantity - c.total}" pattern="#,###"></fmt:formatNumber> đ</a>
                                                                        <a class="Price_total_Product">Cần thanh toán: <fmt:formatNumber value="${p.price * c.quantity}" pattern="#,###"></fmt:formatNumber> đ</a>
                                                                    </div>
                                                                    <div class="button_delete_cart">
                                                                        <form action="MainController" method="post">
                                                                            <input type="hidden" value="${c.caid}" name="txtCAID"/>
                                                                            <input type="hidden" value="DeleteCart" name="action"/>
                                                                            <input type="submit" value="Xóa" />
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </c:if>                                                       
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    </div>   
                </c:when>
                <c:otherwise>  
                    <div class="error_cart">
                        <a>Bạn không có sản phẩm nào trong giỏ hàng!</a><br>
                        <a class="link_maine_cart" href="MainController?action=home">Tiếp tục mua sắm</a>
                    </div>                   
                </c:otherwise>
            </c:choose>
        
        
          
        <div class="navbart_cart_background">
            <div class="price_total_cart">
                
                <c:set var="qBuy" value="0"></c:set>
                <c:set var="totalBuy" value="0"></c:set>
                <c:set var="qRent" value="0"></c:set>
                <c:set var="totalRent" value="0"></c:set>
                <c:set var="totalDeposit" value="0"></c:set>
                
                <c:forEach var="c" items="${cart}">
                    <c:forEach var="p" items="${products}">
                        <c:if test="${c.pid == p.pid}">
                            <c:choose>
                                <c:when test="${c.rentTime == 0}">
                                    <c:set var="totalBuy" value="${totalBuy + c.total}" ></c:set>
                                    <c:set var="qBuy" value="${qBuy + c.quantity}"></c:set>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="totalRent" value="${totalRent + c.total}" ></c:set>
                                    
                                    <c:set var="qRent" value="${qRent + c.quantity}"></c:set>
                                    
                                    <c:set var="totalDeposit" value="${totalDeposit + (p.price * c.quantity - c.total)}"></c:set>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                </c:forEach>
               
                <a>Số lượng mua: <c:out value="${qBuy}"></c:out></a><br><br>
                <a>Tổng tiền mua: <fmt:formatNumber value="${totalBuy}" pattern="#,###"></fmt:formatNumber> đ</a><br><br>
                <a>Số lượng thuê: <c:out value="${qRent}"></c:out></a><br><br>
                <a>Tổng tiền thuê: <fmt:formatNumber value="${totalRent}" pattern="#,###"></fmt:formatNumber> đ</a><br><br>
                <a>Tổng tiền cọc: <fmt:formatNumber value="${totalDeposit}" pattern="#,###"></fmt:formatNumber> đ</a><br><br>
                
                <a>Tổng thanh toán: <fmt:formatNumber value="${totalBuy + totalRent + totalDeposit}" pattern="#,###"></fmt:formatNumber> đ</a>
            </div>
            <div class="button_Payment">
                <form action="MainController" method="post">
                    <input type="hidden" value="Letpayment" name="action"/>
                    <input type="submit" value="Thanh toán"/>
                </form>
            </div>
        </div>

            
        <c:if test="${not empty Payment}">       
            <div class="background_payment">
                <div class="background_order_payment">
                    <div class="topic_Payment">
                        <a href="MainController?action=CartPage"><img src="Image/X.png"/></a>
                        <strong>TÓM TẮT YÊU CẦU</strong>  
                        <div class="horizontal_lines"></div>                                                           
                    </div>
                    <div class="order_summary">
                        <div class="Delivery_address">
                            <div class="topic_address">
                                <a>Địa chỉ giao hàng</a>
                                <a class="change_address" href="">Thay đổi</a>
                            </div>
                            <%  HttpSession sessions = request.getSession();
                                User us = (User) sessions.getAttribute("UserAccount");
                                Customer cus = (Customer) sessions.getAttribute("Customer");
                            %>
                            <div class="address_order">
                                <a><%= cus.getName()%>  (+84)<%= us.getPhone()%></a><br><br>
                                <a><%= cus.getAddress()%></a>
                            </div>
                            <div class="horizontal_lines"></div>
                        </div>

                        <c:forEach var="pay" items="${Payment}">
                            <c:choose>
                                <c:when test="${pay.rentTime == 0}">
                                    <c:forEach var="product" items="${product}">
                                        <c:if test="${product.pid == pay.pid}">
                                            <c:set var="pro" value="${product}"></c:set>
                                            <c:forEach var="shopOwner" items="${shopOwner}">
                                                <c:if test="${pro.soid == shopOwner.soid}">
                                                    <c:set var="Ow" value="${shopOwner}"></c:set> 

                                                        <div class="product_order">
                                                            <div class="product_order_Shop">
                                                                <img src="${Ow.avatar}"/>
                                                            <a>${Ow.name}</a>
                                                        </div>
                                                        <div class="horizontal_lines"></div>
                                                        <div class="product_order_Shop_content">    
                                                            <img src="${pro.image}" />
                                                            <div class="content_product_order">
                                                                <a>${pro.name}</a>
                                                            </div>                   
                                                            <a class="content_product_order_price"><fmt:formatNumber value="${pay.total}" pattern="#,###"></fmt:formatNumber></a>
                                                            <a class="content_product_order_quantity">Số lượng: ${pay.quantity}</a>
                                                        </div>
                                                    </div>

                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="product" items="${product}">
                                        <c:if test="${product.pid == pay.pid}">
                                            <c:set var="pro" value="${product}"></c:set>
                                            <c:forEach var="shopOwner" items="${shopOwner}">
                                                 <c:if test="${pro.soid == shopOwner.soid}">
                                                    <c:set var="Ow" value="${shopOwner}"></c:set> 

                                                    <div class="product_order">
                                                        <div class="product_order_Shop">
                                                            <img src="${Ow.avatar}"/>
                                                        <a>${Ow.name}</a>
                                                    </div>
                                                    <div class="horizontal_lines"></div>
                                                    <div class="product_order_Shop_content">    
                                                        <img src="${pro.image}" />
                                                        <div class="content_product_order">
                                                            <a>${pro.name}</a>
                                                        </div>                   
                                                        <a class="content_product_order_price"><fmt:formatNumber value="${pro.price * pay.quantity}" pattern="#,###"></fmt:formatNumber></a>
                                                            <a class="content_product_order_quantity">Số lượng: ${pay.quantity}</a>
                                                            <c:if test="${pay.rentTime == 7}">
                                                                <a class="content_product_order_time">Thời gian thuê: 1 tuần</a>
                                                            </c:if>
                                                            <c:if test="${pay.rentTime == 14}">
                                                                <a class="content_product_order_time">Thời gian thuê: 2 tuần</a>
                                                            </c:if>
                                                            <c:if test="${pay.rentTime == 30}">
                                                                <a class="content_product_order_time">Thời gian thuê: 1 Tháng</a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <div class="Detailed_summary">
                            <div class="horizontal_lines"></div>
                            <a>Tóm tắt yêu cầu</a>
                            <div class="Detailed_summary_topic">
                                <a>Tổng phụ</a><br><br>
                                <a>Phí vận chuyển</a><br><br>
                                <a>Chiết khấu</a><br><br>
                                <a>Điểm thưởng</a><br><br>
                                <a>Tổng</a>
                            </div>
                            <form action="MainController" method="post">
                                <input type="hidden" value="Payment" name="action"/>
                                <div class="Detailed_summary_price">
                                    <a><c:set var="total" value="${totalBuy + totalRent + totalDeposit}"></c:set></a>
                                    <input type="hidden" name="txtPayment" value="${total}" />
                                    <a id="subtotal"><fmt:formatNumber value="${total}" pattern="#,###"></fmt:formatNumber></a><br><br>
                                        <a>0</a><br><br>
                                        <a>0</a><br><br>
                                        <a id="points"><%= cus.getMembership()%> </a><br><br>
                                        <a id="total">0</a>
                                    </div>
                                    <div class="checkbox_point">
                                        <input type="checkbox" id="togglePoints" onchange="updateTotal()" />
                                    </div>
                                    <input type="hidden" id="usedPoints" name="txtUsedPoints" value="" />    
                                </div>

                                <div class="payment_choose">
                                    <div class="horizontal_lines"></div>
                                    <a>Phương thức thanh toán</a>
                                    <div class="payment_choose_bank">
                                        <a>Thanh toán bằng ngân hàng</a><br><br>
                                        <a>Thẻ tín dụng / thẻ ghi nợ</a>
                                    </div>
                                    <div class="payment_choose_radio">      
                                        <input type="radio" name="txtBank" value="1"><br><br>
                                        <input type="radio" name="txtBank" value="2">
                                    </div>
                                </div>        
                                <div class="background_payment_botton">
                                    <input type="submit" value="Thanh toán"/>  
                                </div>  
                            </form>
                        </div>
                    </div>
                </div>       
        </c:if>        

        <script src="JS/ChangeTimeCart.js"></script>
        <script src="JS/ChangeCartBuy.js"></script>
        <script src="JS/UsePoint.js"></script>
    </body>
</html>
