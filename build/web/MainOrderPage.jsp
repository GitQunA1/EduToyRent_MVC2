<%-- 
    Document   : MainOrderPage
    Created on : Oct 19, 2024, 2:50:20 PM
    Author     : Quyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            .content_order{
                margin-top: 120.3px;
                background-color: white; 
                box-shadow: 0 1px 0 2px rgba(0, 0, 0, 0.3);
                padding-top: 15px;
                height: 30px;
                width: 99%;
                position: fixed;
                overflow: auto;
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
        </style>
        
    </head>
    <body>
        <%@include  file="UserNavigation.jsp" %>
        
        <%--trạng thái đơn hàng xử lý txtcontent . xử lý MainController: action=InformationOrder --%>
        <div class="content_order">
            <a class="active" href="MainController?filter=all&action=InformationOrder&txtcontent=Tất cả">Tất cả</a>
            <a href="MainController?filter=pending&action=InformationOrder&txtcontent=Chờ Vận Chuyển">Chờ vận chuyển</a>
            <a href="MainController?filter=shipping&action=InformationOrder&txtcontent=Đang vận Chuyển">Đang vận chuyển</a>
            <a href="MainController?filter=rented&action=InformationOrder&txtcontent=Đang thuê">Đang thuê</a>
            <a href="MainController?filter=review&action=InformationOrder&txtcontent=Cần đánh giá">Cần đánh giá</a>
            <a href="MainController?filter=return&action=InformationOrder&txtcontent=Trả hàng">Trả hàng</a>
            <a href="MainController?filter=canceled&action=InformationOrder&txtcontent=Hủy đơn">Hủy đơn</a>
            <a href="MainController?filter=history&action=InformationOrder&txtcontent=Lịch Sử">Lịch sử</a>
        </div>
        
        
        <script src="JS/ButtonAuto.js"></script>
    </body>
</html>
