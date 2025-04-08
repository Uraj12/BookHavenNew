/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.projectx.Books.Controller;

//import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;

import com.projectx.Books.Service.SessionService;
//import javax.servlet.RequestDispatcher;
import java.sql.DriverManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class SessionServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException, ClassNotFoundException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String process = request.getParameter("process");
        SessionService rs = new SessionService();
        if (process != null && process.equals("registration")) {

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String password = request.getParameter("password");

            // Perform server-side validation if needed
            // Check if email or contact already exists
            var emailExists = rs.isUserExists(email, contact);

            if (emailExists) {
                // Email or contact already exists, return status 0
                out.print("-1");
                return;
            }

            // Generate OTP
            Random rand = new Random();
            int otpValue = rand.nextInt(999999); // Generate a random 6-digit OTP

            // Send OTP via email
            try {
                // Your email sending code
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("sahushubham5249@gmail.com", "nkdqblgaqyuyegnl");
                    }
                });

                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("sahushubham5249@gmail.com"));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                message.setSubject("Your OTP for registration in BookHaven.");
                message.setText("Your OTP is: " + otpValue);
                Transport.send(message);
                HttpSession session1 = request.getSession();
                // Set OTP value in session
                request.getSession().setAttribute("r_otp", otpValue);
                session1.setAttribute("r_name", name);
                session1.setAttribute("r_email", email);
                session1.setAttribute("r_contact", contact);
                session1.setAttribute("r_password", password);

                // Return status 1 if email sent successfully
                out.print("1");
                return; // Exit the method
            } catch (MessagingException e) {
                e.printStackTrace();
                // Return status 0 if email sending fails
                out.print("0");
                return; // Exit the method
            }

        } else if (process != null && process.equals("login")) {
            // loginservice ls = new loginservice();
            try {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                int status = rs.verifyLogin(email, password);
                 String login = "login"; // Corrected variable name
                if (status > 0) {
                    // User authentication successful, create a session and store the email
                    HttpSession session = request.getSession();
                    session.setAttribute("email", email);
                      session.setAttribute("login", login); 
                    out.println("1");
                } else {
                    out.println("0");
                }
            } catch (Exception ex) {
                out.print(ex);
            }
        } else if (process != null && process.equals("forgetPassword")) {
            String email = request.getParameter("email");
            RequestDispatcher dispatcher = null;
            int otpvalue = 0;
            HttpSession mySession = request.getSession();

            if (email != null || !email.equals("")) {
                // sending otp
                Random rand = new Random();
                otpvalue = rand.nextInt(1255650);

                String to = email;// change accordingly
                // Get the session object
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("sahushubham5249@gmail.com", "nkdqblgaqyuyegnl");// Put your email
                        // id and
                        // password here
                    }
                });
                // compose message
                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));// change accordingly
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject("Hello , here is a otp for your forget password .");
                    message.setText("your OTP is: " + otpvalue);
                    // send message
                    Transport.send(message);
                    System.out.println("message sent successfully");
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
                request.setAttribute("message", "OTP is sent to your email id");
                //request.setAttribute("connection", con);
                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("email", email);
                dispatcher.forward(request, response);
                //request.setAttribute("status", "success");
            }
        } else if (process != null && process.equals("enterOtpForgetPswd")) {
            int value = Integer.parseInt(request.getParameter("otp"));
            HttpSession session = request.getSession();
            int otp = (int) session.getAttribute("otp");

            RequestDispatcher dispatcher = null;

            if (value == otp) {

                request.setAttribute("email", request.getParameter("email"));
                request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("newPassword.jsp");
                dispatcher.forward(request, response);

            } else {
                request.setAttribute("message", "wrong otp");

                dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
                dispatcher.forward(request, response);

            }

        } else if (process != null && process.equals("newPassword")) {
            HttpSession session = request.getSession();
            String newPassword = request.getParameter("password");
            String confPassword = request.getParameter("confPassword");
            RequestDispatcher dispatcher = null;

            if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
                try {
                    // Check if both passwords match
                    if (newPassword.equals(confPassword)) {
                        // Passwords match, proceed with database update
                        Class.forName("com.mysql.jdbc.Driver");
                        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/books", "root", "MYSQL80");

                        PreparedStatement pst = con.prepareStatement("update users set password = ? where email = ? ");
                        pst.setString(1, newPassword);
                        pst.setString(2, (String) session.getAttribute("email"));

                        int rowCount = pst.executeUpdate();
                        if (rowCount > 0) {
                            request.setAttribute("status", "resetSuccess");
                            dispatcher = request.getRequestDispatcher("login.jsp");
                        } else {
                            request.setAttribute("status", "resetFailed");
                            dispatcher = request.getRequestDispatcher("login.jsp");
                        }
                        dispatcher.forward(request, response);
                    } else {

                        // Passwords don't match, handle the error (e.g., show an error message to the user)
                        request.setAttribute("status", "passwordMismatch");
                        dispatcher = request.getRequestDispatcher("newPassword.jsp");
                        dispatcher.forward(request, response);

                    }
                } catch (Exception e) {
                    out.print(e);
                }
            } else {
                // New password or confirm password is null, handle the error (e.g., show an error message to the user)
                request.setAttribute("status", "passwordNull");
                dispatcher = request.getRequestDispatcher("newPassword.jsp");
                dispatcher.forward(request, response);
            }
        } else if (process != null && process.equals("registrationOtpValidate")) {
            int value = Integer.parseInt(request.getParameter("otp"));
            HttpSession session = request.getSession();
            int otp = (int) session.getAttribute("r_otp");
            try{
            if (value == otp) {
                // OTP is correct
                String name = (String) session.getAttribute("r_name");
                String email = (String) session.getAttribute("r_email");
                String contact = (String) session.getAttribute("r_contact");
                String password = (String) session.getAttribute("r_password");
                //SessionService rs = new SessionService();
                // Call the method to save data to the database
                int savedToDatabase = rs.registerUser(name, email, contact, password);

                if (savedToDatabase > 0) {
                    // Data saved successfully
                    request.setAttribute("email", email);
                    request.setAttribute("status", "success");
                    // Forward to login.jsp after successful registration
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    // Failed to save data to the database
                    request.setAttribute("message", "Failed to save data to the database");
                    request.getRequestDispatcher("registration.jsp").forward(request, response);
                }
            } else {
                // Wrong OTP
                request.setAttribute("message", "Wrong OTP");
                request.getRequestDispatcher("RegistrationOtpValidate.jsp").forward(request, response);
            }
            }catch  (SQLException e) {
            out.print(e);
                response.getWriter().write("-1");
            }

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
            Logger.getLogger(SessionServlet.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SessionServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SessionServlet.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SessionServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
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
