package Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import DAO.CartDAO;
import DAO.GetProductDAO;
import DAO.OrderDAO;
import DAO.PaymentDAO;
import Entity.Payment;
import Entity.Customer;
import Entity.Order;
import Entity.OrderDetail;
import Entity.PaymentDetail;
import Entity.Product;
import Entity.User;
import Util.resetService;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Quyền
 */
@WebServlet(urlPatterns = {"/SendEmailPayment"})
public class SendEmailPayment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            HttpSession ss = request.getSession();
            User user = (User) ss.getAttribute("UserAccount");
            HttpSession customer = request.getSession();
            Customer cus = (Customer) customer.getAttribute("Customer");

            OrderDAO od = new OrderDAO();
            Order order = od.getNewOrder(user.getUid());


            
        //request.getRequestDispatcher("LetToCart").forward(request, response);

            List<OrderDetail> oddt = od.getOrderDetails(order.getOid());

            PaymentDAO pd = new PaymentDAO();
            List<PaymentDetail> pddt = new ArrayList<>();
            for (OrderDetail orderDetail : oddt) {
                pddt.add(pd.getPDetail(orderDetail.getOdid()));
            }

            Payment pay = pd.getPaymentByOID(order.getOid());
            
            
            GetProductDAO gpd = new GetProductDAO();
            List<Product> pro = new ArrayList<>();
            for (OrderDetail orderDetail : oddt) {
                pro.add(gpd.getProductById(orderDetail.getPid()));
            }

            
            resetService service = new resetService();
            StringBuilder emailContent = new StringBuilder("<html>"
                    + "<head><title>Toys Kids Education</title>"
                    + "<style>"
                    + "body{background-color: #555; width: 100%; height: 100%; font-family: arial; margin: 0; padding: 0;} "
                    + ".background_email{background-color: white; width: 70%; max-width: 1000px; padding: 20px; margin: 0 auto; position: relative;} "
                    + ".topic{color: #FF74B8; text-align: center; margin-bottom: 30px;} "
                    + ".content_email{margin-left: 0; padding: 10px; font-size: 14px;} "
                    + ".line{background-color: #555; width: 100%; height: 2px; margin-top: 20px; margin-bottom: 10px;} "
                    + ".address_order{margin-left: 30px; font-size: 14px;} "
                    + ".address_order a{line-height: 1.5;} "
                    + ".product_email{position: relative; margin-top: 20px;}"
                    + ".product_email img{width: 120px; height: 130px; border: 1px solid #333; margin-right: 10px;} "
                    + ".name{font-size: 16px; font-weight: bold; max-height: 3.2em; line-height: 1.4em; overflow: hidden; display: block; margin-bottom: 10px;} "
                    + ".product_email a{font-size: 14px; display: block;} "
                    + ".product_email p{font-size: 14px; color: #888;} "
                    + ".price, .quantity, .rent_time{font-size: 14px; margin-left: 20px;} "
                    + ".product{display: flex; justify-content: center; margin-bottom: 14px;}"
                    + ".body_product{margin-bottom: 10px;}"
                    + ".payment{display: flex; justify-content: space-between; margin-top: 40px;} "
                    + ".money a{font-size: 13px; margin-left: 20px;} "
                    + ".end_email{text-align: center; margin-top: 30px;} "
                    + ".end_email h3{margin-bottom: 10px;} "
                    + "@media (max-width: 768px) {"
                    + "  .background_email{width: 90%;}"
                    + "  .topic{font-size: 18px; margin-bottom: 20px;} "
                    + "  .address_order a, .product_email a{font-size: 13px;} "
                    + "  .product_email img{width: 100px; height: 110px;} "
                    + "  .payment{flex-direction: column; align-items: flex-start;}"
                    + "  .money{margin-left: 0;} "
                    + "} "
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='background_email'>"
                    + "<h1 class='topic'>Cảm ơn bạn đã đặt hàng tại Toys Kids Education!</h1>"
                    + "<div class='content_email'>"
                    + "<a>Xin chào Quyền,</a><br><br>"
                    + "<a>Cảm ơn bạn đã đặt hàng, đơn hàng của bạn đã được gửi đi. Để tiện theo dõi tình trạng đơn hàng, bạn hãy ấn vào</a>"
                    + "<a href='http://localhost:8084/EduToyRent/'> theo dõi đơn hàng.</a>"
                    + "</div>"
                    + "<div class='line'></div>"
                    + "<h3>Đơn hàng được giao đến</h3>"
                    + "<div class='address_order'>"
                    + "<a>Khách hàng: " + cus.getName() + "</a><br><br>"
                    + "<a>Địa chỉ: " + cus.getAddress() + "</a><br><br>"
                    + "<a>Điện thoại: " + user.getPhone() + "</a><br><br>"            
                    + "<a>Email:" + user.getEmail() + "</a>"
                    + "</div>"
                    + "<div class='line'></div>"
                    + "<div class='product_email'>"
                    + "<h3>Đơn hàng: #" + order.getOid() + "</h3>");
                 //   + "<p>Ngày đặt hàng: " + formattedDate + "</p>"
                    for (OrderDetail oderDetail : oddt) {
                        for (Product product : pro) {
                            if (oderDetail.getPid() == product.getPid()) {
                                Product p = product;
                                for (PaymentDetail paymentDetail : pddt) {
                                    if (oderDetail.getOdid() == paymentDetail.getOdid()) {
                                        PaymentDetail paymentD = paymentDetail;
                                        float price = paymentD.getPrice();
                                        DecimalFormat decimalFormat = new DecimalFormat("#,###");
                                        String formattedPrice = decimalFormat.format(price) + " đ";
                                        
                                        if(oderDetail.getRentTime() > 0){
                                            String rent = "";
                                            if(oderDetail.getRentTime() == 7){
                                                rent = "1 tuần";
                                            }else if(oderDetail.getRentTime() == 14){
                                                rent = "2 tuần";
                                            }else if(oderDetail.getRentTime() == 30){
                                                rent = "1 tháng";
                                            }
                                            
                                             emailContent.append(
                                                "<div class='product'>"
                                                + "<img src='" + p.getImage() + "'/>"
                                                + "<div class='body_product'>"
                                                + "<a class='name'>" + p.getName() + "</a>"
                                                + "<a class='price'>VND: " + formattedPrice + "</a>"
                                                + "<a class='quantity'>Số lượng: " + oderDetail.getQuantity() + "</a>"
                                                + "<a class='rent_time'>Thời gian thuê: " + rent + "</a>"
                                                + "</div>"
                                                + "</div>");
                                        }else{
                                             emailContent.append(
                                                "<div class='product'>"
                                                + "<img src='" + p.getImage() + "'/>"
                                                + "<div class='body_product'>"
                                                + "<a class='name'>" + p.getName() + "</a>"
                                                + "<a class='price'>VND: " + formattedPrice + "</a>"
                                                + "<a class='quantity'>Số lượng: " + oderDetail.getQuantity() + "</a>"
                                                + "</div>"
                                                + "</div>");
                                        }
                                       
                                    }
                                }
                            }
                        }
                    }

            float priceotal = pay.getAmount();
            float point = pay.getPoints();
            float toatal = priceotal - point;
            DecimalFormat decimalFormat = new DecimalFormat("#,###");
            String formattPricetotal = decimalFormat.format(priceotal) + " đ";
            String formattpoint = decimalFormat.format(point) + " đ";   
            String formatTotal =  decimalFormat.format(toatal) + " đ";       
            
            emailContent.append("</div>"
                    + "<div class='line'></div>"
                    + "<div class='payment'>"
                    + "<div class='content_pay'>"
                    + "<a>Thành tiền:</a><br><br>"
                    + "<a>Phí vận chuyển:</a><br><br>"
                    + "<a>Chiết khấu:</a><br><br>"
                    + "<a>Điểm thưởng:</a><br><br>"
                    + "<a>Tổng cộng:</a><br><br>"
                    + "<a>Hình thức thanh toán:</a>"
                    + "</div>"
                    + "<div class='money'>"
                    + "<a>"+formattPricetotal+"</a><br><br>"
                    + "<a>0</a><br><br>"
                    + "<a>0</a><br><br>"
                    + "<a>- "+formattpoint+"</a><br><br>"
                    + "<a>"+formatTotal+"</a><br><br>"
                    + "<a>"+ pay.getMethod()+"</a>"
                    + "</div>"
                    + "</div>"
                    + "<div class='line'></div>"
                    + "<div class='end_email'>"
                    + "<h3>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</h3>"
                    + "<a>Vui lòng không trả lời thư này.</a>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>");
            String emailSubject = "Thanh toán thành công cho đơn hàng #" + order.getOid();
            CartDAO cd = new CartDAO();
            boolean checkEmail = service.sendEmail(user.getEmail(), emailSubject, emailContent.toString());
            if (checkEmail) {
                boolean check3 = cd.deleteAllCart(user.getUid());
                request.getRequestDispatcher("LetToCart").forward(request, response);
            }
        } catch (Exception e) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
