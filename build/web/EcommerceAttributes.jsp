<%-- 
    Document   : Ecommerce
    Created on : 28-Feb-2024, 8:03:38 pm
    Author     : ajay
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>


<%
    ResultSet rs = null;
    int count = 0;
%>

<c:if test="${process eq 'AddToCart' or 
              process eq 'quantityChange'or 
              process eq 'deleteCartItem'or 
              process eq 'deleteWlItem' or
              process eq 'AddToWl' or
              process eq 'IssueBook'or
              process eq 'RenewalBook'or
              process eq 'bookreturn'or
              process eq 'updateUserProfile'or
      process eq 'logout'}">
      <input type="hidden" value="${status}" id="status"/>
</c:if>