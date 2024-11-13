/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProfileDAO;
import Entity.Customer;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
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
@WebServlet(name = "UpdateProfileCustomer", urlPatterns = {"/UpdateProfileCustomer"})
public class UpdateProfileCustomer extends HttpServlet {

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
            request.setCharacterEncoding("utf-8");
            HttpSession ss = request.getSession();
            Customer customer = (Customer) ss.getAttribute("Customer");
            User user = (User) ss.getAttribute("UserAccount");
            
            if (customer != null && user != null) {
                String avatar = request.getParameter("txtAvatarUrl");
                String name = request.getParameter("txtName");
                String sex = request.getParameter("txtSex");
                String address = request.getParameter("txtAddress");
                String phone = request.getParameter("txtPhone");

                String birthdayStr = request.getParameter("txtBirthday");
                java.sql.Date birthday = null;
                if (birthdayStr != null && !birthdayStr.isEmpty()) {
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date parsedDate = format.parse(birthdayStr);
                    birthday = new java.sql.Date(parsedDate.getTime()); //Convert to java.sql.Date
                }
                
                ProfileDAO dao = new ProfileDAO();
                dao.updatePhone(user.getUid(), phone);
                int row = dao.updateProfileCustomer(customer.getUid(), avatar, name, sex, birthday, address);
                if (row > 0) {
                    request.setAttribute("successMessage", "Cập nhật hồ sơ thành công");
                    Customer c = dao.ShowCustomer(user);
                    User u = dao.ShowUser(user.getUid());
                    HttpSession ss2 = request.getSession();
                    ss2.setAttribute("Customer", c);
                    if(u != null){
                        ss2.setAttribute("UserAccount", u);
                    } else {
                    }
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy người dùng cần cập nhật.");
                }
            }
            request.getRequestDispatcher("ProfileCustomer.jsp").forward(request, response);
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
