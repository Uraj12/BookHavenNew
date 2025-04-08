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
 * @author ajay
 */
public class BookRepository {

    String url = "jdbc:MySql://localhost:3306/books";
    String user = "root";
    String password = "shubham5249";

    public ResultSet ViewBooks() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("SELECT bs.book_id, bs.book_name, bs.book_img, bs.description, bs.book_price, c.category_name as category, bs.has_offer, bs.is_featured, bs.on_trend, a.author_name FROM book_stock bs JOIN authors a ON bs.author_id = a.author_id JOIN category c ON bs.category_id = c.category_id ORDER BY bs.book_name ASC;");

        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public ResultSet ViewGenre() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT category_name as category FROM category ORDER BY category_name ASC;");

        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public ResultSet ViewAuthors() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT author_name,author_id FROM authors ORDER BY author_name ASC;");

        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public ResultSet ViewYear() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT publish_year FROM book_stock ORDER BY publish_year ASC;");

        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public ResultSet latestBooks() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("SELECT book_id, book_name,book_img, author_name, description, book_price, category_id, has_offer, is_featured FROM book_stock ORDER BY dateAdded DESC;");

        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public ResultSet Filter(String SqlQuery) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement(SqlQuery);

        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public ResultSet FeaturedWriter() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("SELECT  MAX(authors.img) AS img, authors.author_name AS author_name, COUNT(book_stock.book_id) AS total_books FROM authors JOIN book_stock ON authors.author_id = book_stock.author_id GROUP BY authors.author_name ORDER BY COUNT(book_stock.book_id) DESC;");

        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public ResultSet searchBooks(String searchQuery) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(url, user, password);
        String queryParam = "%" + searchQuery + "%";
        String sql = "SELECT bs.*, a.author_name, c.category_name "
                + "FROM book_stock bs "
                + "INNER JOIN authors a ON bs.author_id = a.author_id "
                + "INNER JOIN category c ON bs.category_id = c.category_id "
                + "WHERE bs.book_name LIKE ? OR a.author_name LIKE ? OR c.category_name LIKE ? ";

        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, queryParam);
        stmt.setString(2, queryParam);
        stmt.setString(3, queryParam);
        ResultSet rs = stmt.executeQuery();

        return rs;
    }

   public ResultSet viewIssuedBooks(int userid) throws ClassNotFoundException, SQLException {
   Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, password);

    String query = "SELECT bs.book_id, bs.book_name, bs.book_img,bs.has_offer ,bs.description, bs.book_price, a.author_name,bi.return_date " +
                   "FROM bookissued bi " +
                   "JOIN book_stock bs ON bi.book_id = bs.book_id " +
                   "JOIN authors a ON bs.author_id = a.author_id " +
                   "WHERE bi.user_id = ?";

    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setInt(1, userid);

    ResultSet rs = stmt.executeQuery();

    return rs;
}

}
