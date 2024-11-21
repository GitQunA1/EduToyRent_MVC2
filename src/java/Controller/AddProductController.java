/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
import Entity.ShopOwner;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "AddProductController", urlPatterns = {"/AddProductController"})
public class AddProductController extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            ShopOwner shop = (ShopOwner) session.getAttribute("ShopOwner");
            if (shop != null) {
                int soid = shop.getSoid();
                int type = shop.getType();

                String image = request.getParameter("image");
                String name = request.getParameter("name");
                try {
                    float price = Float.parseFloat(request.getParameter("price"));
                    int qSell = Integer.parseInt(request.getParameter("qSell"));
                    int qRent = Integer.parseInt(request.getParameter("qRent"));
                    int age = Integer.parseInt(request.getParameter("age"));
                    
                    String brand = request.getParameter("brand");
                    String origin = request.getParameter("origin");
                    String description = request.getParameter("description");
                    String category = request.getParameter("category");
                    String status = request.getParameter("status");
                    ProductDAO productDAO = new ProductDAO();
                    boolean isInserted = productDAO.insertProduct(soid, image, name, price, qSell, qRent, age, brand, origin, description, category, type, status);
                    if (isInserted) {
                        response.sendRedirect("MainPage.jsp");
                    } else {
                        response.sendRedirect("");
                    }
                } catch (Exception e) {
                }
            } else {
                response.sendRedirect("");
            }
        } catch (Exception e) {
        }
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
