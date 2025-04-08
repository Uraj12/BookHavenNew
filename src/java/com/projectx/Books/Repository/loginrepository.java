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
public class loginrepository {

   String url = "jdbc:MySql://localhost:3306/books";
    String user = "root";
    String pass = "shubham5249";

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
