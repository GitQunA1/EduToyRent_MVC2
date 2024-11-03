/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quyền
 */
public class MainController extends HttpServlet {

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
        
        String action = request.getParameter("action");
        String url = "ViewAdvertisingProducts";
        if(action == null) action = "home";
        switch(action){
            case "home":
                url="ViewAdvertisingProducts";
                break;
            case "SearchProduct":
                url="SearchByName";
                break;
            case "SearchGender":
                url="SearchByCategory";
                break;
            case "SearchAge":
                url="SearchByAge";
                break;
            case "viewProduct":
                url="GetProductDetail";
                break;
            case "AccountPage":
                url="MainAccount";
                break;
            case "Login":
                url="LoginControllers";
                break;
            case "AddToCart":
                url="AddToCart";
                break;
            case "CartPage":
                url="LetToCart";
                break;
            case "updateCart":
                url = "UpdateCart";
                break;
            case "DeleteCart":
                url = "DeleteCart";
                break;
            case "Letpayment":
                url = "LetToPayment";
                break;
            case "Payment":
                url = "Payment";
                break;
            case "InformationOrder":
                url = "GetOrderDetail";
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);

        
        
      /*  String action = request.getParameter("action");
        String url = "MainPage.jsp";
        if(action == null) action = "Home";
        
        switch(action){
            case "Home":
                url = "MainPage.jsp";
                break;
        }
       request.getRequestDispatcher(url).forward(request, response); */
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
