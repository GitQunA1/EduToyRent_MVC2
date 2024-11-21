/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Util.resetService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quyền
 */
@WebServlet(name = "testEmail", urlPatterns = {"/testEmail"})
public class testEmail extends HttpServlet {

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

            resetService service = new resetService();
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
                    .append("<div class='email_header'>")
                    .append("<p>Xin chào Quyền,</p>")
                    .append("<p>Bạn có 1 đơn hàng thuê sắp tới hạn trả hàng, vui lòng chuẩn bị đơn hàng trước khi nhân viên giao hàng của chúng tôi tới nhận lại hàng.</p>")
                    .append("<p>Để xem chi tiết đơn hàng vui lòng nhấp <a href='http://localhost:8084/EduToyRent/'>tại đây</a>.</p>")
                    .append("</div>")
                    .append("<div class='line'></div>")
                    .append("<div class='email_body'>")
                    .append("<h3>Thông tin sản phẩm</h3>")
                    .append("<div class='product'>")
                    .append("<img src='https://i.pinimg.com/564x/24/21/85/242185eaef43192fc3f9646932fe3b46.jpg'/>")
                    .append("<div class='details'>")
                    .append("<a class='name'>Tên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩmTên sản phẩm</a><br>")
                    .append("<a class='quantity'>Số lượng: 1</a>")
                    .append("<a class='rent_time'>Thời gian thuê: 1 tuần</a>")
                    .append("<a class='start'>Bắt đầu: 11-11-2024</a>")
                    .append("<a class='end'>Kết thúc: 20-11-2024</a>")
                    .append("</div>")
                    .append("</div>")
                    .append("</div>")
                    .append("<div class='line'></div>")
                    .append("<div class='end_email'>")
                    .append("<h3>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</h3>")
                    .append("<p>Mọi thắc mắc vui lòng liên hệ qua hotline: 0999999999</p>")
                    .append("<p>Vui lòng không trả lời thư này.</p>")
                    .append("</div>")
                    .append("</div>")
                    .append("</body>")
                    .append("</html>");

            boolean checkEmail = service.sendEmail("quyentrinh040@gmail.com", "Thông báo tới hạn trả hàng", emailContent.toString());

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
