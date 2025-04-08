/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.projectx.Books.Service;

import com.projectx.Books.Repository.EcomRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ajay
 */
public class EcomService {

    EcomRepository ecomRepository = new EcomRepository();

    public int AddTOCart(int userId, int bookId) throws SQLException, ClassNotFoundException {
        return ecomRepository.AddToCart(userId, bookId);
    }

    public ResultSet ViewCartItems() throws SQLException, ClassNotFoundException {
        return ecomRepository.CartItems();
    }
     public int QuantityChange(int quantity, int id) throws SQLException, ClassNotFoundException {
        return ecomRepository.QuantityChange(quantity, id);
    }

    public int DeleteCartItem(int user_id, int book_id) throws SQLException, ClassNotFoundException  {
        return ecomRepository.DeleteCartItem(user_id, book_id);
    }
    public int AddTOWl(int userId, int bookId) throws SQLException, ClassNotFoundException {
        return ecomRepository.AddToWl(userId, bookId);
    }
     public ResultSet ViewWlItems() throws SQLException, ClassNotFoundException {
        return ecomRepository.WlItems();
    }
     public int DeleteWlItem(int user_id, int book_id) throws SQLException, ClassNotFoundException  {
        return ecomRepository.DeleteWlItem(user_id, book_id);
    }
      public boolean isBookInCart(int user_Id, int book_Id) throws SQLException, ClassNotFoundException {
          return ecomRepository.isBookInCart(user_Id, book_Id);
      }
        public boolean isBookInWl(int user_Id, int book_Id) throws SQLException, ClassNotFoundException {
          return ecomRepository.isBookInWl(user_Id, book_Id);
      }
        
       public ResultSet AdminProfile(String userEmail) throws SQLException, ClassNotFoundException {
       return ecomRepository.AdminProfile(userEmail);
    }
      public int totalwishlistcount() throws SQLException, ClassNotFoundException {
        return ecomRepository.totalwishlistcount();
    }
     public int totalissuedbookcount(String userEmail) throws SQLException, ClassNotFoundException {
        return ecomRepository.totalissuedbookcount(userEmail);
    }
      public int issuehistory(String userEmail) throws SQLException, ClassNotFoundException {
        return ecomRepository.issuehistory(userEmail);
    } 
      public int totalorders(String userEmail) throws SQLException, ClassNotFoundException {
        return ecomRepository.totalorders(userEmail);
    } 

    public int IssueBook(int user_id, int book_id,String user_name,String user_Email) throws ClassNotFoundException, SQLException {
         return ecomRepository.IssueBook(user_id, book_id,user_name,user_Email);
    }

    public String getUserName(int user_id) throws ClassNotFoundException, SQLException {
         return ecomRepository.getUserName(user_id);
    }

    public String getUserEmail(int user_id) throws ClassNotFoundException, SQLException {
         return ecomRepository.getUserEmail(user_id);
    }

    public int RenewalBook(int user_id, int book_id, String user_name, String user_Email) throws ClassNotFoundException, SQLException {
  return ecomRepository.RenewalBook(user_id, book_id,user_name,user_Email);   
    }
     public int getUSerIdByEmail(String userEmail) throws SQLException, ClassNotFoundException {
        return ecomRepository.getUSerIdByEmail(userEmail);
    }

    public boolean checkBookIssued(int user_id, int book_id) throws ClassNotFoundException, SQLException {
        
        return ecomRepository.checkBookIssued(user_id,book_id);
    }

    public int decreasequantity(int book_id) throws SQLException {
         return ecomRepository.decreasequantity(book_id);
    }

    public int alreadyissued(int book_id, String user_Email) throws SQLException {
        return ecomRepository.alreadyissued(book_id,user_Email);
    }

    public int getAvailableQuantity(int book_id) throws ClassNotFoundException, SQLException {
         return ecomRepository.getAvailableQuantity(book_id);
    }

//    public int checkBookIssueRequest(int book_id, int user_id) throws ClassNotFoundException, SQLException {
//        return ecomRepository.checkBookIssueRequest(book_id,user_id);
//    }

    public int returnbook(int book_id, int user_id) throws ClassNotFoundException, SQLException {
         return ecomRepository.returnbook(book_id,user_id);
    }

    public boolean checkBookInIssueRequest(int book_id,int user_id) throws ClassNotFoundException, SQLException {
         return ecomRepository.checkBookInIssueRequest(book_id,user_id);
    }

    public boolean checkBookInIssued(int book_id, int user_id) throws ClassNotFoundException, SQLException {
         return ecomRepository.checkBookInIssued(book_id,user_id);
    }
public int duebooks(String userEmail) throws SQLException, ClassNotFoundException {
        return ecomRepository.duebooks(userEmail);
    } 

    public int profileupdate(String updatedName, String updatedEmail, String updatedPhno,String address1,String address2) throws SQLException {
         return ecomRepository.profileupdate(updatedName,updatedEmail,updatedPhno,address1,address2);
    }
    public ResultSet favAuthor(String userEmail) throws SQLException, ClassNotFoundException {
       return ecomRepository.favAuthor(userEmail);
    }
    public ResultSet topbooks() throws SQLException, ClassNotFoundException {
       return ecomRepository.topbooks();
    }
    public ResultSet IssuedBookHistory(String userEmail) throws SQLException, ClassNotFoundException {
       return ecomRepository.IssuedBookHistory(userEmail);
    }
   

}

