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
public class EcomRepository {

    String url = "jdbc:MYSQL://localhost:3306/books";
    String user = "root";
    String password = "shubham5249";

    public int AddToCart(int userId, int bookId) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("insert into user_cart(user_id,book_id) values (?,?);");
        stmt.setInt(1, userId);
        stmt.setInt(2, bookId);

        return stmt.executeUpdate();
    }

    public ResultSet CartItems() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("SELECT uc.cart_item_id, uc.book_id, uc.user_id, uc.quantity, bs.book_name,bs.book_img, bs.book_price ,bs.quantity as book_quantity FROM user_cart uc INNER JOIN book_stock bs ON uc.book_id = bs.book_id;");

        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public int QuantityChange(int quantity, int id) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("UPDATE user_cart SET quantity = ? WHERE cart_item_id = ?;");
        stmt.setInt(1, quantity);
        stmt.setInt(2, id);

        return stmt.executeUpdate();
    }

    public int DeleteCartItem(int user_id, int book_id) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("Delete from  user_cart WHERE user_id = ? AND book_id = ?;");

        stmt.setInt(1, user_id);
        stmt.setInt(2, book_id);

        return stmt.executeUpdate();
    }

    public int AddToWl(int userId, int bookId) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("insert into wishlist(user_id,book_id) values (?,?);");
        stmt.setInt(1, userId);
        stmt.setInt(2, bookId);

        return stmt.executeUpdate();
    }

    public ResultSet WlItems() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("select wl.wl_id, wl.user_id,wl.book_id,wl.date_added, bs.book_name,bs.book_img, bs.book_price FROM wishlist wl INNER JOIN book_stock bs ON wl.book_id = bs.book_id;");

        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public int DeleteWlItem(int user_id, int book_id) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("Delete from  wishlist WHERE user_id = ? AND book_id = ?;");

        stmt.setInt(1, user_id);
        stmt.setInt(2, book_id);
        return stmt.executeUpdate();
    }

    public boolean isBookInCart(int user_Id, int book_Id) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS count FROM user_cart WHERE user_id = ? AND book_id = ?;");

        stmt.setInt(1, user_Id);
        stmt.setInt(2, book_Id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            int count = rs.getInt("count");
            return count > 0;
        }
        return false;
    }

    public boolean isBookInWl(int user_Id, int book_Id) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS count FROM wishlist WHERE user_id = ? AND book_id = ?;");

        stmt.setInt(1, user_Id);
        stmt.setInt(2, book_Id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            int count = rs.getInt("count");
            return count > 0;
        }
        return false;
    }

    public ResultSet AdminProfile(String userEmail) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT name,email,contact,address1 FROM users where email= ?; ");
        stmt.setString(1, userEmail);
        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public int totalwishlistcount() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS total FROM wishlist");
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }

        return 0;
    }

    public int totalissuedbookcount(String userEmail) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS total FROM bookissued where user_email =?");
        stmt.setString(1, userEmail);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }

        return 0;
    }

    public int issuehistory(String userEmail) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS total FROM bookissuedhistory where user_email =?");
        stmt.setString(1, userEmail);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }

        return 0;
    }

    public int totalorders(String userEmail) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS total FROM orders WHERE user_id = (SELECT user_id FROM users WHERE email = ?)");
        stmt.setString(1, userEmail);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }

        return 0;
    }

    public int IssueBook(int user_id, int book_id, String user_name, String user_Email) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("insert into bookissuerequest(user_id,book_id,user_name,user_Email) values (?,?,?,?);");
        stmt.setInt(1, user_id);
        stmt.setInt(2, book_id);
        stmt.setString(3, user_name);
        stmt.setString(4, user_Email);

        return stmt.executeUpdate();
    }

    public String getUserName(int user_id) throws ClassNotFoundException, SQLException {
        String name = null; // Default value if no email found

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        String sql = "SELECT name,email FROM users WHERE user_id = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, user_id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
        }

        return name;

    }

    public int RenewalBook(int user_id, int book_id, String user_name, String user_Email) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        // Check if the user has already renewed the book three times
        int renewalCount = getRenewalCount(user_id, book_id); // Assume you have a method to retrieve the renewal count

        if (renewalCount >= 3) {
            // User has already renewed the book three times, so prevent further renewal
            return -1; // Return a special value to indicate the limit has been reached
        }

        // Increment the renewal count and insert the renewal request
        PreparedStatement stmt = con.prepareStatement("INSERT INTO bookrenewalrequest(user_id, book_id, user_name, user_Email, renewal_count) VALUES (?, ?, ?, ?, ?)");
        stmt.setInt(1, user_id);
        stmt.setInt(2, book_id);
        stmt.setString(3, user_name);
        stmt.setString(4, user_Email);
        stmt.setInt(5, renewalCount + 1); // Increment the renewal count

        return stmt.executeUpdate();
    }

    public int getRenewalCount(int user_id, int book_id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("SELECT renewal_count FROM bookissued WHERE user_id = ? AND book_id = ?");
        stmt.setInt(1, user_id);
        stmt.setInt(2, book_id);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("renewal_count");
        }
        return 0; // Return 0 if the count is not found (initial renewal)
    }

    public String getUserEmail(int user_id) throws ClassNotFoundException, SQLException {
        String email = null; // Default value if no email found

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        String sql = "SELECT email FROM users WHERE user_id = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, user_id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            email = rs.getString("email");
        }

        return email;
    }

    public int getUSerIdByEmail(String userEmail) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("SELECT user_id FROM users WHERE email = ?");
        stmt.setString(1, userEmail);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("user_id"); // Corrected column name here
        }

        return 0;
    }

    public boolean checkBookIssued(int user_id, int book_id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(book_id) AS count FROM bookissued WHERE user_id = ? AND book_id = ?;");

        stmt.setInt(1, user_id);
        stmt.setInt(2, book_id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            int count = rs.getInt("count");
            return count > 0;
        }
        return false;
    }

    public int decreasequantity(int book_id) throws SQLException {
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("update book_stock set quantity = quantity - 1 where book_id = ?;");

        stmt.setInt(1, book_id);
        int status = stmt.executeUpdate();

        return status;
    }

    public int alreadyissued(int book_id, String user_Email) throws SQLException {
        int status;

        Connection con = DriverManager.getConnection(url, user, password);
//
        PreparedStatement stmt = con.prepareStatement("select count(user_email) as count from  bookissued where user_email=? and book_id=?;");
//
        stmt.setString(1, user_Email);
        stmt.setInt(2, book_id);
        ResultSet rs = stmt.executeQuery();
        status = 0;
        if (rs.next()) {
            status = rs.getInt("count");
        }
        return status;

    }

    public int getAvailableQuantity(int book_id) throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement stmt = con.prepareStatement("SELECT quantity FROM book_stock WHERE book_id = ?");
        stmt.setInt(1, book_id);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("quantity"); // Corrected column name here
        }

        return 0;
    }

