/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.SearchProduct;
import Entity.Product;
import java.io.IOException;
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
@WebServlet(name = "SearchByName", urlPatterns = {"/SearchByName"})
public class SearchByName extends HttpServlet {

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
            request.setCharacterEncoding("UTF-8");
            int qRent = 0;
            int qSell = 0;
            int qStype = 0;
  
            try {
                qRent = Integer.parseInt(request.getParameter("txtQRent"));
                qSell = Integer.parseInt(request.getParameter("txtQSell"));
                qStype = Integer.parseInt(request.getParameter("txtStype"));
            } catch (NumberFormatException e) {
                request.setAttribute("error", "ParseInt fail");
            }
            
            String txtName = request.getParameter("txtSearch");
            if (txtName != null) {
                txtName = txtName.trim().toLowerCase();
                 System.out.println("txtName: " + txtName);
            } else {
                txtName = "";
            }
            
          //  request.setAttribute("txtName", txtName);
          //  request.getRequestDispatcher("testJSP.jsp").forward(request, response);
            
            SearchProduct search = new SearchProduct();
            List<Product> searchResults = search.SearchByName(txtName, qRent, qSell, qStype); 

            request.setAttribute("ProductSearch", searchResults);

            request.setAttribute("qRent", qRent);
            request.setAttribute("qSell", qSell);
            request.setAttribute("qStype", qStype);

            request.getRequestDispatcher("SearchProductPage.jsp").forward(request, response);

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


