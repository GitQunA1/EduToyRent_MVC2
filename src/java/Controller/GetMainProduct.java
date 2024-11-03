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
@WebServlet(name = "GetMainProduct", urlPatterns = {"/GetMainProduct"})
public class GetMainProduct extends HttpServlet {

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
            
            GetProductDAO get = new GetProductDAO();
            List<Product> successfulProducts = get.getSuccessList();
            
            List<Product> mainProductList = new ArrayList<>();
            int count = 0;
            for (Product product : successfulProducts) {
                if (product.getType() == 1) {
                    count++;
                    if (count <= 70) {
                        mainProductList.add(product);
                    }
                }
            }
            count = 0;
            List<Product> SecondHand = new ArrayList<>();
            for (Product product : successfulProducts){
                if(product.getqSell() == 1 && product.getType() == 2){
                    count++;
                    if (count <= 70) {
                        SecondHand.add(product);
                    }
                }
            }
            count = 0;
            List<Product> listRented = new ArrayList<>();
            for (Product product : successfulProducts){
                if(product.getqRent() == 1 && product.getType() == 2){
                    count++;
                    if (count <= 70) {
                        listRented.add(product);
                    }
                }
            }
            
            
            
            request.setAttribute("mainProductList", mainProductList);
            request.setAttribute("SecondHand", SecondHand);
            request.setAttribute("listRented", listRented);
            request.getRequestDispatcher("MainPage.jsp").forward(request, response);
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
