/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CartDAO;
import Entity.Cart;
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
 * @author HagiLee
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

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
            if (user != null) {
                String pid = request.getParameter("txtPID");
                String price = request.getParameter("txtPrice");
                String quantity = request.getParameter("txtQuantity");
                String rentTime = request.getParameter("selectedDuration");
                CartDAO cdao = new CartDAO();

                List<Cart> cartList = cdao.getCart(user);
                boolean check = false;
                for (Cart cart : cartList) {
                    if (cart.getPid() == Integer.parseInt(pid) && cart.getRentTime() == Integer.parseInt(rentTime)) {
                        int newquantity = Integer.parseInt(quantity)+cart.getQuantity();
                        cdao.UpdateCart(user.getUid(), String.valueOf(cart.getCaid()), String.valueOf(newquantity) , price, rentTime);
                        check = true;
                    }
                }
                if (check == false) {
                    check = cdao.addToCart(user, pid, quantity, price, rentTime);
                }
                if (check == true) {
                    request.setAttribute("success", "Thêm giỏ hàng thành công");
                } else {
                    request.setAttribute("success", "Thêm giỏ hàng không thành công");
                }
                request.setAttribute("txtPID", pid);
                request.getRequestDispatcher("GetProductDetail").forward(request, response);

            } else {
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
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
