<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owner Orders</title>

        <style>
            .Nav_Bar {
                height: 100%;
                width: 350px;
                margin-top: 120px;
                background-color: #F2F1F1;
                position: relative;
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
            .button {
                height: 30px;
                background-color: white;
                color: black;
                border: 1px solid #ccc;
                border-radius: 5px;
                cursor: pointer;
                width: 120px;
                margin: 10px;
                transition: background-color 0.3s, color 0.3s;
            }
            .button.active {
                background-color: #37A28F; /* Active button background color */
                color: white; /* Active button text color */
            }
            .hidden {
                display: none;
            }
            .visible {
                display: block;
            }
            .buttom_Buy_Rent{
                margin-left: 32px;
            }

            .SOD{
                margin-top: 150px;
                margin-left: 385px;               
            }
            .ShowOrderDetail{
                margin-bottom: 20px;
                background-color: #EEEEEE;
                width: 1090px;
                height: auto;
                border-radius: 10px;
                padding-bottom: 20px; 
            }
            .info{
                display: flex;
                margin-left: 29px;
                padding-top: 10px
            }
            .info1 img{
                width: 120px;
                height: 120px;
            }
            .info1 a{
                font-size: 12px;
            }
            .info2{
                margin-left: 30px;
            }
            .info2 p {
                font-size: 20px;
                width: 600px;
                margin-bottom: 40px;
                line-height: 1.2em; /* Chiều cao của một dòng */
                max-height: 2.4em; /* Giới hạn chiều cao cho 2 dòng */
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: normal;
                display: block;
                word-break: break-word;
            }


            .info2 a{
                font-size: 10px;
            }
            .info3{
                margin-top: 120px;
                margin-left: 20px;
                display: flex;
            }
            .info3 a{
                margin-left: 30px;
                margin-right: 30px;
            }
            .info3 input{
                width: 75px;
                height: 30px;
            }
        </style>
    </head>
    <body>
        <%@include file="OwnerNavigation.jsp" %>
        <div class="Nav_Bar">
            <div class="Search">
                <form action="MainController" method="post">
                    <input type="text" name="" placeholder="Tìm kiếm"/>
                    <input type="hidden" value="" name="action"/>
                    <button type="submit">
                        <img src="Image/KinhLup.jpg"/>
                    </button>
                </form>
            </div>

            <!-- Buttons for "Bán" and "Cho thuê" -->
            <div class="buttom_Buy_Rent">
                <button id="btn_buy" class="button active">Bán</button>
                <button id="btn_rent" class="button">Cho thuê</button>
            </div>

            <!-- Các phần chức năng -->
            <div class="feature" id="buy_section" style="display: block;">
                <a href="MainController?action=ownerOrder&txtStatus=1">Chờ xử lý</a>
                <a href="MainController?action=ownerOrder&txtStatus=2">Đang giao</a>
                <a href="MainController?action=ownerOrder&txtStatus=8">Giao thành công</a>
                <a href="MainController?action=ownerOrder&txtStatus=6">Đơn hàng hủy</a>
                <a href="MainController?action=ownerOrder&txtStatus=5">Trả hàng</a>
            </div>
            <div class="feature" id="rent_section" style="display: none;">
                <a href="MainController?action=ownerOrder&txtStatus=1">Chờ xử lý</a>
                <a href="MainController?action=ownerOrder&txtStatus=2">Đang giao</a>
                <a href="MainController?action=ownerOrder&txtStatus=3">Đang cho thuê</a>
                <a href="MainController?action=ownerOrder&txtStatus=4">Đang trả hàng</a>
                <a href="MainController?action=ownerOrder&txtStatus=7">Trả thành công</a>
                <a href="MainController?action=ownerOrder&txtStatus=8">Hoàn thành</a>
            </div>
        </div>
        <div class="SOD">
            <c:forEach var="OwnerODID" items="${OwnerOrderDetail}">
                <div class="ShowOrderDetail">

                    <div class="info">
                        <div class="info1">
                            <a>PID: ${OwnerODID.pid}</a><br>
                            <img src="Image/Logo.jpg"/>
                        </div>
                        <div class="info2">
                            <p>ABCsalkgjsalgkasjglkasjglakgsajlgkajglakgjsalkgajlkajgalkgjslkajlgkasjglkajglaksgjlakgjalkgjalskdjaslkgjskgjdkjgndkgsfdgkljdhgkdjgdsfkljgsdflkgjhsdklgjdsgalksfjalfajflkasfjkjdhsgksdfjhdkjfgdhsgkldsfhgkjdssdkljhsdkljgdshlgkjdfshgksdjghdlskgjhdsflkjghsdlkjgdhslkjd</p><br>
                            <a>Số lượng: ${OwnerODID.quantity}</a>
                        </div>
                        <div class="info3">
                            <form action="MainController" method="post">
                                <input type="hidden" value="${OwnerODID.odid}" name="txtODID">
                                <input type="hidden" value="2" name="txtStatusUpdate">
                                <input type="hidden" value="UpdateOrder" name="action"/>
                                <input type="submit" value="Nhận đơn"/>
                            </form>
                            <a>|</a>
                            <form action="MainController" method="post">
                                <input type="hidden" value="${OwnerODID.odid}" name="txtODID">
                                <input type="hidden" value="8" name="txtStatusUpdate">
                                <input type="hidden" value="UpdateOrder" name="action"/>
                                <input type="submit" value="Hủy đơn"/>
                        </div>
                        <a href="">Chi tiết</a>
                    </div>

                </div>
            </c:forEach>
        </div>
        <script src="JS/BuyOrRent.js"></script>
    </body>
</html>
