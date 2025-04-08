/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.projectx.Books.Service;
import com.projectx.Books.Repository.Sessionrepository;

import java.sql.SQLException;
import java.sql.ResultSet;
/**
 *
 * @author user
 */
public class SessionService {
     Sessionrepository repository = new Sessionrepository();
     public int registerUser(String name,String email,String contact,String password) 
            throws SQLException, ClassNotFoundException {
        return repository. registerUser(name, email, contact, password);
    }
     
      public boolean isUserExists( String email,String  contact) 
            throws SQLException, ClassNotFoundException {
        return repository. isUserExists(email, contact);
    }
      
       public int verifyLogin(String email, String password) 
            throws SQLException, ClassNotFoundException {
        return repository. loginDetails(email, password);
    }  
      
      
     
     
}
