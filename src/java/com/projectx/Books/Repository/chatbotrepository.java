package com.projectx.Books.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Repository for interacting with the database to retrieve chatbot responses.
 * Author: shubham
 */
public class chatbotrepository {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/books";   
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "shubham5249";

    // Method to fetch categories from the database
    public List<String> getCategories() {
        List<String> categories = new ArrayList<>();
        String query = "SELECT category_name FROM categories"; // Assuming the column name is 'category_name'

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                categories.add(rs.getString("category_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

    // Method to fetch the best book (most ordered) from the database
    public String getBestBook() {
        String bestBook = "No best book found"; // Default message if no book found
        String query = "SELECT book_title FROM books " +
                       "JOIN orders ON books.book_id = orders.book_id " +
                       "GROUP BY books.book_id ORDER BY COUNT(orders.book_id) DESC LIMIT 1";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            if (rs.next()) {
                bestBook = rs.getString("book_title");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bestBook;
    }

    // Method to respond to price-related queries
    public String getPriceResponse() {
        return "Sure! You can browse our collection of books on the homepage to explore different prices.";
    }

    // Method to determine the chatbot's response based on the user's message
    public String getResponse(String message) {
        if (message.toLowerCase().contains("categories")) {
            List<String> categories = getCategories();
            if (categories.isEmpty()) {
                return "Sorry, we couldn't find any categories at the moment.";
            } else {
                return "We have the following categories: " + String.join(", ", categories);
            }
        } else if (message.toLowerCase().contains("best book") || message.toLowerCase().contains("most ordered")) {
            return "The best book (most ordered) is: " + getBestBook();
        } else if (message.toLowerCase().contains("price")) {
            return getPriceResponse();
        } else {
            return "I'm sorry, I didn't understand that. Can you please rephrase?";
        }
    }
}
