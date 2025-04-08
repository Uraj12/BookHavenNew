
<%@page import="com.projectx.Books.Service.BookService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>BookHaven</title>
        <%@include file="Css.jsp" %>
    </head>
    <body>
           <%
            if(session.getAttribute("email") == null ){
                response.sendRedirect("login.jsp");
            }
        %>
        <!-- loader Start -->
        <div id="loading">
            <div id="loading-center">
            </div>
        </div>
        <!-- loader END -->
        <!-- Wrapper Start -->
        <div class="wrapper">
          <div id="nav">
            <%@include file="Navs.jsp" %>
            </div>
            <!-- Page Content  -->
            <div id="content-page" class="content-page">
                <div id="refresh-wl">
                <%@include file="WishlistFragment.jsp" %>
                </div>
            </div>
        </div>
        <!-- Wrapper END -->
        <!-- Footer -->
        <%@include file="Footer.jsp" %>
        <!-- Footer END -->

        <%@include file="Js.jsp" %>
    </body>
</html>