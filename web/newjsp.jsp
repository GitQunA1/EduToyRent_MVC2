<%-- 
    Document   : newjsp
    Created on : Nov 16, 2024, 4:26:51 PM
    Author     : Quyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Toys Kids Education</title>
        <style>
            body{
                background-color: #555;
                width: 100%;
                height: 100%;
                font-family: arial;
            }
            .background_email{
                background-color: white;
                height: auto;
                width: 80%;
                padding-top: 20px;
                padding-bottom: 20px;
                margin: 0 auto; 
                position: absolute; 
                top: 50%; 
                left: 50%; 
                transform: translate(-50%, -50%); 
                margin-top: 200px;
                
            }
            .topic{
                color: #FF74B8;
                display: flex;
                justify-content: center;
                margin-bottom: 90px;
            }
            .content_email{
               margin-left: 100px;
            }
            .line{
                background-color: #555;
                width: 150%;
                height: 2px;
                margin-left: -100px;
                margin-top: 20px;
                margin-bottom: 10px;
            }
            .address_order{
                margin-left: 50px;
            }
            .address_order a{
               margin-right: 200px;
               line-height: 1.5;
            }
            .product_email{
                position: relative;
            }
            .product_email img{
                width: 110px;
                height: 120px;
                border: 1px solid #333;
                
            }
            .product{
                margin-bottom: 20px;
            }
            .name{
                bottom: 100px;   
                margin-right: 200px;
            }
            .product_email a{
                position: absolute;
                font-size: 14px;
                margin-left: 15px;
            }
            .product_email p{
                position: absolute;
                top: -14px;
                right: 50px;
                font-size: 14px;
            }
            .price{
                bottom: 50px;
            }
            .quantity{
                bottom: 20px;
            }
            .rent_time{
                bottom: 50px;
                left:  300px;
            }
            .payment{
                display: flex;
                justify-content: center;
                margin-left: -80px;
                margin-top: 70px;
            }
            .money{
                margin-left: 100px;
            }
            .end_email{
                text-align: center;
                justify-content: center;
                margin-left: -80px;
            }
        </style>
    </head>
    <body>
        <div class="background_email">
            <h1 class="topic">Cảm ơn bạn đã đặt hàng tại Toys Kids Education!</h1>
            <div class="content_email">
                <a>Xin chào Quyền,</a><br><br>
                <a>Cảm ơn bạn đã đặt hàng, đơn hàng của bạn đã được gửi đi. Để tiện theo dõi tình trạng đơn hàng, bạn hãy ấn vào</a>
                <a href="http://localhost:8084/EduToyRent/"> theo dõi đơn hàng.</a>
                <div class="line"></div>
                <h3>Đơn hàng được giao đến</h3>
                <div class="address_order">
                    <a>Khách hàng: Trịnh Trọng Quyền</a><br><br>
                    <a>Địa chỉ: Số 10, Đường Phạm Văn Đồng, Quận Bắc Từ Liêm, Hà Nội</a><br><br>
                    <a>Điện thoại: 0372314523</a><br><br>
                    <a>Email: quyentrinh040@gmail.com</a>
                </div>
                <div class="line"></div>
                <div class="product_email">
                    <h3>Đơn hàng: #12</h3>
                    <p>Ngày đặt hàng: 10-11-2024 12:00:00</p>
                    <div class="product">
                        <img src="https://i.pinimg.com/564x/24/21/85/242185eaef43192fc3f9646932fe3b46.jpg"/>
                        <a class="name">ahahahahahahahahahahahahahahatttttT</a>
                        <a class="price">VND:12,000</a>
                        <a class="quantity">Số lượng: 1</a>
                        <a class="rent_time">Thời gian thuê: 1 tuần</a>
                    </div>
                </div>
                <div class="line"></div>
                <div class="payment">
                    <div class="content_pay">
                        <a>Thành tiền:</a><br><br>
                        <a>Phí vận chuyển:</a><br><br>
                        <a>Chiết khấu:</a><br><br>
                        <a>Điểm thưởng:</a><br><br>
                        <a>Tổng cộng:</a><br><br>
                        <a>Hình thức thanh toán:</a>
                    </div>
                    <div class="money">
                        <a>1,000,000</a><br><br>
                        <a>0</a><br><br>
                        <a>0</a><br><br>
                        <a>-20,000</a><br><br>
                        <a>1,000,000</a><br><br>
                        <a>Thanh toán bằng ngân hàng</a>
                    </div>
                </div>
                <div class="line"></div>
                <div class="end_email">
                    <h3>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</h3>
                    <a>Vui lòng không trả lời thư này.</a>
                </div>
            </div>
        </div>
        

    </body>
</html>
