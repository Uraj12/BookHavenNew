/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.projectx.Books.Service;

import com.projectx.Books.Repository.BookRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ajay
 */
public class BookService {
    BookRepository bookRepository = new BookRepository();
    
    public ResultSet viewBooks() throws SQLException, ClassNotFoundException{
        return bookRepository.ViewBooks();
    }

    public ResultSet viewGenre() throws SQLException, ClassNotFoundException {
         return bookRepository.ViewGenre();
    }
    public ResultSet viewAuthors() throws SQLException, ClassNotFoundException {
         return bookRepository.ViewAuthors();
    }
     public ResultSet viewYear() throws SQLException, ClassNotFoundException {
         return bookRepository.ViewYear();
    }

      public ResultSet latestBooks() throws SQLException, ClassNotFoundException{
        return bookRepository.ViewBooks();
    }

    public ResultSet filter(String SqlQuery) throws SQLException, ClassNotFoundException {
       return bookRepository.Filter(SqlQuery);
    }
       public ResultSet featuredWriter() throws SQLException, ClassNotFoundException{
        return bookRepository.FeaturedWriter();
    }
       public ResultSet searchBooks(String searchQuery) throws SQLException, ClassNotFoundException {
         return bookRepository.searchBooks(searchQuery);
    }
        public ResultSet viewIssuedBooks(int userid) throws SQLException, ClassNotFoundException{
        return bookRepository.viewIssuedBooks(userid);
    }
}
