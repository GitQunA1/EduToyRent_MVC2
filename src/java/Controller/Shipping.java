/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GetProductDAO;
import DAO.GetShopOwner;
import DAO.OrderDAO;
import DAO.ProfileDAO;
import Entity.Customer;
import Entity.Order;
import Entity.OrderDetail;
import Entity.Product;
import Entity.Shipper;
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
@WebServlet(name = "Shipping", urlPatterns = {"/Shipping"})
public class Shipping extends HttpServlet {

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
//            HttpSession shipperSS = request.getSession();
//            Shipper sh = (Shipper)shipperSS.getAttribute("Shipper");
            ProfileDAO prd = new ProfileDAO();
            List<Customer> cusList = prd.getCustomer();
            OrderDAO od = new OrderDAO();
            List<OrderDetail> allODList = new ArrayList<>();
            List<Order> allOrderList = new ArrayList<>();
            for (Customer cus : cusList) {
                List<OrderDetail> orderDetailList = od.GetOrderByStatus(cus.getUid(), 2);
                if(!orderDetailList.isEmpty()){
                    for (OrderDetail o : orderDetailList) {
                        allODList.add(o);
                    }
                }
                List<Order> orderList = od.getOrder(cus.getUid());
                if(!orderList.isEmpty()){
                    allOrderList.addAll(orderList);
                    for (Order o : orderList) {
                        allOrderList.add(o);
                    }
                }
            }
            GetShopOwner gso = new GetShopOwner();
            List<ShopOwner> shopList = gso.getShopList();
            
            GetProductDAO gpd = new GetProductDAO();
            List<Product> ProductOrdered = new ArrayList<>();
            for (Product p : gpd.getSuccessList()) {
                for (OrderDetail d : allODList) {
                    if (p.getPid() == d.getPid()) {
                        ProductOrdered.add(p);
                        break;
                    }
                }
            }
            request.setAttribute("cusList", cusList);
            request.setAttribute("allODList", allODList);
            request.setAttribute("allOrderList", allOrderList);
            request.setAttribute("shopList", shopList);
            request.setAttribute("ProuductOrdered", ProductOrdered);
            request.getRequestDispatcher("ShipperPage.jsp").forward(request, response);
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
