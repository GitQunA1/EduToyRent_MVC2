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
@WebServlet(name = "ViewAdvertisingProducts", urlPatterns = {"/ViewAdvertisingProducts"})
public class ViewAdvertisingProducts extends HttpServlet {

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
        try{
            /* TODO output your page here. You may use following sample code. */
            
           
            
            GetProductDAO get = new GetProductDAO();
            List<Product> successfulProducts = get.getSuccessList();
            
            //-------------------7 sản phẩm giải đố----------------------------------------
            
           
             List<Product> list7GiaiDo = new ArrayList<>();
            int count = 0;
            for (Product product : successfulProducts) {
                if (product.getCategory().equals("Giải đố") && product.getType() == 1) {
                    count++;
                    if(count <= 7) list7GiaiDo.add(product);
                }
            }
            
            request.setAttribute("listGiaiDo", list7GiaiDo);
            
            
            //-----------------------7 sản phảm ngôn ngữ--------------------------------------------
            
            List<Product> list7NgonNgu = new ArrayList<>();
            int count2 = 0;
            for (Product product : successfulProducts) {
                if (product.getCategory().equals("Ngôn ngữ") && product.getType() == 1) {
                    count2++;
                    if(count2 <= 7) list7NgonNgu.add(product);
                }
            }
            request.setAttribute("listNgonNgu", list7NgonNgu);
                        
            //-----------------------------7 sản phẩm toán học---------------------------------------
                    
            List<Product> list7ToanHoc = new ArrayList<>();
            int count3 = 0;
            for (Product product : successfulProducts) {
                if (product.getCategory().equals("Toán học") && product.getType() == 1) {
                    count3++;
                    if(count3 <= 7) list7ToanHoc.add(product);
                }
            }
            request.setAttribute("listToanHoc", list7ToanHoc);            
            request.getRequestDispatcher("GetMainProduct").forward(request, response);
            
            
        }catch(Exception e){
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
