/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GetProductDAO;
import DAO.OrderDAO;
import DAO.ProfileDAO;
import DAO.UserDAO;
import Entity.Customer;
import Entity.Order;
import Entity.OrderDetail;
import Entity.Product;
import Entity.User;
import Util.resetService;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quyền
 */
@WebServlet(name = "SendEmailProductRent", urlPatterns = {"/SendEmailProductRent"})
public class SendEmailProductRent extends HttpServlet {

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
            LocalDate dateOld = LocalDate.of(2024, 11, 1);
            LocalDate dateNew = LocalDate.now();

            if (dateNew.isBefore(dateOld)) {

                OrderDAO od = new OrderDAO();
                List<OrderDetail> orderDT = od.getProductRentOD();

                List<Integer> oidList = new ArrayList<>();
                orderDT.forEach((orderDetail) -> {
                    oidList.add(orderDetail.getOid());
                });
                List<Order> listOrder = od.getOrdersByOIDs(oidList);

                List<Integer> PdList = new ArrayList<>();
                orderDT.forEach((orderDetail) -> {
                    PdList.add(orderDetail.getPid());
                });
                GetProductDAO gpd = new GetProductDAO();
                List<Product> product = gpd.getProductsByIds(PdList);

                List<Integer> uidList = new ArrayList<>();
                listOrder.forEach((order) -> {
                    uidList.add(order.getUid());
                });
                UserDAO ud = new UserDAO();
                List<User> user = ud.getUsersByUIDs(uidList);

                ProfileDAO pd = new ProfileDAO();
                Customer cus = new Customer();
                List<Customer> customer = new ArrayList<>();
                for (User user1 : user) {
                    cus = pd.ShowCustomer(user1.getUid());
                    customer.add(cus);
                }
//            
//            if(customer != null){
//                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
//            }

                for (User user1 : user) {

                    List<Order> order1 = new ArrayList<>();
                    listOrder.stream().filter((order) -> (user1.getUid() == order.getUid())).forEachOrdered((order) -> {
                        order1.add(order);
                    });

                    StringBuilder emailContent = new StringBuilder();
                    emailContent.append("<html>")
                            .append("<head>")
                            .append("<title>Thông báo tới hạn trả hàng</title>")
                            .append("<style>")
                            .append("body { background-color: #555; font-family: Arial, sans-serif; margin: 0; padding: 0; }")
                            .append(".email { background-color: white; width: 80%; max-width: 800px; padding: 20px; margin: 50px auto; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }")
                            .append(".email h2 { text-align: center; margin-bottom: 20px; font-size: 1.5em; }")
                            .append(".email_header { margin: 20px; line-height: 1.6; }")
                            .append(".email_header a { color: #007BFF; text-decoration: none; }")
                            .append(".line{background-color: #555; width: 100%; height: 2px; margin-top: 20px; margin-bottom: 10px;}")
                            .append(".email_body { margin: 20px; }")
                            .append(".email_body h3 { margin-bottom: 15px; font-size: 1.2em; }")
                            .append(".product { display: flex; align-items: center; gap: 15px; margin-bottom: 20px; }")
                            .append(".product img { width: 100px; height: 120px; border: 1px solid #ccc; border-radius: 5px; }")
                            .append(".product .details { flex-grow: 1; }")
                            .append(".product .details a { display: block; color: #333; text-decoration: none; font-size: 0.9em; }")
                            .append(".name{font-weight: bold; max-height: 2.8em; line-height: 1.4em; overflow: hidden; display: block; bottom: 10px; margin-right: 50px; margin-left: 15px; position: absolute;}")
                            .append(".quantity{ position: absolute;  margin-left: 50px;}")
                            .append(".rent_time{ position: absolute;  margin-left: 50px;}")
                            .append(".start{position: absolute; margin-left: 50px;}")
                            .append(".end{ position: absolute;  margin-left: 50px;}")
                            .append(".end_email { text-align: center; margin-top: 20px; font-size: 0.9em; line-height: 1.6; }")
                            .append("@media (max-width: 768px) {")
                            .append(".email { width: 90%; padding: 10px; }")
                            .append(".product { flex-direction: column; align-items: flex-start; }")
                            .append(".product img { width: 80px; height: 105px; }")
                            .append(".product .details { flex-grow: 1; }")
                            .append(".product .details a { display: block; color: #333; text-decoration: none; font-size: 0.9em; }")
                            .append(".name{font-weight: bold; max-height: 2.8em; line-height: 1.4em; overflow: hidden; display: block; bottom: 10px; margin-right: 5px; margin-left: 3px; position: absolute;}")
                            .append(".quantity{ position: absolute;  margin-left: 5px;}")
                            .append(".rent_time{ position: absolute;  margin-left: 5px;}")
                            .append(".start{position: absolute; margin-left: 5px;}")
                            .append(".end{ position: absolute;  margin-left: 5px;}")
                            .append(".line { width: 100%; }")
                            .append("}")
                            .append("</style>")
                            .append("</head>")
                            .append("<body>")
                            .append("<div class='email'>")
                            .append("<h2>Thông báo tới hạn trả hàng</h2>")
                            .append("<div class='email_header'>");

                    for (Customer customer1 : customer) {
                        if (user1.getUid() == customer1.getUid()) {
                            emailContent.append("<p>Xin chào " + customer1.getName() + ",</p>");
                        }
                    }

                    emailContent.append("<p>Bạn có đơn hàng thuê sắp tới hạn trả hàng, vui lòng chuẩn bị đơn hàng trước khi nhân viên giao hàng của chúng tôi tới nhận lại hàng.</p>")
                            .append("<p>Để xem chi tiết đơn hàng vui lòng nhấp <a href='http://localhost:8084/EduToyRent/'>tại đây</a>.</p>")
                            .append("</div>")
                            .append("<div class='line'></div>")
                            .append("<div class='email_body'>")
                            .append("<h3>Thông tin sản phẩm</h3>");

                    for (Order order : order1) {
                        List<OrderDetail> ODetail = new ArrayList<>();
                        for (OrderDetail orderdetail : orderDT) {
                            if (order.getOid() == orderdetail.getOid()) {
                                ODetail.add(orderdetail);
                            }
                        }

                        for (OrderDetail oDetail : ODetail) {
                            for (Product product1 : product) {
                                if (oDetail.getPid() == product1.getPid()) {
                                    emailContent.append("<div class='product'>")
                                            .append("<img src='").append(product1.getImage())
                                            .append("'/>")
                                            .append("<div class='details'>")
                                            .append("<a class='name'>")
                                            .append(product1.getName())
                                            .append("</a><br>")
                                            .append("<a class='quantity'>Số lượng: ")
                                            .append(oDetail.getQuantity())
                                            .append("</a>");
                                    if (oDetail.getRentTime() == 7) {
                                        emailContent.append("<a class='rent_time'>Thời gian thuê: 1 tuần</a>");
                                    } else if (oDetail.getRentTime() == 14) {
                                        emailContent.append("<a class='rent_time'>Thời gian thuê: 2 tuần</a>");
                                    } else if (oDetail.getRentTime() == 30) {
                                        emailContent.append("<a class='rent_time'>Thời gian thuê: 1 tháng</a>");
                                    }

                                    String dateStartStr = oDetail.getDateStart();
                                    String dateEndStr = oDetail.getDateEnd();

                                    SimpleDateFormat dbFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    SimpleDateFormat displayFormat = new SimpleDateFormat("dd-MM-yyyy");

                                    try {
                                        Date dateStart = dbFormat.parse(dateStartStr);
                                        Date dateEnd = dbFormat.parse(dateEndStr);

                                        String formatDateStart = displayFormat.format(dateStart);
                                        String formatDateEnd = displayFormat.format(dateEnd);

                                        emailContent.append("<a class='start'>Bắt đầu: ").append(formatDateStart).append("</a>")
                                                .append("<a class='end'>Kết thúc: ").append(formatDateEnd).append("</a>")
                                                .append("</div>")
                                                .append("</div>");

                                    } catch (ParseException e) {
                                        e.printStackTrace();
                                    }

                                }
                            }
                        }

                        emailContent.append("</div>");
                        ODetail.clear();
                    }

                    emailContent.append("<div class='line'></div>")
                            .append("<div class='end_email'>")
                            .append("<h3>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</h3>")
                            .append("<p>Mọi thắc mắc vui lòng liên hệ qua hotline: 0999999999</p>")
                            .append("<p>Vui lòng không trả lời thư này.</p>")
                            .append("</div>")
                            .append("</div>")
                            .append("</body>")
                            .append("</html>");
                    resetService service = new resetService();
                    boolean checkEmail = service.sendEmail(user1.getEmail(), "Thông báo tới hạn trả hàng", emailContent.toString());
                    order1.clear();
                }
                dateOld = LocalDate.now();
            }
            request.getRequestDispatcher("MainPage.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
