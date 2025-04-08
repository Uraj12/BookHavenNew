<%-- 
    Document   : BookFragment
    Created on : 25-Feb-2024, 12:06:11 am
    Author     : ajay
--%>

<%@page import="com.projectx.Books.Service.EcomService"%>
<%@page import="com.projectx.Books.Service.BookService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>

    <div class="row" >       

        <% int count = 0;
            BookService BFservice = new BookService();
            ResultSet rs = BFservice.viewBooks();

            while (rs.next() && count < 8) {

        %>

        <%        EcomService EFService = new EcomService();
            int user_id = 1;
            boolean isBookInCart = EFService.isBookInCart(user_id, rs.getInt("book_id"));
            boolean isBookInWl = EFService.isBookInWl(user_id, rs.getInt("book_id"));
        %>
        <%@include file="singleBook.jsp" %>
        <%
                count++;
            }
        %> 
    </div>
