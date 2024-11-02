/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GetProductDAO;
import DAO.GetShopOwner;
import DAO.HighIncomeToday;
import Entity.Product;
import Entity.ShopOwner;
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
@WebServlet(name = "GetProductDetail", urlPatterns = {"/GetProductDetail"})
public class GetProductDetail extends HttpServlet {

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
            int pid = Integer.parseInt(request.getParameter("txtPID"));
            List<Product> successfulProducts = get.getSuccessList();
            Product p = new Product();
            for (Product product : successfulProducts) {
                if(product.getPid()==(pid))
                    p = product;
            }
            
            HighIncomeToday hit = new HighIncomeToday();
            int SOID = p.getSoid();
            List<Product> highIncList = hit.HighIncList(SOID);
            if(highIncList.size()<7){
                List<Product> anotherList = hit.getAnother(SOID);
                for (Product p1 : anotherList) {
                    boolean check = true;
                    for (Product p2 : highIncList) {
                        if(p2.getPid() == p1.getPid()){
                            check = false;
                            break;
                        }   
                    }
                    if(highIncList.size()>=7)
                        break;
                    if(p1.getPid()== p.getPid())
                        check = false;
                    if(check == true )
                        highIncList.add(p1);                  
                }
            }
            
            GetShopOwner gso = new GetShopOwner();
            List<ShopOwner> shopList = gso.getShopList();
            ShopOwner SO = new ShopOwner();
            for (ShopOwner shopOwner : shopList) {
                if(shopOwner.getSoid() == SOID)
                    SO = shopOwner;
            }
            
            request.setAttribute("shop", SO);
            String description = p.getDescription().replace("\n", "<br>").replace("\\n", "<br>");            
            request.setAttribute("description", description);
            request.setAttribute("highIncList", highIncList);
            request.setAttribute("productDetail", p);
            request.getRequestDispatcher("ViewProductPage.jsp").forward(request, response);         
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
