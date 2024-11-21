/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GetFeePolicy;
import DAO.GetProductDAO;
import DAO.IncomeDAO;
import DAO.OrderDAO;
import DAO.PaymentDAO;
import DAO.ReportDamageDAO;
import Entity.FeePolicy;
import Entity.Income;
import Entity.OrderDetail;
import Entity.Product;
import Entity.ShopOwner;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
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
                    int option = 0;
                    try {
                        String txtOption = request.getParameter("txtOption");
                        option = Integer.parseInt(txtOption);
                    } catch (Exception e) {
                        option = 0;
                    }
                    if (option > 0) {
                        if (status == 9) {
                            request.getRequestDispatcher("GetOrderDetail").forward(request, response);
                        }

                    }
                    if (status == 9) {
                        PaymentDAO pmd = new PaymentDAO();
                        OrderDetail odetail = od.GetPIDByODID(odid);
                        GetProductDAO gpd = new GetProductDAO();
                        Product p = gpd.getProductById(odetail.getPid());
                        GetFeePolicy gfp = new GetFeePolicy();
                        FeePolicy fp = gfp.getFeePolicy();
                        pmd.UpdatePDetail(odid, p.getPrice() * (100 - fp.getPlatform()) / 100, 0, p.getPrice() * fp.getPlatform() / 100);

                        IncomeDAO incomeDAO = new IncomeDAO();
                        LocalDate localDate = LocalDate.now();
                        Date date = Date.valueOf(localDate);
                        if (odetail.getRentTime() == 0) {
                            if (incomeDAO.checkExist(odetail.getSoid(), odetail.getPid(), date) == null) {
                                incomeDAO.insertIncome(odetail.getSoid(), odetail.getPid(), p.getPrice() * (100 - fp.getPlatform()) / 100, odetail.getQuantity(), 0, 0, date);
                            } else {
                                Income i = incomeDAO.checkExist(odetail.getSoid(), odetail.getPid(), date);
                                incomeDAO.updateIncome(odetail.getSoid(), odetail.getPid(), i.getIncSell() + p.getPrice() * (100 - fp.getPlatform()) / 100, i.getqSell() + odetail.getQuantity(), 0, 0, date);
                            }
                        }
                    }
                    request.getRequestDispatcher("Shipping").forward(request, response);
                }
                if (status == 6) {
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
