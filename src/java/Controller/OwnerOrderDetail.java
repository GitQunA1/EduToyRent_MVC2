/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.GetProductDAO;
import DAO.OrderDAO;
import Entity.OrderDetail;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author HagiLee
 */
@WebServlet(name = "OwnerOrderDetail", urlPatterns = {"/OwnerOrderDetail"})
public class OwnerOrderDetail extends HttpServlet {

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
            HttpSession shopOwnerSession = request.getSession();
            ShopOwner sa = (ShopOwner) shopOwnerSession.getAttribute("ShopOwner");
            int status = 1;
            try {
                String txtStatus = request.getParameter("txtStatus");
                status = Integer.parseInt(txtStatus);
            } catch (Exception e) {
                status = 1;
            }
            int option = 0;
            try {
                String txtOption = request.getParameter("txtOption");
                option = Integer.parseInt(txtOption);
            } catch (Exception e) {
                option = 0;
            }
            OrderDAO od = new OrderDAO();
            GetProductDAO gpd = new GetProductDAO();
            List<OrderDetail> List = od.GetOrderDetailBySOID(sa.getSoid(), status);
            if(status == 10){
                for (OrderDetail o : od.GetOrderDetailBySOID(sa.getSoid(), 9)) {
                    List.add(o);
                }
            }
            List<OrderDetail> orderDetailList = new ArrayList<>();
            List<Product> ProductOrdered = new ArrayList<>();
            if (option == 0) {
                for (Product p : gpd.getSuccessList()) {
                    for (OrderDetail d : List) {
                        if (p.getPid() == d.getPid()) {
                            ProductOrdered.add(p);
                            break;
                        }
                    }
                }
                request.setAttribute("OwnerOrderDetail", List);
            } else {
                for (OrderDetail o : List) {
                    if (o.getRentTime() == 0 && option == 1) {
                        orderDetailList.add(o);
                    }
                    if (o.getRentTime() > 0 && option == 2) {
                        orderDetailList.add(o);
                    }
                }
                for (Product p : gpd.getSuccessList()) {
                    for (OrderDetail d : orderDetailList) {
                        if (p.getPid() == d.getPid()) {
                            ProductOrdered.add(p);
                            break;
                        }
                    }
                }
                request.setAttribute("OwnerOrderDetail", orderDetailList);
            }
            request.setAttribute("ProuductOrdered", ProductOrdered);
            request.getRequestDispatcher("OwnerOrder.jsp").forward(request, response);
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
