/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GetShopOwner;
import DAO.OrderDAO;
import Entity.OrderDetail;
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
 * @author HagiLee
 */
@WebServlet(name = "GetOrderDetail", urlPatterns = {"/GetOrderDetail"})
public class GetOrderDetail extends HttpServlet {

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
            String txtcontent = request.getParameter("txtcontent");
            int status = 0;

            if (txtcontent != null && !txtcontent.isEmpty()) {
                try {
                    status = Integer.parseInt(txtcontent);
                } catch (NumberFormatException e) {
                    status = 0; 
                }
            }

            OrderDAO od = new OrderDAO();
            HttpSession ss = request.getSession();
            User user = (User) ss.getAttribute("UserAccount");
            
            List<OrderDetail> orderList = od.GetOrderByStatus(user.getUid(),status);
            
            
            List<Integer> shopIds = new ArrayList<>();
            for (OrderDetail orderDetail : orderList) {
                shopIds.add(orderDetail.getSoid());
            }

            GetShopOwner shopOwnerDAO = new GetShopOwner();
            List<ShopOwner> shopOwners = shopOwnerDAO.getShopsByIds(shopIds);
            
            
            request.setAttribute("shop", shopOwners);
            request.setAttribute("orderList", orderList);
            request.getRequestDispatcher("MainOrderPage.jsp").forward(request, response);
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
