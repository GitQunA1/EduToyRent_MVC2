/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CartDAO;
import DAO.OrderDAO;
import DAO.PaymentDAO;
import Entity.Cart;
import Entity.Customer;
import Entity.User;
import java.io.IOException;
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
@WebServlet(name = "Payment", urlPatterns = {"/Payment"})
public class Payment extends HttpServlet {

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
            request.setCharacterEncoding("utf-8");
            HttpSession ss = request.getSession();
            User user = (User) ss.getAttribute("UserAccount");
            HttpSession customer = request.getSession();
            Customer cus = (Customer) customer.getAttribute("Customer");

            if ((cus == null || cus.getAddress() == null || cus.getAddress().isEmpty()) || (user == null || user.getPhone() == null || user.getPhone().isEmpty())) {
                request.setAttribute("addInfor", "Vui lòng điền đầy đủ thông tin trước khi thanh toán");
                request.getRequestDispatcher("LetToPayment").forward(request, response);
            } else {
                
                String txtpoint = request.getParameter("txtUsedPoints");
                String txtBank = request.getParameter("txtBank");
                String txtPayment = request.getParameter("txtPayment");
                String ErrorPayment = "Thanh toán không thành công";
                String bank = null;
                if (txtBank.equals("1")) {
                    bank = "Thanh toán bằng ngân hàng";
                } else if (txtBank.equals("2")) {
                    bank = "Thẻ tín dụng / thẻ ghi nợ";
                }
                float total = Float.parseFloat(txtPayment);

                CartDAO cd = new CartDAO();
                List<Cart> cart = cd.getCart(user);

                OrderDAO od = new OrderDAO();
                PaymentDAO pd = new PaymentDAO();

                int oid = od.insertOrder(user.getUid(), total);
                boolean check1 = od.insertOrderDetail(oid, cart);
                if (check1) {
                    float point = Float.parseFloat(txtpoint);
                    int paid = pd.insertPayment(oid, total, point, bank);
                    boolean check2 = pd.insertPDetail(paid, oid, cart);
                    if (check2) {
                        request.setAttribute("SuccessPayment", "Cảm ơn bạn đã thanh toán!");
                        request.getRequestDispatcher("SendEmailPayment").forward(request, response);
                    } else {
                        request.setAttribute("ErrorPayment", ErrorPayment);
                        request.getRequestDispatcher("LetToCart").forward(request, response);
                    }
                } else {
                    request.setAttribute("ErrorPayment", ErrorPayment);
                    request.getRequestDispatcher("LetToCart").forward(request, response);
                }

                
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
