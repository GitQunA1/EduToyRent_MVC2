/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GetProductDAO;
import Entity.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HagiLee
 */
@WebServlet(name = "ProductFilter", urlPatterns = {"/ProductFilter"})
public class ProductFilter extends HttpServlet {

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
            String option = request.getParameter("txtOption");
            GetProductDAO get = new GetProductDAO();
            List<Product> successfulProducts = get.getSuccessList();
            String url= "MainPage.jsp";

            if (option.equals("3")) {
                List<Product> saleList = new ArrayList<>();
                for (Product product : successfulProducts) {
                    if (product.getType() == 1){
                        saleList.add(product);
                    }
                }
                
                request.setAttribute("saleList", saleList);
                url = "NewProductPage.jsp";
            } else if (option.equals("2")) {
                List<Product> SecondHand = new ArrayList<>();
                for (Product product : successfulProducts) {
                    if (product.getqSell() == 1 && product.getType() == 2) {
                        SecondHand.add(product);
                    }
                }
                
                request.setAttribute("SecondHand", SecondHand);
                url = "SecondHandPage.jsp";
            } else if (option.equals("1")){
                List<Product> listRent = new ArrayList<>();
                for (Product product : successfulProducts) {
                    if (product.getqRent() == 1 && product.getType() == 2) {
                        listRent.add(product);
                    }
                }
                request.setAttribute("listRent", listRent);
                url = "RentPage.jsp";
            }
            request.getRequestDispatcher(url).forward(request, response);
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
