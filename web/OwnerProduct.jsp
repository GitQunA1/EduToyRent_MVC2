<%-- 
    Document   : OwnerProduct
    Created on : Oct 24, 2024, 10:29:41 PM
    Author     : HagiLee
--%>
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
            .Nav_Bar{
                height: 100%;
                width: 350px;
                margin-top: 120px;
                background-color: #F2F1F1;        
                position: relative;
                position: fixed;
            }
            .Search img{
                width: 15px;
                height: 15px;
                margin-top: 2px;
            }
            .Search button[type="submit"]{
                position: absolute;
                border: none;
                margin-left: 240px;
                background: none;
            }
            .Search form{
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .Search{
                padding-top: 30px;
            }
            .Search input[type="text"]{
                padding-right: 15px;
                height: 25px;
                width: 250px;
                border-radius: 7px;
            }
            .feature{
                margin-top: 50px;
            }
            .feature a{
                display: block;
                text-align: center;
                margin-bottom: 30px;
                text-decoration: none;
                color: black;
            }


        </style>
    </head>
    <body>
        <jsp:include page="OwnerNavigation.jsp">
            <jsp:param name="currentPage" value="ownerProduct" />
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
            <div class="feature">
                <a href="MainController?action=OwnerProduct&txtStatus=1" >Đang hoạt động</a>
                <a href="MainController?action=OwnerProduct&txtStatus=2">Còn ít tồn kho</a>
                <a href="MainController?action=OwnerProduct&txtStatus=3">Đang xét duyệt</a>
                <a href="MainController?action=OwnerProduct&txtStatus=4">Không thành công</a>
                <a href="MainController?action=OwnerProduct&txtStatus=5">Đóng băng</a>
            </div>


        </div>
        <div class="Show_product">
            <c:forEach var="procuct" items="${List}">
                <div class="product-box">
                    <img src="${procuct.image}"/>
                    <p>${procuct.name}</p>
                    <a>Giá: <fmt:formatNumber value="${procuct.price}" pattern="#,###"></fmt:formatNumber> đ </a>

                    </div>
            </c:forEach>  
        </div>
    </body>
</html>
