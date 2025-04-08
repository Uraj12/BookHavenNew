<%-- 
    Document   : bookbook
    Created on : 27-Feb-2024, 6:59:03 pm
    Author     : ajay
--%>




<%@page import="com.projectx.Books.Service.EcomService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>


<%
    ResultSet rs = null;
    int count = 0;
%>

<c:if test="${process eq 'Filter'}">
    <%
        rs = (ResultSet) request.getAttribute("result");
        while (rs.next()) {
            EcomService CEFService = new EcomService();
            int user_id = 1;
            boolean isBookInCart = CEFService.isBookInCart(user_id, rs.getInt("book_id"));
            boolean isBookInWl = CEFService.isBookInWl(user_id, rs.getInt("book_id"));
    %>

    <%@include file="singleBook.jsp" %>
    <%                }
    %>

</c:if>
<c:if test="${process eq 'search'}">
    <%
        rs = (ResultSet) request.getAttribute("result");
        while (rs.next()) {
            EcomService CEFService = new EcomService();
            int user_id = 1;
            boolean isBookInCart = CEFService.isBookInCart(user_id, rs.getInt("book_id"));
            boolean isBookInWl = CEFService.isBookInWl(user_id, rs.getInt("book_id"));
    %>

    <%@include file="singleBook.jsp" %>
    <%                }
    %>

</c:if>