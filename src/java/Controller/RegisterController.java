/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.CustomerDAO;
import DAO.UserDAO;
import utils.util;
import Entity.Customer;
import Entity.User;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private static final String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    private static final String passRegex = "^[a-zA-Z0-9]{8,20}$";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        PrintWriter out = response.getWriter();
        try {
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            String name = request.getParameter("txtName");

            if (!email.matches(emailRegex)) {
                request.setAttribute("error", "Invalid email format!");
                request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
                return;
            }
            if (!password.matches(passRegex)) {
                request.setAttribute("error", "Password must be 8-20 characters long and contain no special characters.");
                request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
                return;
            }
            if (!password.equals(confirmPassword)) {
                request.setAttribute("error", "Passwords do not match!");
                request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
            }

            UserDAO userDAO = new UserDAO();

            if (userDAO.isExistemail(email)) {
                request.setAttribute("error", "Email already exists!");
                request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
                return;
            }
            User user = new User();
            user.setEmail(email);
            user.setPassword(password);
            user.setRole("C");

            boolean success = userDAO.signUp(user);
            if (success) {
                int uid = userDAO.getLastInsertedUID();
                CustomerDAO customerDAO = new CustomerDAO();
                Customer customer = new Customer();
                customer.setUID(uid);
                customer.setName(name);
                customerDAO.addCustomer_Register(customer);

                response.sendRedirect("LoginPage.jsp");
            } else {
                request.setAttribute("error", "Registration failed, please try again!");
                request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException | NamingException e) {
            getServletContext().log("RegisterController Exception:" + e.getMessage());
        } finally {
            out.close();
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
