/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ProductDAO;
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
@WebServlet(name = "UpdateProductController", urlPatterns = {"/UpdateProductController"})
public class UpdateProductController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductController at " + request.getContextPath() + "</h1>");
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        HttpSession session = request.getSession();
        Integer soid = (Integer) session.getAttribute("SOID"); // Lấy SOID từ session

        if (soid != null) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            String image = request.getParameter("image");
            String name = request.getParameter("name");
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
            try {
                boolean updated = productDAO.updateProduct(pid, image, name, price, qSell, qRent, age, brand, origin, description, category, status);
                if (updated) {
                    response.sendRedirect("");
                } else {
                    request.setAttribute("errorMessage", "Cập nhật sản phẩm thất bại.");
                    request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("errorPage.jsp");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UpdateProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("loginPage.jsp"); // Nếu SOID không có trong session, yêu cầu đăng nhập
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
