<%-- 
    Document   : MainPage
    Created on : Oct 19, 2024, 3:27:42 AM
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
                background-color: #EAEAEA;
            }
            .Advertising{
                background-color: white;
                margin-left: 70px;
                margin-right: 70px;
                border-radius: 10px;
                margin-bottom: 50px;
                padding-bottom: 100px;
                padding-top: 130px;
            }
            .toppic_content{
                text-align: center;
            }
            .Advertising_content_first{
                display: flex;
                margin-left: 100px;
                margin-right: 100px;
                
                margin-bottom: 70px;
                
            }
            .Advertising_content_first img{
                width: 580px;
                height: 360px;
            }
            .Advertising_content_first p{
                margin-left: 50px;
                font-size: 20px;
                line-height: 1.5;
            }
            .Advertising_content_second{
                display: flex;
                margin-left: 50px;
                margin-right: 100px;
                margin-bottom: 70px;
            }
            .Advertising_content_second p{
                margin-left: 50px;
                font-size: 20px;
                margin-right: 50px;
                line-height: 1.5;
            } 
            
            .Advertising_content_second img{
                width: 580px;
                height: 360px;
            }
            
            
            
            /* Bố cục chính của các sản phẩm */
            .Show_product {
                display: grid;
                grid-template-columns: repeat(7, 1fr);
                gap: 10px; /* Khoảng cách giữa các sản phẩm */
                padding: 10px;
            }

            .Show_product img {
                width: 157px;
                height: 180px; 
                border-radius: 5px;
                object-fit: cover; 
            }

            .Show_product .product-box {
                display: flex;
                flex-direction: column; 
                justify-content: space-between;
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 13px;
                text-align: center;
                background-color: #f9f9f9;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                height: 350px; 
            }

            
            .Show_product p {
                margin: 10px 0;
                font-weight: bold;
                font-size: 15px;
                display: -webkit-box;
                -webkit-line-clamp: 2; /* Hiển thị tối đa 2 dòng */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis; 
                max-height: 40px; 
            }

            .Show_product a {
                
                display: block;
                font-size: 17px;
                color: #333;
            }
            .Show_product form {
                margin-top: 10px;
            }

            .product-box input[type="submit"] {
                margin-top: 10px;
                height: 25px;
                background-color: #FFBD68;
                color: #333;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                
            }

             /* ------------------------------------------- */
            
             .background_first{
                 background-color: #FFAB40;
                 padding-top: 30px;
                
                 padding-bottom: 20px;
             }
             .show_more{
                 text-align: center;
                 justify-content: center;
                 display: flex; 
                 font-size: 20px;
                 margin-top: 30px;
                 color: #333;
             }
             .background_second{
                margin-top: 50px;
                background-color: #51D9FF;
                padding-top: 30px;
                
                padding-bottom: 20px;
             }
             .background_final{
                  margin-top: 50px;
                 background-color: #ABDC4F;
                 padding-top: 30px;
                
                 padding-bottom: 20px;
             }
             .product_view{
                 margin-top: 150px;
                 background-color: #FFBCDD;
                 padding-top: 20px;
                 padding-bottom: 30px;
             }
        </style>
        
    </head>
    <body>
        
        <%@include file="UserNavigation.jsp" %>
        <div class="Advertising">
            <c:if test="${not empty listNgonNgu}">
                <div class="background_first">
                    <h1 class="toppic_content">Đồ chơi ngôn ngữ</h1>
                    <div class="Advertising_content_first">
                        <img src="Image/Ngon ngu.jpg" />  
                        <p>Đồ chơi ngôn ngữ giúp trẻ mở rộng vốn từ vựng qua các chủ đề như động vật, 
                            thực phẩm, và xã hội, đồng thời cải thiện khả năng phát âm và ngữ điệu nhờ 
                            các tính năng âm thanh tích hợp. Trẻ cũng được khuyến khích phát triển kỹ 
                            năng viết và sáng tạo thông qua việc tạo ra câu chuyện từ hình ảnh và nội 
                            dung có sẵn. Bên cạnh đó, đồ chơi này còn giúp trẻ nâng cao khả năng lắng 
                            nghe và hiểu, đồng thời kích thích tính tò mò và sự tự chủ trong việc 
                            khám phá và học hỏi thông qua các nhiệm vụ và câu hỏi.
                        </p>             
                    </div>

                    <div class="Show_product">

                        <c:forEach var="procuct1" items="${listNgonNgu}">
                            <div class="product-box">
                                <a href="MainController?txtPID=${procuct1.pid}&action=viewProduct">
                                    <img src="${procuct1.image}"/>
                                    <p>${procuct1.name}</p>
                                    <a>Giá: <fmt:formatNumber value="${procuct1.price}" pattern="#,###"></fmt:formatNumber> đ </a>
                                    </a>
                                    <form action="MainController" method="post">
                                        <input type="hidden" value="${procuct1.pid}" name="txtPID"/>   
                                    <input type="hidden" value="AddCart" name="action"/>
                                    <input type="submit" value="Thêm vào giỏ hàng" />
                                </form>
                            </div>
                        </c:forEach>                       
                    </div> 
                    <a href="MainController?action=SearchGender&txtcategory=Ngôn ngữ" class="show_more">Xem thêm</a>
                </div>               
            </c:if> 

            <c:if test="${not empty listGiaiDo}">
                <div class="background_second">
                    <h1 class="toppic_content">Đồ chơi giải đố</h1>
                    <div class="Advertising_content_second">
                        <p>
                            Đồ chơi giải đố giúp trẻ phát triển tư duy logic, kỹ năng giải quyết vấn đề 
                            và khả năng phân tích. Khi giải các câu đố, trẻ học cách quan sát, phân tích
                            và đưa ra giải pháp phù hợp, từ đó nâng cao khả năng suy nghĩ độc lập. Các 
                            trò chơi này cũng giúp trẻ rèn luyện khả năng kiên nhẫn và tập trung, vì việc 
                            hoàn thành một câu đố thường đòi hỏi sự chú ý và thời gian. Ngoài ra, đồ chơi 
                            giải đố còn kích thích sự sáng tạo và khả năng tư duy không gian, giúp trẻ phát 
                            triển toàn diện về trí tuệ và khả năng tư duy phản biện.
                        </p>
                        <img src="Image/Giai do.jpg"/>
                    </div>

                    <div class="Show_product">
                        <c:forEach var="procuct2" items="${listGiaiDo}">
                            <div class="product-box">
                                <a href="MainController?txtPID=${procuct2.pid}&action=viewProduct">
                                    <img src="${procuct2.image}"/>
                                    <p>${procuct2.name}</p>
                                    <a>Giá: <fmt:formatNumber value="${procuct2.price}" pattern="#,###"></fmt:formatNumber> đ </a>
                                    </a>
                                    <form action="MainController" method="post">
                                        <input type="hidden" value="${procuct2.pid}" name="txtPID"/>   
                                    <input type="hidden" value="AddCart" name="action"/>
                                    <input type="submit" value="Thêm vào giỏ hàng" />
                                </form>
                            </div>
                        </c:forEach>                       
                    </div> 
                    <a href="MainController?action=SearchGender&txtcategory=Giải đố" class="show_more">Xem thêm</a>
                </div>
            </c:if> 
            
            <c:if test="${not empty listToanHoc}">
                <div class="background_final">
                    <h1 class="toppic_content">Đồ chơi toán học</h1>
                <div class="Advertising_content_first">
                    
                        <img src="Image/Toan hoc.jpg"/>
                        <p>
                            Đồ chơi toán học giúp trẻ phát triển các kỹ năng tư duy logic, tính toán và giải
                            quyết vấn đề. Thông qua việc chơi với các con số, hình học, và phép tính đơn giản,
                            trẻ dần hiểu các khái niệm cơ bản như đếm, cộng trừ, và phân loại. Những trò chơi 
                            này không chỉ làm cho việc học toán trở nên thú vị mà còn giúp trẻ rèn luyện kỹ năng
                            tư duy phản biện và giải quyết các tình huống thực tế. Đồ chơi toán học cũng kích 
                            thích sự tập trung và kiên nhẫn, tạo nền tảng vững chắc cho việc học toán trong tương lai.
                        </p>
                    </div>
                    
                    <div class="Show_product">
                        <c:forEach var="procuct3" items="${listToanHoc}">
                            <div class="product-box">
                                <a href="MainController?txtPID=${procuct3.pid}&action=viewProduct">
                                    <img src="${procuct3.image}"/>
                                    <p>${procuct3.name}</p>
                                    <a>Giá: <fmt:formatNumber value="${procuct3.price}" pattern="#,###"></fmt:formatNumber> đ </a>
                                    </a>
                                    <form action="MainController" method="post">
                                        <input type="hidden" value="${procuct3.pid}" name="txtPID"/>   
                                        <input type="hidden" value="AddCart" name="action"/>
                                        <input type="submit" value="Thêm vào giỏ hàng" />
                                </form>
                            </div>
                        </c:forEach>                       
                    </div>
                    <a href="MainController?action=SearchGender&txtcategory=Toán học" class="show_more">Xem thêm</a>
                </div>
            </c:if>  


            <div class="product_view">
                <div class="Show_product">
                    <c:forEach var="procuct" items="${mainProductList}">
                        <div class="product-box">
                            <a href="MainController?txtPID=${procuct.pid}&action=viewProduct">
                                <img src="${procuct.image}"/>
                                <p>${procuct.name}</p>
                                <a>Giá: <fmt:formatNumber value="${procuct.price}" pattern="#,###"></fmt:formatNumber> đ</a>
                                </a>
                                <form action="MainController" method="post">
                                    <input type="hidden" value="${procuct.pid}" name="txtPID"/>   
                                <input type="hidden" value="AddCart" name="action"/>
                                <input type="submit" value="Thêm vào giỏ hàng" />
                            </form>
                        </div>
                    </c:forEach>                       
                </div>
                <a href="" class="show_more">Xem thêm</a>
            </div>
        </div>
        </div>

                                                                                                                                                                                                                    
        
    </body>
</html>
