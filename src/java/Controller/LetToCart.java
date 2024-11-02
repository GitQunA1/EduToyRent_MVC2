/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CartDAO;
import DAO.GetProductDAO;
import DAO.GetShopOwner;
import Entity.Cart;
import Entity.Product;
import Entity.ShopOwner;
import Entity.User;
import java.io.IOException;
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
@WebServlet(name = "LetToCart", urlPatterns = {"/LetToCart"})
public class LetToCart extends HttpServlet {

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
            if (user == null) {
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
            }

            CartDAO cd = new CartDAO();
            List<Cart> cartItems = cd.getCart(user);

            List<Integer> productIds = new ArrayList<>();
            for (Cart item : cartItems) {
                productIds.add(item.getPid());
            }
            GetProductDAO productDAO = new GetProductDAO();
            List<Product> products = productDAO.getProductsByIds(productIds);

            List<Integer> shopIds = new ArrayList<>();
            for (Product product : products) {
                shopIds.add(product.getSoid());
            }

            GetShopOwner shopOwnerDAO = new GetShopOwner();
            List<ShopOwner> shopOwners = shopOwnerDAO.getShopsByIds(shopIds);
            
            request.setAttribute("cart", cartItems);
            request.setAttribute("products", products);
            request.setAttribute("shopOwners", shopOwners);
            request.getRequestDispatcher("CartPage.jsp").forward(request, response);
            
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
