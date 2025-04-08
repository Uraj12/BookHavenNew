package com.projectx.Books.Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author user
 */
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class ForgetPasswordmailSender {
    public static void sendVerificationEmail(String recipientEmail, String verificationCode) throws MessagingException {
        // Your email configuration
        String host = "smtp.gmail.com";
        String username = "sahushubham5249@gmail.com";
        String password = "nkdqblgaqyuyegnl";
        int port = 587;
        
        // Sender's email address
        String fromEmail = "sahushubham5249@gmail.com";

        // Email properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);

        // Get the Session object
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        // Compose the message
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject("Email Verification");
        message.setText("Your verification code is: " + verificationCode);

        // Send the message
        Transport.send(message);
    }
}

