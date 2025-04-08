<%-- 
    Document   : index
    Created on : 24-Feb-2024, 12:28:24 pm
    Author     : ajay
--%>
<%@page import="com.projectx.Books.Service.BookService"%>
<%@page import="com.projectx.Books.Service.EcomService"%>
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
        <!--         loader Start -->
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
                        <div class="col-lg-12">
                            <div class="iq-card-transparent iq-card-block iq-card-stretch iq-card-height rounded">
                                <div class="newrealease-contens">
                                    <ul id="newrealease-slider" class="list-inline p-0 m-0 d-flex align-items-center">
                                        <%                                            int latest = 0;
                                            BookService bookService = new BookService();

                                            ResultSet Rrs = bookService.latestBooks();

                                            while (Rrs.next() && latest < 8) {
                                        %>

                                        <li class="item">
                                            <a href="javascript:void(0);">
                                                <img style="width:196px;height:276px;" src="<%=Rrs.getString("book_img")%>" class="img-fluid w-100 rounded" alt="">

                                            </a>                              
                                        </li>
                                        <%
                                                latest++;
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                                    
                              
                        <%@include file="BooksWithOffer.jsp" %>
                      <%@include file="BookIssued.jsp" %> 
                        <%@include file="TrendyBookFragment.jsp" %>


                        <div class="col-lg-12">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-header d-flex justify-content-between align-items-center position-relative">
                                    <div class="iq-header-title">
                                        <h4 class="card-title mb-0">Browse Books</h4>
                                    </div>
                                    <div class="iq-card-header-toolbar d-flex align-items-center">                              
                                        <a href="category.jsp" class="btn btn-sm btn-primary view-more">View More</a>
                                    </div>
                                </div> 

                                

                                <div class="iq-card-body" id="refresh-index">  


                                    <%@include file="BookFragment.jsp" %>


                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height ">
                                <div class="iq-card-header d-flex justify-content-between mb-0">
                                    <div class="iq-header-title">
                                        <h4 class="card-title">BestSeller</h4>
                                    </div>
                                    <div class="iq-card-header-toolbar d-flex align-items-center">                              
                                        <a href="category.jsp" class="btn btn-sm btn-primary view-more">View All</a>
                                    </div>
                                </div>
                                <%                                    int featured = 0;
                                    ResultSet Frs = bookService.viewBooks();

                                    while (Frs.next() && featured < 1) {
                                        if (Frs.getBoolean("is_featured")) {
                                %>
                                <div class="iq-card-body " >

                                    <div class="row align-items-center">

                                        <div class="col-sm-5 pr-0">
                                            <a href="javascript:void();"><img class="img-fluid rounded w-100" src="<%=Frs.getString("book_img")%>" style="width:227px; height:302px;"  alt=""></a>
                                        </div>
                                        <div class="col-sm-7 mt-3 mt-sm-0">
                                            <h4 class="mb-2"><%=Frs.getString("book_name")%></h4>
                                            <p class="mb-2">Author: <%=Frs.getString("author_name")%></p>
                                            <div class="mb-2 d-block">
                                                <span class="font-size-12 text-warning">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </span>
                                            </div>
                                            <span class="text-dark mb-3 d-block webkit"><%=Frs.getString("description")%></span>
                                            <button type="submit" class="btn btn-primary learn-more">Learn More</button>
                                        </div>

                                    </div>

                                </div>
                                <%
                                            featured++;
                                        }
                                    }
                                %>
                            </div>
                        </div>

                            
                        <div class="col-lg-6">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-header d-flex justify-content-between mb-0">
                                    <div class="iq-header-title">
                                        <h4 class="card-title">Featured Authors</h4>
                                    </div>

                                </div>
                                <div class="iq-card-body">
                                    <ul class="list-inline row mb-0 align-items-center iq-scrollable-block">
                                        <%
                                            int featuredWriter = 0;
                                            ResultSet FWriterRs = bookService.featuredWriter();

                                            while (FWriterRs.next() && featuredWriter < 12) {
                                        %>
                                        <li class="col-sm-6 d-flex mb-3 align-items-center">
                                            <div class="icon iq-icon-box mr-3">
                                                <a href="javascript:void();"><img class="img-fluid avatar-60 rounded-circle" src="<%=FWriterRs.getString("img")%>" alt=""></a>
                                            </div>
                                            <div class="mt-1">
                                                <h6><%=FWriterRs.getString("author_name")%></h6>
                                                <p class="mb-0 text-primary">Publish Books: <span class="text-body"><%=FWriterRs.getString("total_books")%></span></p>
                                            </div>
                                        </li>
                                        <%
                                                featuredWriter++;
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                        </div>



                        <%@include file="FavoriteBookFragment.jsp" %>

                    </div>
                </div>
            </div>
        </div>

 <%@include file="chatbot.jsp" %>
        <!-- Wrapper END -->
        <!-- Footer -->
        <%@include file="Footer.jsp" %>
        <!-- Footer END -->

        <!-- color-customizer END -->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <%@include file="Js.jsp" %>
        
    </body>
    
</html>