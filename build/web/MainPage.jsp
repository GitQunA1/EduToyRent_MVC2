<%-- 
    Document   : MainPage
    Created on : Oct 19, 2024, 3:27:42 AM
    Author     : Quyền
--%>

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
                margin-top: 130px;
                background-color: white;
                padding-top: 20px;
                margin-left: 70px;
                margin-right: 70px;
                border-radius: 10px;
                margin-bottom: 50px;
                padding-bottom: 100px;
            }
            .Advertising_content_first{
                display: flex;
                margin-left: 100px;
                margin-right: 100px;
                margin-top: 80px;
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
                margin-top: 80px;
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
        </style>
        
    </head>
    <body>
        
        <%@include file="UserNavigation.jsp" %>
        <div class="Advertising">
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
                <c:if test="${ not empty productNN}" >
                    <c:forEach var="p" items="" >
                       
                    </c:forEach>
                </c:if>
               
            </div>
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
        </div>
        
                                                                                                                                                                                                                    
        
    </body>
</html>
