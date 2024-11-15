/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.OrderDAO;
import DAO.ReportDamageDAO;
import Entity.ShopOwner;
import java.io.IOException;
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
@WebServlet(name = "UpdateOrderDetail", urlPatterns = {"/UpdateOrderDetail"})
public class UpdateOrderDetail extends HttpServlet {

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
            OrderDAO od = new OrderDAO();
            String txtStatus = request.getParameter("txtStatusUpdate");
            String txtOdid = request.getParameter("txtODID");
            int status = Integer.parseInt(txtStatus);
            int odid = Integer.parseInt(txtOdid);
            if(od.updateOrderDetail(odid, status)){
                if(status == 3 || status == 9 || status == 4 || status == 5){
                    if(status == 3){
                        String txtRentTime = request.getParameter("txtRentTime");
                        int rentTime = Integer.parseInt(txtRentTime);
                        if(od.setRentTime(odid, rentTime)){
                            request.getRequestDispatcher("Shipping").forward(request, response);
                        }                        
                    }
                    request.getRequestDispatcher("Shipping").forward(request, response);
                }
                if(status == 6){
                    String damaged = request.getParameter("damageStatus");
                    ReportDamageDAO rdd = new ReportDamageDAO();
                    HttpSession session = request.getSession();
                    ShopOwner shop = (ShopOwner) session.getAttribute("ShopOwner");
                    if(rdd.insertOrderDetail(odid, damaged, shop.getName()));
                }
                request.getRequestDispatcher("OwnerOrderDetail").forward(request, response);
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
