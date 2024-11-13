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
            .feature a.active-feature {
                text-decoration: underline;
                font-weight: bold; /* Để làm nổi bật hơn */
                color: #71D6FF; /* Màu chữ khi được chọn */
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
                padding-top: 10px;
                position: relative;
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
            .detail{
                position: absolute;
                bottom: 125px;
                margin-left: 980px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="OwnerNavigation.jsp">
            <jsp:param name="currentPage" value="ownerOrder" />
        </jsp:include>

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

            <!-- Các phần chức năng -->
            <div class="feature" style="display: block;">
                <a href="MainController?action=ownerOrder&txtStatus=1&txtOption=0" 
                   class="${empty param.txtStatus || param.txtStatus == '1' ? 'active-feature' : ''}">Chờ xử lý</a>
                <a href="MainController?action=ownerOrder&txtStatus=2&txtOption=0" 
                   class="${param.txtStatus == '2' ? 'active-feature' : ''}">Đang giao</a>
                <a href="MainController?action=ownerOrder&txtStatus=3&txtOption=1" 
                   class="${param.txtStatus == '3' ? 'active-feature' : ''}">Đang cho thuê (T)</a>
                <a href="MainController?action=ownerOrder&txtStatus=4&txtOption=1" 
                   class="${param.txtStatus == '4' ? 'active-feature' : ''}">Hoàn tất thuê (T)</a>
                <a href="MainController?action=ownerOrder&txtStatus=5&txtOption=1" 
                   class="${param.txtStatus == '5' ? 'active-feature' : ''}">Trả thành công (T)</a>
                <a href="MainController?action=ownerOrder&txtStatus=6&txtOption=1" 
                   class="${param.txtStatus == '6' ? 'active-feature' : ''}">Xử lý thanh toán (T)</a>
                <a href="MainController?action=ownerOrder&txtStatus=7&txtOption=2" 
                   class="${param.txtStatus == '7' ? 'active-feature' : ''}">Trả hàng (B)</a>
                <a href="MainController?action=ownerOrder&txtStatus=8&txtOption=0" 
                   class="${param.txtStatus == '8' ? 'active-feature' : ''}">Đơn hàng hủy</a>
                <a href="MainController?action=ownerOrder&txtStatus=10&txtOption=0" 
                   class="${param.txtStatus == '10' ? 'active-feature' : ''}">Hoàn thành</a>
            </div>
        </div>



        <div class="SOD">
            <c:forEach var="OwnerODID" items="${OwnerOrderDetail}">
                <c:forEach var="product" items="${ProuductOrdered}">
                    <c:if test="${OwnerODID.pid == product.pid}">
                        <div class="ShowOrderDetail">
                            <div class="info">
                                <div class="info1">
                                    <a>PID: ${OwnerODID.pid}</a><br>
                                    <img src="${product.image}"/>
                                </div>
                                <div class="info2">
                                    <p>${product.name}</p><br>
                                    <a>Số lượng: ${OwnerODID.quantity}</a>
                                </div>
                                <c:if test="${OwnerODID.status == 1}">
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
                                        </form>
                                    </div>
                                </c:if>
                                <a class="detail" href="">Chi tiết</a>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>
    </body>
</html>
