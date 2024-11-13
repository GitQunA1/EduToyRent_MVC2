/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.GetProductDAO;
import Entity.Product;
import Entity.ShopOwner;
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
 * @author LENOVO
 */
@WebServlet(name = "ProductsByShop", urlPatterns = {"/ProductsByShop"})
public class ProductsByShop extends HttpServlet {

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
            HttpSession session = request.getSession();
            ShopOwner shop = (ShopOwner) session.getAttribute("ShopOwner");
            if (shop == null) {

                throw new IllegalStateException("ShopOwner attribute is missing in the request.");
            }

            GetProductDAO getProductDAO = new GetProductDAO();

            List<Product> successList = new ArrayList<>();
            List<Product> s1 = getProductDAO.getSuccessList();
            for (Product s : s1) {
                if (s.getSoid() == shop.getSoid()) {
                    successList.add(s);
                }
            }
            List<Product> failedList = new ArrayList<>();
            List<Product> s2 = getProductDAO.getFailureList();
            for (Product s : s2) {
                if (s.getSoid() == shop.getSoid()) {
                    failedList.add(s);
                }
            }
            List<Product> pendingList = new ArrayList<>();
            List<Product> s3 = getProductDAO.getPendingList();
            for (Product s : s3) {
                if (s.getSoid() == shop.getSoid()) {
                    pendingList.add(s);
                }
            }
            List<Product> freezeList = new ArrayList<>();
            List<Product> s4 = getProductDAO.getFreezeList();
            for (Product s : s4) {
                if (s.getSoid() == shop.getSoid()) {
                    freezeList.add(s);
                }
            }
            List<Product> fewProduct = new ArrayList<>();
            fewProduct = getProductDAO.getfewProductsByShop(shop.getSoid());
            
            String status = request.getParameter("txtStatus");
            if (status == null || status.isEmpty()) {
                status = "1";
            }
            List<Product> list = new ArrayList<>();
            if (status.equals("1")) {
                list.addAll(successList);
            }
            if (status.equals("2")){
                list.addAll(fewProduct);
            }
            if(status.equals("3")){
                list.addAll(pendingList);
            }
            if(status.equals("4")){
                list.addAll(failedList);
            }
            if(status.equals("5")){
                list.addAll(freezeList);
            }
            
            request.setAttribute("list", list);
            request.setAttribute("ShopOwner", shop);

            request.getRequestDispatcher("OwnerProduct.jsp").forward(request, response);
        } catch (IOException | IllegalStateException | ServletException e) {
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
