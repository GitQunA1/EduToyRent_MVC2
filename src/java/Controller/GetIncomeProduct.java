/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.GetProductDAO;
import DAO.IncomeDAO;
import DAO.ProductDAO;
import Entity.Income;
import Entity.Product;
import Entity.ShopOwner;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "GetIncomeProduct", urlPatterns = {"/GetIncomeProduct"})
public class GetIncomeProduct extends HttpServlet {

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
            HttpSession session = request.getSession();
            ShopOwner shop = (ShopOwner) session.getAttribute("ShopOwner");
            String timePeriod = request.getParameter("timePeriod");

            IncomeDAO incomeDAO = new IncomeDAO();
            GetProductDAO getProductDAO = new GetProductDAO();

            List<Product> list = getProductDAO.getListProductBySoid(shop.getSoid());
            List<Product> productList = new ArrayList<>();
            List<Income> incomeList = new ArrayList<>();

            double totalIncome = 0;
            double totalSellIncome = 0;
            double totalRentIncome = 0;
            int totalSellQuantity = 0;
            int totalRentQuantity = 0;

            if(timePeriod == null || timePeriod.isEmpty()){
                timePeriod = "today";
            }
            if (timePeriod.equals("all")) {
                productList = list;

                for (Product product : productList) {
                    Income income = incomeDAO.getIncomeByProductId(shop.getSoid(), product.getPid());
                    if (income != null) {
                        incomeList.add(income);
                        totalSellIncome += income.getIncSell();
                        totalRentIncome += income.getIncRent();
                        totalSellQuantity += income.getqSell();
                        totalRentQuantity += income.getqRent();
                    }
                }
                totalIncome = totalRentIncome + totalSellIncome;
            } else {
                LocalDate startDate = null;
                LocalDate endDate = LocalDate.now();

                switch (timePeriod) {
                    case "today":
                        startDate = endDate;
                        break;
                    case "yesterday":
                        startDate = endDate.minusDays(1);
                        endDate = endDate.minusDays(1);
                        break;
                    case "last7days":
                        startDate = endDate.minusDays(6); // Bao gồm ngày hiện tại
                        break;
                    default:
                        startDate = endDate;
                        break;
                }

                incomeList = incomeDAO.getListIncomeByDate(shop.getSoid(), startDate, endDate);

                for (Income income : incomeList) {
                    int pid = income.getPid();
                    Product product = getProductDAO.getProductById(pid);
                    if (product != null) {
                        productList.add(product);
                    }
                }

                totalSellIncome = incomeList.stream()
                        .mapToDouble(Income::getIncSell).sum();
                totalRentIncome = incomeList.stream()
                        .mapToDouble(Income::getIncRent).sum();
                totalSellQuantity = incomeList.stream()
                        .mapToInt(Income::getqSell).sum();
                totalRentQuantity = incomeList.stream()
                        .mapToInt(Income::getqRent).sum();
                totalIncome = totalRentIncome + totalSellIncome;
            }

            session.setAttribute("totalIncome", totalIncome);
            session.setAttribute("totalSellQuantity", totalSellQuantity);
            session.setAttribute("totalRentQuantity", totalRentQuantity);

            session.setAttribute("incomeList", incomeList);
            session.setAttribute("productList", productList);

            request.getRequestDispatcher("OwnerIncome.jsp").forward(request, response);
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
