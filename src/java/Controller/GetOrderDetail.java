/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GetProductDAO;
import DAO.GetShopOwner;
import DAO.OrderDAO;
import DAO.PaymentDAO;
import Entity.OrderDetail;
import Entity.PaymentDetail;
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
            HttpSession ss = request.getSession();
            User user = (User) ss.getAttribute("UserAccount");
            if (user == null) {
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
            }
            
            String txtcontent = request.getParameter("txtcontent");
            int status = 0;

            if (txtcontent != null && !txtcontent.isEmpty()) {
                try {
                    status = Integer.parseInt(txtcontent);
                } catch (NumberFormatException e) {
                    status = 0;
                }
            }

            List<OrderDetail> orderDetail = new ArrayList<>();
            OrderDAO od = new OrderDAO();
            PaymentDAO pd = new PaymentDAO();
            
            String odidToCancel = request.getParameter("odid");
            if(odidToCancel != null){
                int odid = Integer.parseInt(odidToCancel);
                od.updateOrderDetail(odid, 8);
            }
            if (status == 4) {
                for (int i = 4; i <= 6; i++) {
                    List<OrderDetail> tempOrderDetails = od.GetOrderByStatus(user.getUid(), i);
                    orderDetail.addAll(tempOrderDetails);
                }
            } else if (status == 10) {

                for (int i = 9; i <= 10; i++) {
                    List<OrderDetail> tempOrderDetails = od.GetOrderByStatus(user.getUid(), i);
                    orderDetail.addAll(tempOrderDetails);
                }
            } else if(status == 7){
                for (int i = 7; i<= 8; i++) {
                    List<OrderDetail> tempOrderDetails = od.GetOrderByStatus(user.getUid(), i);
                    orderDetail.addAll(tempOrderDetails);
                }
            } else {

                orderDetail = od.GetOrderByStatus(user.getUid(), status);
            }


            
            List<PaymentDetail> pdetail = new ArrayList<>();
            for (OrderDetail odd : orderDetail) {
                pdetail.add(pd.getPDetail(odd.getOdid()));
            }
            
            List<Integer> shopIds = new ArrayList<>();
            for (OrderDetail Detail : orderDetail) {
                shopIds.add(Detail.getSoid());
            }
            GetShopOwner shopOwnerDAO = new GetShopOwner();
            List<ShopOwner> shopOwners = shopOwnerDAO.getShopsByIds(shopIds);
            
            
            List<Integer> productIds = new ArrayList<>();
            for (OrderDetail Detail : orderDetail) {
                productIds.add(Detail.getPid());
            }            
            GetProductDAO productDAO = new GetProductDAO();
            List<Product> product = productDAO.getProductsByIds(productIds);            
            
            request.setAttribute("product", product);
            request.setAttribute("pdetail", pdetail);
            request.setAttribute("shop", shopOwners);
            request.setAttribute("orderDetail", orderDetail);
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
