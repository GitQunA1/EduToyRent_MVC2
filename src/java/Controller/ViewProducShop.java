/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GetProductDAO;
import DAO.GetShopOwner;
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

/**
 *
 * @author Quyền
 */
@WebServlet(name = "ViewProducShop", urlPatterns = {"/ViewProducShop"})
public class ViewProducShop extends HttpServlet {

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
            
            int txtSOID = Integer.parseInt(request.getParameter("txtSOID"));
            
            GetShopOwner sd = new GetShopOwner();
            List<ShopOwner> so = sd.getShopList();
            ShopOwner shop = new ShopOwner();
            for (ShopOwner shopOwner : so) {
                if(shopOwner.getSoid() == txtSOID){
                    shop = shopOwner;
                    break;
                }
            }
            
            
            GetProductDAO pd = new GetProductDAO();
            List<Product> product = pd.getSuccessList();
            List<Product> productOfShop = new ArrayList<>();
            for (Product product1 : product) {
                if(product1.getSoid() == txtSOID){
                    productOfShop.add(product1);
                }
            }
            
            request.setAttribute("shop", shop);
            request.setAttribute("productOfShop", productOfShop);
            request.getRequestDispatcher("ViewShopPage.jsp").forward(request, response);
            
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