//    public int checkBookIssueRequest(int book_id, int user_id) throws ClassNotFoundException, SQLException {
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        Connection con = DriverManager.getConnection(url, user, password);
//
//        PreparedStatement stmt = con.prepareStatement("SELECT user_id,user_id FROM bookissuerequest WHERE book_id = ? and user_id=?");
//        stmt.setInt(1, book_id);
//        stmt.setInt(2, user_id);
//
//        ResultSet rs = stmt.executeQuery();
//        if (rs.next()) {
//            return rs.getInt("user_id");
//           
//        }
//
//        return 0;
//    }
    public int returnbook(int book_id, int user_id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("Delete from  bookissued WHERE user_id = ? AND book_id = ?;");

        stmt.setInt(1, user_id);
        stmt.setInt(2, book_id);
        return stmt.executeUpdate();

    }

    public boolean checkBookInIssueRequest(int book_id, int user_id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(book_id) AS count FROM bookissuerequest WHERE user_id = ? AND book_id = ?;");

        stmt.setInt(1, user_id);
        stmt.setInt(2, book_id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            int count = rs.getInt("count");
            return count > 0;
        }
        return false;
    }

    public boolean checkBookInIssued(int book_id, int user_id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(book_id) AS count FROM bookissued WHERE user_id = ? AND book_id = ?;");

        stmt.setInt(1, user_id);
        stmt.setInt(2, book_id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            int count = rs.getInt("count");
            return count > 0;
        }
        return false;
    }

    public int duebooks(String userEmail) {
        int dueBookCount = 0;

        try {
            Connection con = DriverManager.getConnection(url, user, password);
            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS total_due_books FROM bookissued bi JOIN users u ON bi.user_id = u.user_id WHERE u.email = ? AND bi.return_date < CURDATE()");
            stmt.setString(1, userEmail);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                dueBookCount = rs.getInt("total_due_books");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();  // Handle any exceptions or errors here
        }
        return dueBookCount;
    }

    public int profileupdate(String updatedName, String updatedEmail, String updatedPhno, String address1, String address2) throws SQLException {
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("UPDATE users SET name = ?, contact = ?,address1=?,address2=? WHERE email = ?");

        stmt.setString(1, updatedName);
        stmt.setString(2, updatedPhno);
        stmt.setString(3, address1);
        stmt.setString(4, address2);
        stmt.setString(5, updatedEmail);

        int status = stmt.executeUpdate();

        return status;
    }

    public ResultSet favAuthor(String userEmail) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT a.author_id, a.author_name, "
                + "CONCAT(SUBSTRING_INDEX(a.about, ' ', 10), '...') AS short_about, "
                + "a.img, COUNT(*) AS author_count "
                + "FROM book_stock b "
                + "JOIN bookissuedhistory bih ON b.book_id = bih.book_id "
                + "JOIN users u ON bih.user_id = u.user_id "
                + "JOIN authors a ON b.author_id = a.author_id "
                + "WHERE u.email = ? "
                + "GROUP BY a.author_id, a.author_name, short_about, a.img "
                + "ORDER BY author_count DESC");
        stmt.setString(1, userEmail);
        ResultSet rs = stmt.executeQuery();

        return rs;
    }

    public ResultSet topbooks() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT book_name, book_img, book_price "
                + "FROM book_stock "
                + "ORDER BY RAND()");

        ResultSet rs = stmt.executeQuery();

        return rs;
    }
public ResultSet IssuedBookHistory(String userEmail) throws ClassNotFoundException, SQLException {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("SELECT ib.request_date,ib.return_date ,b.book_name,b.book_id ,b.book_img, b.book_price " +
                     "FROM bookissuedhistory ib " +
                     "JOIN book_stock b ON ib.book_id = b.book_id " +
                     "JOIN users u ON ib.user_id = u.user_id " +
                     "WHERE u.email = ?");
        stmt.setString(1, userEmail);

        // Log the SQL query being executed
        System.out.println("Executing SQL query: " + stmt.toString());

        ResultSet rs = stmt.executeQuery();
        return rs;
    } catch (ClassNotFoundException | SQLException e) {
        // Log or print the exception message
        e.printStackTrace();
        throw e; // Rethrow the exception to be handled by the caller
    }
}


}
