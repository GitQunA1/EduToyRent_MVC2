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
                background-color: #F5F5FA;
                width: 100%;
                height: 100%;
                margin: 0;
                padding: 0;
                overflow: auto; 
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
                font-family: Arial;
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
                font-family: arial;
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
                font-family: arial;
            } 
            
            .Advertising_content_second img{
                width: 580px;
                height: 360px;
            }
            
            /* Bố cục chính của các sản phẩm */
            .Show_product {
                display: grid;
                grid-template-columns: repeat(7, 1fr);
                gap: 10px; 
                padding: 10px;
            }

            .Show_product img {
                width: 100%;
                height: 180px; 
                border-radius: 5px;
                
                
            }

            .Show_product .product-box {
                display: flex;
                flex-direction: column; 
                justify-content: space-between;
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 13px;
                text-align: center;
                background-color: white;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                height: 300px; 
            }

            
            .Show_product p {
                margin: 10px 0;
                font-family: Arial;
                font-size: 14px;
                display: -webkit-box;
                -webkit-line-clamp: 2; 
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                max-height: 40px; 
                text-align: left;
                color: #27272a;  
                align-self: stretch;
                text-transform: none;
                line-height: 1.5;
            }

            .Show_product a {
                font-family: Arial;
                display: block;
                font-size: 15px;
                color: #333;
                text-decoration: none;
            }
            .Show_product form {
                margin-top: 10px;
            }


             /* ------------------------------------------- */
            
             .background_first{
                margin-top: 20px;
                background: linear-gradient(rgba(213, 236, 253, 2) 22.49%, rgba(213, 236, 253, 0.6) 73.49%, rgba(213, 236, 253, 0.6) 12.49%);
                padding-top: 30px;
                padding-bottom: 20px;
             }
             .show_more{
                 text-align: center;
                 justify-content: center;
                 display: flex; 
                 font-size: 15px;
                 margin-top: 30px;
                 color: #333;
                font-family: Arial;
             }
             .background_second{
                margin-top: 50px;
                padding-top: 30px;
                background: linear-gradient(rgba(213, 236, 253, 2) 22.49%, rgba(213, 
                    236, 253, 0.6) 73.49%, rgba(213, 236, 253, 0.6) 12.49%);
                padding-bottom: 20px;
             }
             .background_final{
                margin-top: 50px;
                padding-top: 30px;
                background: linear-gradient(rgba(213, 236, 253, 2) 22.49%, rgba(213, 
                    236, 253, 0.6) 73.49%, rgba(213, 236, 253, 0.6) 12.49%);
                padding-bottom: 20px;
             }
             .product_view{
                 background: linear-gradient(315deg, rgba(213, 236, 253, 2) 50%, 
                     rgba(213, 236, 253, 0.6) 10%, rgba(213, 236, 253, 2) 100%);
                 margin-top: 80px;
                 padding-top: 20px;
                 padding-bottom: 30px;
             }
            .Rented_product{
                background: linear-gradient(135deg, rgba(213, 236, 253, 2) 50%, 
                    rgba(213, 236, 253, 0.6) 10%, rgba(213, 236, 253, 2) 100%);
                padding-bottom: 20px;
            }
            .Rented_product h2{
               margin-left: 50px;
               padding-top: 30px;
            }
            .second-hand-product{
                background: linear-gradient(315deg, rgba(213, 236, 253, 2) 50%, 
                    rgba(213, 236, 253, 0.6) 10%, rgba(213, 236, 253, 2) 100%);
                padding-bottom: 20px;
                margin-top: 20px;
            }
            .second-hand-product h2{
               margin-left: 50px;
               padding-top: 30px;
            }
            .topic_sort{
                display: flex;
            }
            .topic_sort a{
                font-size: 15px;
                
                padding-top: 54px;
                color: black;
                margin-left: 1010px;
                font-family: Arial;
            }
            .menu_option img{
                width: 130px;
                height: 130px;
                border-radius: 10px;
                margin-left: 230px;
                border: 2px solid #71D6FF;
            }
            .menu_option{
                background-color: rgb(160, 200, 190);
                padding-top: 25px;
                padding-bottom: 20px;
                margin-bottom: 20px;
            }
            
            .Description_content{
                background-color: #FADED7;
                padding-top: 20px;
                padding-bottom: 20px;
                margin-bottom: 20px;
            }
            
            .Description_content img{
                width: 520px;
                height: 420px;
                margin-left: 20px;
            }
            .Description_content h1{
                text-align: center;
                font-family: Arial;
            }
            .Description_content_center{
                display: flex;
            }
            .content{
                margin-left: 20px;
                margin-right: 20px;
            }
            .content a{
                font-size: 18px;
                font-family: Arial;
                gap: 1px;
                margin-bottom: 5px;
                line-height: 1.5;
            }
        /*    .background_slide{
                background-color: #FADED7;
                width: 100%;
                height: auto;
                padding-top: 20px;
                padding-bottom: 20px;
            }
            .slideshow {
                overflow: hidden;
                height: 300px;
                width: 1200px; 
                border-radius: 20px;
                margin-left: 90px;
                margin-bottom: 20px;
            }

            .slide-wrapper {
                width: calc(1200px * 4); 
                display: flex;
                -webkit-animation: slide 1s ease infinite;
                animation: slide 20s ease infinite;
            }

            .slide {
                width: 1200px;  
                height: 300px;  
                flex-shrink: 0;
                background-color: rgb(210, 220, 225);
            }
            .slide img{
                width: 100%;
                height: 100%;
            }
            @keyframes slide {
                0% { margin-left: 0px; }
                25% { margin-left: -1200px; }  
                50% { margin-left: -2400px; } 
                75% { margin-left: -3600px; } 
                100% { margin-left: 0px; }    
            }
            */
        </style>
        
    </head>
    <body> 
        <%@include file="UserNavigation.jsp" %>
        
 

        <div class="Advertising">
           <%-- <div class="background_slide">
                <div class="slideshow">
                    <div class="slide-wrapper">
                        <div class="slide"><img src="Image/banner1.jpeg"></div>
                        <div class="slide"><img src="Image/baner2.jpg"></div>
                        <div class="slide"><img src="Image/baner3.jpg"></div>
                        <div class="slide"><img src="Image/baner4.jpg"></div>
                    </div>
                </div>
            </div> --%>
            <div class="menu_option">
                
                <a href="MainController?action=ProductFilter&txtOption=1"><img src="Image/rented.jpg"/></a>
                <a href="MainController?action=ProductFilter&txtOption=2"><img src="Image/secondHand.jpg"/></a>
                <a href="MainController?action=ProductFilter&txtOption=3"><img src="Image/newPro.jpg"/></a>
            </div>
 
            <div class="Description_content">
                <h1>Giải pháp tiết kiệm cho phụ huynh: Thuê đồ chơi và những lợi ích bất ngờ</h1>
                <div class="Description_content_center">
                    <img src="https://vnmedia2.monkeyuni.net/upload/web/img/1-Do-choi-giao-duc.jpg" />
                    <div class="content">
                        <a>1. Tiết kiệm chi phí: Trẻ em thường nhanh chóng chán với các món đồ chơi 
                        sau một thời gian ngắn. Thuê đồ chơi cho phép phụ huynh cung cấp nhiều 
                        loại đồ chơi phong phú cho con mà không phải chi một khoản lớn để mua chúng. 
                        Điều này đặc biệt có lợi với những món đồ chơi giáo dục cao cấp, thường có giá thành khá cao.</a><br><br>
                        <a>2. Khám phá và thử nghiệm: Khi thuê đồ chơi, phụ huynh có thể dễ dàng cho con thử 
                        nhiều loại đồ chơi khác nhau để khám phá sở thích và phát triển các kỹ năng cần thiết.
                        Điều này giúp trẻ liên tục được kích thích sự tò mò và sáng tạo.</a><br><br>
                        <a>3. Giảm thiểu lãng phí và bảo vệ môi trường: Thuê đồ chơi giúp giảm thiểu việc sản xuất
                        và thải bỏ đồ chơi cũ. Việc này không chỉ tiết kiệm tài nguyên mà còn giúp phụ huynh truyền 
                        cảm hứng về lối sống bền vững cho con từ khi còn nhỏ.</a><br><br>
                        <a>4. Tiện lợi và tiết kiệm không gian: Thuê đồ chơi giúp tránh tình trạng đồ chơi cũ tích tụ, chiếm 
                        nhiều không gian trong nhà. Phụ huynh có thể trả lại khi con không còn hứng thú và chọn những 
                        món đồ chơi mới, tạo sự ngăn nắp và gọn gàng cho không gian sống.</a><br><br>
                        <a> 5. Đồ chơi luôn được vệ sinh và an toàn: Các dịch vụ cho thuê đồ chơi luôn đảm bảo vệ sinh và kiểm 
                        tra chất lượng các món đồ chơi trước khi đến tay khách hàng, giúp phụ huynh yên tâm về an toàn cho con.</a>
                    </div>
                </div>
            </div>
            
            
            <div class="Rented_product">
                <div class="topic_sort">
                    <h2 style="font-family: Arial;">Thuê đồ chơi</h2>
                    <a href="MainController?action=ProductFilter&txtOption=1">Xem thêm</a>
                </div>
                <div class="Show_product">
                    <c:forEach var="listRented" items="${listRented}">
                        <div class="product-box">
                            <a href="MainController?txtPID=${listRented.pid}&action=viewProduct">
                                <img src="${listRented.image}"/>
                                <p>${listRented.name}</p>
                                <a>Giá: <fmt:formatNumber value="${listRented.price}" pattern="#,###"></fmt:formatNumber> đ </a>
                                </a>  
                        </div>
                    </c:forEach>                       
                </div>
            </div>
            
            
            
            
            <div class="second-hand-product">
                <div class="topic_sort">
                    <h2 style="font-family: Arial;">Mua lại đồ chơi cũ</h2>
                    <a href="MainController?action=ProductFilter&txtOption=2" style="margin-left: 955px;">Xem thêm</a>
                </div>
                
                <div class="Second_hand_product">
                    <div class="Show_product">
                        <c:forEach var="SecondHand" items="${SecondHand}">
                            <div class="product-box">
                                <a href="MainController?txtPID=${SecondHand.pid}&action=viewProduct">
                                    <img src="${SecondHand.image}"/>
                                    <p>${SecondHand.name}</p>
                                    <a>Giá: <fmt:formatNumber value="${SecondHand.price}" pattern="#,###"></fmt:formatNumber> đ </a>
                                </a> 
                            </div>
                        </c:forEach>                       
                    </div>
                </div>
            </div>
            
            
            <div>
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
                                   
                                </div>
                            </c:forEach>                       
                        </div> 
                        <a href="MainController?action=SearchGender&txtcategory=Ngôn ngữ&txtQRent=0&txtQSell=1&txtStype=1" class="show_more">Xem thêm</a>
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
                                      
                                </div>
                            </c:forEach>                       
                        </div> 
                        <a href="MainController?action=SearchGender&txtcategory=Giải đố&txtQRent=0&txtQSell=1&txtStype=1" class="show_more">Xem thêm</a>
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
                                       
                                </div>
                            </c:forEach>                       
                        </div>
                        <a href="MainController?action=SearchGender&txtcategory=Toán học&txtQRent=0&txtQSell=1&txtStype=1" class="show_more">Xem thêm</a>
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
                                   
                            </div>
                        </c:forEach>                       
                    </div>
                    <a href="MainController?action=ProductFilter&txtOption=3&txtQRent=0&txtQSell=1&txtStype=1" class="show_more">Xem thêm</a>
                </div>
                
            </div>
        </div>
    </div>
    
    <%@include file="HeaderPage.jsp" %>
                                                                                                                                                                                                                    
        
    </body>
</html>
