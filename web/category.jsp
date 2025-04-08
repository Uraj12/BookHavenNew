                                                            
<%@page import="com.projectx.Books.Service.BookService"%>
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
                            <div class="iq-card-transparent mb-0">
                                <div class="d-block text-center">
                                    <h2 class="mb-3">Search by Book Name</h2>    
                                    <div class="w-100 iq-search-filter">
                                        <ul class="list-inline p-0 m-0 row justify-content-center search-menu-options">
                                            <li class="search-menu-opt">
                                                <div class="iq-dropdown">
                                                    <div class="form-group mb-0">
                                                        <select onChange="Filter()" class="form-control form-search-control bg-white border-0" id="exampleFormControlSelect1">
                                                            <option selected="">All Books</option>
                                                            <option>New Arrivals</option>
                                                            <option>Featured Books</option>
                                                            <option>Books with offer</option>
                                                            <option>Trendy Books</option>
                                                            <option disabled></option>

                                                            <%  
                                                                BookService bookservice = new BookService();
                                                                ResultSet GenreList = bookservice.viewGenre();
                                                                while (GenreList.next()) {
                                                            %>
                                                                <option><%=GenreList.getString("category")%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="search-menu-opt">
                                                <div class="iq-dropdown">
                                                    <div class="form-group mb-0">
                                                        <select onChange="Filter()" class="form-control form-search-control bg-white border-0" id="exampleFormControlSelect2">

                                                            <option selected="">Price</option>
                                                            <option>Below $20</option>
                                                            <option>$20 - $30</option>
                                                            <option>$30 - $60</option>
                                                            <option>$60 - $100</option>
                                                            <option>$100 - $150</option>
                                                            <option>above $150</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="search-menu-opt">
                                                <div class="iq-dropdown">
                                                    <div class="form-group mb-0">
                                                        <select onChange="Filter()" class="form-control form-search-control bg-white border-0" id="exampleFormControlSelect3">
                                                            <option selected="">Year</option>
                                                            <%
                                                                ResultSet YearList = bookservice.viewYear();
                                                                while (YearList.next()) {
                                                                    if (YearList.getInt("publish_year") == 0) {
                                                            %>
                                                            <option>Undefined</option>
                                                            <%
                                                            } else {
                                                            %>
                                                            <option><%=YearList.getInt("publish_year")%></option>
                                                            <%
                                                                    }
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="search-menu-opt">
                                                <div class="iq-dropdown">
                                                    <div class="form-group mb-0">
                                                        <select onChange="Filter()" class="form-control form-search-control bg-white border-0" id="exampleFormControlSelect4">
                                                            <option selected="">Authors</option>
                                                            <%
                                                                ResultSet AuthorList = bookservice.viewAuthors();
                                                                while (AuthorList.next()) {
                                                            %>
                                                            <option value="<%=AuthorList.getInt("author_id")%>"><%=AuthorList.getString("author_name")%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="search-menu-opt">
                                                <div class="iq-search-bar search-book d-flex align-items-center">
                                                    <form action="category.html#" class="searchbox">
                                                        <input type="text" class="text search-input" id="search" oninput="searchBooks()" placeholder="search here...">
                                                        <a class="search-link" href="category.html#"><i class="ri-search-line"></i></a>
                                                    </form>
                                                    <button type="submit" class="btn btn-primary search-data ml-2">Search</button>
                                                </div>
                                            </li>
                                        </ul>
                                    </div> 
                                </div>
                            </div>
                                                        
                            <div class="iq-card" id="refresh-category">

                                <%@include file="CategoryFragment.jsp" %>
                            </div>

                        </div>

                        <%@include file="FavoriteBookFragment.jsp" %>
                    </div>
                </div>
            </div>
        </div>
        <!-- Wrapper END -->
        <!-- Footer -->
        <%@include file="Footer.jsp" %>
        <!-- Footer END -->

        <!-- color-customizer END -->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="js/Logic.js"></script>
        <%@include file="Js.jsp" %>
    </body>
</html>