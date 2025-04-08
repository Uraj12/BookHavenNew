<%-- 
    Document   : BookFragment
    Created on : 25-Feb-2024, 12:06:11 am
    Author     : ajay
--%>

<%@page import="com.projectx.Books.Service.EcomService"%>
<%@page import="com.projectx.Books.Service.BookService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
    <div class="iq-card-body">  
        <div class="row" id="category-book">       

            <%
                BookService CFservice = new BookService();
                ResultSet rs = CFservice.viewBooks();

                while (rs.next()) {

            %>

            <%        EcomService CEFService = new EcomService();
                int user_id = 1;
                boolean isBookInCart = CEFService.isBookInCart(user_id, rs.getInt("book_id"));
                boolean isBookInWl = CEFService.isBookInWl(user_id, rs.getInt("book_id"));
            %>
             <%@include file="singleBook.jsp"%>
            <%
                }
            %> 
        </div>
    </div>