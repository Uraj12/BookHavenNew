/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.projectx.Books.Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class Sessionrepository {

    String url = "jdbc:MySql://localhost:3306/books";
    String user = "root";
    String pass = "shubham5249";

    public int registerUser(String name, String email, String contact, String password) throws SQLException, ClassNotFoundException {
int status;
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass);

        PreparedStatement stmt = con.prepareStatement("""
                                                     INSERT INTO users (name, email, contact, password) VALUES (?, ?, ?, ?)""");
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, contact);
        stmt.setString(4, password);
        status = stmt.executeUpdate();

            return status;
    }
public boolean isUserExists(String email, String contact) throws SQLException, ClassNotFoundException {
    Connection con = null;
    PreparedStatement emailStatement = null;
    PreparedStatement contactStatement = null;
    ResultSet emailResultSet = null;
    ResultSet contactResultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);

        // Check if the email exists
        emailStatement = con.prepareStatement("SELECT * FROM users WHERE email = ?");
        emailStatement.setString(1, email);
        emailResultSet = emailStatement.executeQuery();
        if (emailResultSet.next()) {
            return true; // User with the given email already exists
        }

        // Check if the contact exists
        contactStatement = con.prepareStatement("SELECT * FROM users WHERE contact = ?");
        contactStatement.setString(1, contact);
        contactResultSet = contactStatement.executeQuery();
        if (contactResultSet.next()) {
            return true; // User with the given contact already exists
        }

        return false; // User does not exist with the given email or contact
    } finally {
        // Close resources in finally block
        if (emailResultSet != null) emailResultSet.close();
        if (contactResultSet != null) contactResultSet.close();
        if (emailStatement != null) emailStatement.close();
        if (contactStatement != null) contactStatement.close();
        if (con != null) con.close();
    }
}

   public int loginDetails(String email, String password) throws SQLException, ClassNotFoundException {

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass);

        PreparedStatement stmt = con.prepareStatement("""
                                                      SELECT COUNT(email) 
                                                      FROM users 
                                                      WHERE email = ? AND password = ?;""");
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

      

     int status = 1;
        
        if (rs.next()) {
            status = rs.getInt(1);
        }
        return status;
}

}

