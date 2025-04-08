/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.projectx.Books.Controller;

import com.projectx.Books.Service.EcomService;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ajay
 */
public class Ecommerce extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            EcomService ecomService = new EcomService();
            String process = request.getParameter("process");

            if (process.equals("AddToCart")) {
                int book_id = Integer.parseInt(request.getParameter("bookId"));
                int user_id = Integer.parseInt(request.getParameter("userId"));
                int result = ecomService.AddTOCart(user_id, book_id);
                request.setAttribute("status", result);

            } else if (process.equals("quantityChange")) {
                int cart_id = Integer.parseInt(request.getParameter("cartId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int result = ecomService.QuantityChange(quantity, cart_id);
                request.setAttribute("status", result);
            } else if (process.equals("deleteCartItem")) {
                int book_id = Integer.parseInt(request.getParameter("bookId"));
                int user_id = Integer.parseInt(request.getParameter("userId"));
                int result = ecomService.DeleteCartItem(user_id, book_id);
                request.setAttribute("status", result);
            } else if (process.equals("AddToWl")) {
                int book_id = Integer.parseInt(request.getParameter("bookId"));
                int user_id = Integer.parseInt(request.getParameter("userId"));
                int result = ecomService.AddTOWl(user_id, book_id);
                request.setAttribute("status", result);

            } else if (process.equals("deleteWlItem")) {
                int book_id = Integer.parseInt(request.getParameter("bookId"));
                int user_id = Integer.parseInt(request.getParameter("userId"));
                int result = ecomService.DeleteWlItem(user_id, book_id);
                request.setAttribute("status", result);
            } else if (process.equals("IssueBook")) {
                int book_id = Integer.parseInt(request.getParameter("bookId"));
                int user_id = Integer.parseInt(request.getParameter("userId"));
                String user_name = ecomService.getUserName(user_id);
                String user_Email = ecomService.getUserEmail(user_id);
                int requestedQuantity = 1; // Assuming you have a parameter for requested quantity

                // Check if the book exists in the bookissuerequest table
                boolean bookInIssueRequest = ecomService.checkBookInIssueRequest(book_id, user_id);
                // Check if the book exists in the bookissued table
                boolean bookInIssued = ecomService.checkBookInIssued(book_id, user_id);

                if (!bookInIssueRequest && !bookInIssued) {
                    // Book not in bookissuerequest or bookissued, proceed with issuing
                    int availableQuantity = ecomService.getAvailableQuantity(book_id);
                    System.out.println("availableQuantity" + availableQuantity);
                    if (availableQuantity >= requestedQuantity) {
                        int issueResult = ecomService.IssueBook(user_id, book_id, user_name, user_Email);
                        if (issueResult > 0) {
                            // Successfully issued the book, now decrease the quantity
                            int decreaseResult = ecomService.decreasequantity(book_id);
                            if (decreaseResult > 0) {
                                // Send email notification to the user
                                String subject = "Issue Request Notification";
                                String message = "Your request with ID " + book_id + " has been sent to admin. It will take some "
                                        + "time to accept your request. Once the request is accepted, an email will be sent to you, and you will receive the book physically.";

                                try {
                                    EmailService.sendEmail(user_Email, subject, message);
                                    out.println("Email sent successfully!" + issueResult);
                                    request.setAttribute("status", issueResult); // Set status value in request attribute

                                } catch (Exception e) {
                                    // Handle email sending failure
                                    out.println("Failed to send email: " + e.getMessage());
                                    int failureResult = 0;
                                    request.setAttribute("status", failureResult); // Set failure status value in request attribute

                                    e.printStackTrace();
                                }
                            } else {
                                // Error in decreasing quantity
                                out.println("Error in decreasing quantity for book with ID " + book_id);
                                int decreaseFailureResult = -2;
                                request.setAttribute("status", decreaseFailureResult); // Set failure status value in request attribute

                            }
                        } else {
                            // Error in issuing the book
                            out.println("Error in issuing the book with ID " + book_id);
                            int issueFailureResult = -1;
                            request.setAttribute("status", issueFailureResult); // Set failure status value in request attribute

                        }
                    } else {
                        // Quantity not available, send alert
                        out.println("No quantity available for book with ID " + book_id);
                        int result = -1;
                        request.setAttribute("status", result); // Set failure status value in request attribute
                        request.setAttribute("process", process);
                        RequestDispatcher view = request.getRequestDispatcher("EcommerceAttributes.jsp");
                        view.forward(request, response);
                    }
                } else {
                    // Book already exists in bookissuerequest or bookissued, send alert
                    out.println("Book with ID " + book_id + " already exists in bookissuerequest or bookissued table");
                    int result = -9;
                    request.setAttribute("status", result); // Set failure status value in request attribute

                }
            } else if (process.equals("RenewalBook")) {
                int book_id = Integer.parseInt(request.getParameter("bookId"));
                int user_id = Integer.parseInt(request.getParameter("userId"));
                String user_name = ecomService.getUserName(user_id);
                String user_Email = ecomService.getUserEmail(user_id);
                System.out.println("book_id: " + book_id);

                // Check if the book exists in the bookIssued table for the user
                boolean checkBookIssued = ecomService.checkBookIssued(user_id, book_id);
                System.out.println(checkBookIssued);

                // Check if the book exists and proceed with renewal
                if (checkBookIssued) {
                    int result = ecomService.RenewalBook(user_id, book_id, user_name, user_Email);
                    System.out.println("result" + result);
                    if (result > 0) {

                        response.getWriter().write("0");
                        request.setAttribute("status", result);

                    }
                } else {
                    // Book not found in the bookIssued table, handle accordingly
                    System.out.println("Book with ID " + book_id + " is not issued to user " + user_id);
                    response.setContentType("text/html");
                    response.getWriter().write("false");

                }

                request.setAttribute("process", process);
                RequestDispatcher view = request.getRequestDispatcher("EcommerceAttributes.jsp");
                view.forward(request, response);
            } else if (process.equals("bookreturn")) {
                int book_id = Integer.parseInt(request.getParameter("bookId"));
                int user_id = Integer.parseInt(request.getParameter("userId"));
                String user_name = ecomService.getUserName(user_id);
                String user_Email = ecomService.getUserEmail(user_id);
                int returnbook = ecomService.returnbook(book_id, user_id);

                request.setAttribute("status", returnbook);

            } else if (process.equals("updateUserProfile")) {
                String updatedName = request.getParameter("updatedName");
                String updatedEmail = request.getParameter("updatedEmail");
                String updatedPhno = request.getParameter("updatedPhno");
                String address1 = request.getParameter("updatedAddress1");
                String address2 = request.getParameter("updatedAddress2");

                int profileupdate = ecomService.profileupdate(updatedName, updatedEmail, updatedPhno, address1, address2);
                request.setAttribute("status", profileupdate);

            }else if (process.equals("logout")) {
                 request.getSession().invalidate();
                 response.sendRedirect("login.jsp");
            
            }
            request.setAttribute("process", process);
            RequestDispatcher view = request.getRequestDispatcher("EcommerceAttributes.jsp");
            view.forward(request, response);

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
            java.util.logging.Logger.getLogger(Ecommerce.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Ecommerce.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
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
            java.util.logging.Logger.getLogger(Ecommerce.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Ecommerce.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
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
