/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.CustomerDAO;
import DAO.UserDAO;
import Entity.Customer;
import Entity.User;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private static final String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    private static final String passRegex = "^[a-zA-Z0-9]{8,20}$";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            String name = request.getParameter("txtName");
            
            UserDAO userDAO = new UserDAO();

            if (userDAO.isExistemail(email)) {
                request.setAttribute("error", "Email đã tồn tại!");
                request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
                return;
            }
            
            if (!email.matches(emailRegex)) {
                request.setAttribute("error", "Email không hợp lệ!");
                request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
                return;
            }
            if (!password.matches(passRegex)) {
                request.setAttribute("error", "Mật khẩu từ 8-20 kí tự không bao gồm các kí tự đặc biệt.");
                request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
                return;
            }
            if (!password.equals(confirmPassword)) {
                request.setAttribute("error", "Hai mật khẩu không khớp!");
                request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
            }

            User user = new User();
            user.setEmail(email);
            user.setPassword(password);
            user.setRole("C");

            int uid = userDAO.signUp(user);

            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = new Customer();

            customer.setUid(uid);
            customer.setName(name);
            customerDAO.addCustomer_Register(customer);

            request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
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
