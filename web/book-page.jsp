
<%@page import="com.projectx.Books.Service.BookService"%>
<%@page import="com.projectx.Books.Service.EcomService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
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
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12" id="refresh-book-page">
                            
                            <%@include file="Book-PageFragment.jsp" %>
                        </div>

                        <%@include file="SimilarBooksFragment.jsp" %>

                        <%@include file="TrendyBookFragment.jsp" %>

                        <%@include file="FavoriteBookFragment.jsp" %>
                    </div>
                </div>
            </div>
        </div>
         <div type="hidden" id="quantity"></div>
           <div type="hidden" id="checkRequest"></div>
        <div type="hidden" id="action"></div>
        <div type="hidden" id="bookquantity"></div>
        <div type="hidden" id="renewcount">
            <div type="hidden" id="bookreturn">
        </div>
        <!-- Footer -->
        <%@include file="Footer.jsp" %>
        <!-- Footer END -->

        <!-- color-customizer END -->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <%@include file="Js.jsp" %>
    </body>
</html>