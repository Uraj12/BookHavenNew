/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.projectx.Books.Controller;

import com.projectx.Books.Service.BookService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ajay
 */
public class BookServlet extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            BookService bookService = new BookService();
            String process = request.getParameter("process");

            if (process.equals("Filter")) {
                String category = request.getParameter("category");
                String year = request.getParameter("year");
                String author = request.getParameter("author");
                String price = request.getParameter("price");
                int minPrice, maxPrice;

                switch (price) {
                    case "Below $20":
                        minPrice = 0;
                        maxPrice = 20;
                        break;
                    case "$20 - $30":
                        minPrice = 20;
                        maxPrice = 30;
                        break;
                    case "$30 - $60":
                        minPrice = 30;
                        maxPrice = 60;
                        break;
                    case "$60 - $100":
                        minPrice = 60;
                        maxPrice = 100;
                        break;
                    case "$100 - $150":
                        minPrice = 100;
                        maxPrice = 150;
                        break;
                    case "above $150":
                        minPrice = 150;
                        maxPrice = Integer.MAX_VALUE;
                        break;
                    default:
                        minPrice = 0;
                        maxPrice = Integer.MAX_VALUE;
                }

                StringBuilder sqlQuery = new StringBuilder("SELECT bs.book_id, bs.book_name, bs.book_img, bs.description, bs.book_price, c.category_name, bs.has_offer, bs.is_featured, bs.on_trend, a.author_name FROM book_stock bs JOIN authors a ON bs.author_id = a.author_id JOIN category c ON bs.category_id = c.category_id WHERE 1=1");

                if (!category.isEmpty() && !category.equals("All Books")) {
                    sqlQuery.append(" AND c.category_name='").append(category).append("'");
                }
                if (!year.isEmpty() && !year.equals("Year")) {
                    if (year.equals("Undefined")) {
                        sqlQuery.append(" AND publish_year IS NULL");
                    } else {
                        sqlQuery.append(" AND publish_year=").append(year);
                    }
                }

                if (!author.isEmpty() && !author.equals("Authors")) {
                    sqlQuery.append(" AND bs.author_id='").append(author).append("'");
                }

                if (minPrice > 0) {
                    sqlQuery.append(" AND book_price >= ").append(minPrice);
                }

                if (maxPrice < Integer.MAX_VALUE) {
                    sqlQuery.append(" AND book_price <= ").append(maxPrice);
                }
                sqlQuery.append(" ORDER by bs.book_name ASC");

                request.setAttribute("process", process);
                request.setAttribute("result", bookService.filter(sqlQuery.toString()));

            }else if(process.equals("search")){
                String searchquery = request.getParameter("searchwords");
                 request.setAttribute("process", process);
                 request.setAttribute("result", bookService.searchBooks(searchquery));
            }
            RequestDispatcher view = request.getRequestDispatcher("BookAttributes.jsp");
            view.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BookServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookServlet.class.getName()).log(Level.SEVERE, null, ex);
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
