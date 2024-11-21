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
import Entity.DamageReport;
import Entity.FeePolicy;
import Entity.Income;
import Entity.OrderDetail;
import Entity.Product;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ViewReport", urlPatterns = {"/ViewReport"})
public class ViewReport extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String txtODID = request.getParameter("txtODID");
            int ODID = Integer.parseInt(txtODID);
            if (txtODID.isEmpty()) {
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
            }
            ReportDamageDAO rdd = new ReportDamageDAO();

            DamageReport dr = rdd.getDMGReport(ODID);
            OrderDAO od = new OrderDAO();
            OrderDetail odetail = od.GetPIDByODID(ODID);
            GetProductDAO gpd = new GetProductDAO();

            float compensation = 0;
            float rentFee = 0;
            float deposit = 0;
            int damaged = 0;

            GetFeePolicy gfp = new GetFeePolicy();
            FeePolicy fp = gfp.getFeePolicy();

            if (odetail != null) {

                Product p = gpd.getProductById(odetail.getPid());
                rentFee = p.getPrice() / 100 * fp.getWeek();
                deposit = p.getPrice() - rentFee;

                if (odetail.getRentTime() == 14) {
                    rentFee = p.getPrice() / 100 * fp.getBiWeek();
                    deposit = p.getPrice() - rentFee;

                } else if (odetail.getRentTime() == 30) {
                    rentFee = p.getPrice() / 100 * fp.getMonth();
                    deposit = p.getPrice() - rentFee;
                }
                if (dr == null) {
                    request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
                }
                if (dr.getHalfDamage() > 0) {
                    damaged = 30;
                    compensation = deposit / 100 * 30;
                } else if (dr.getFullDamege() > 0) {

                    damaged = 100;
                    compensation = deposit;
                }

            }

            PaymentDAO pmd = new PaymentDAO();
            float platformFee = rentFee * fp.getPlatform() / 100;
            pmd.UpdatePDetail(ODID, rentFee - platformFee + compensation, deposit - compensation, platformFee);

            IncomeDAO incomeDAO = new IncomeDAO();
            LocalDate localDate = LocalDate.now();
            Date date = Date.valueOf(localDate);
            if (incomeDAO.checkExist(odetail.getSoid(), odetail.getPid(), date) == null) {
                incomeDAO.insertIncome(odetail.getSoid(), odetail.getPid(), 0, 0, rentFee - platformFee + compensation, odetail.getQuantity(), date);
            } else {
                Income i = incomeDAO.checkExist(odetail.getSoid(), odetail.getPid(), date);
                incomeDAO.updateIncome(odetail.getSoid(), odetail.getPid(), 0, 0, i.getIncRent() + rentFee - platformFee + compensation, i.getqRent() + odetail.getQuantity(), date);
            }

            request.setAttribute("ODID", ODID);
            request.setAttribute("damaged", damaged);
            request.setAttribute("compensation", compensation);
            request.setAttribute("deposit", deposit);
            request.setAttribute("rentFee", rentFee);
            request.setAttribute("dr", dr);
            request.setAttribute("txtcontent", "6");
            request.getRequestDispatcher("GetOrderDetail").forward(request, response);
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
