/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.LoginDAO;
import DAO.ProfileDAO;
import Entity.Customer;
import Entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
@WebServlet(name = "LoginControllers", urlPatterns = {"/LoginControllers"})
public class LoginControllers extends HttpServlet {

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
            
            String Email=request.getParameter("txtEmail");
            String Password=request.getParameter("txtPassword");
            LoginDAO login = new LoginDAO ();
            boolean check=login.checkEmail(Email);
            if (check){
                User user = login.checkLogin(Email, Password);
                
                if (user !=null) {
                    HttpSession ss = request.getSession();
                    ss.setAttribute("UserAccount", user);
                    
                    ProfileDAO profile = new ProfileDAO();            
                    Customer cus= profile.ShowCustomer(user);
                    HttpSession customer = request.getSession();
                    customer.setAttribute("Customer", cus);                   
                    
                    
                    
                    if(user.getRole().equals("C")){
                        request.getRequestDispatcher("ViewAdvertisingProducts").forward(request, response);
                    }else if(user.getRole().equals("O")){
                        
                    }else if(user.getRole().equals("S")){
                        
                    }
                    
                }else {
                    request.setAttribute("ERROR", "Mật khẩu không chính xác");
                    request.setAttribute("txtEmail", Email);
                    request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
                }
                
            } else {
                request.setAttribute("ERROR","Thônng tin người dùng không tồn tại");
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
            }
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
