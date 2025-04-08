<%@ page import="java.sql.ResultSet" %>
<%@ page import="Dashboard.Service.AdminDashboardService" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="Css.jsp" %>
        <title>Books</title>
    </head>
    <body>
        
        <!-- Loader Start -->
        <div id="loading">
            <div id="loading-center">
            </div>
        </div>
        <!-- Loader END -->
        <!-- Wrapper Start -->
        <div class="wrapper">
            <!-- Sidebar Start -->
            <%@ include file="Navs.jsp" %>
            <!-- Sidebar End -->
            <!-- Page Content Start -->
            <div id="content-page" class="content-page">
                <div class="container-fluid">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <h4 class="card-title">Book Lists</h4>
                        </div>
                        <div class="col-md-6 text-right">
                            <button onclick="adminTabLoader('addBook')" class="btn btn-primary ml-auto">Add New book</button>
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <!-- Search form -->
                            <form method="GET" class="input-group">
                                <input type="text" class="form-control" id="searchInput" name="search" placeholder="Enter book name, author name, or category">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </div>
                            </form>
                            <!-- Search form end -->
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="data-tables table table-striped table-bordered" style="width:70%">
                            <thead>
                                <tr>
                                        <th style="width: 3%;">No</th>
                                        <th style="width: 12%;">Book Image</th>
                                        <th style="width: 15%;">Book Name</th>
                                        <th style="width: 15%;">Book Catrgory</th>
                                        <th style="width: 15%;">Book Author</th>
                                        <th style="width: 18%;">Book Description</th>
                                        <th style="width: 7%;">Book Price</th>
                                        <th style="width: 7%;">Book pdf</th>
                                        <th style="width: 15%;">Action</th>
                                    </tr>
                            </thead>
                            <tbody>
                                <%-- Pagination logic starts here --%>
                                <%
                                    int pageSize = 5; // Number of books per page
                                    int currentPage = 1; // Default page number
                                    if (request.getParameter("page") != null) {
                                        currentPage = Integer.parseInt(request.getParameter("page"));
                                    }
                                    int start = (currentPage - 1) * pageSize; // Calculate starting index

                                    String searchQuery = request.getParameter("search");
                                    AdminDashboardService service = new AdminDashboardService();
                                    ResultSet rs;

                                    if (searchQuery != null && !searchQuery.isEmpty()) {
                                        rs = service.searchBooks(searchQuery, start, pageSize);
                                    } else {
                                        rs = service.getViewBookPaginated(start, pageSize);
                                    }

                                    if (!rs.next()) { // Check if ResultSet is empty
                                %>
                                <tr>
                                    <td colspan="8" style="text-align: center;">No data found</td>
                                </tr>
                                <% } else { // Display book data if ResultSet is not empty
                                    do {
                                %>
                                <tr>
                                    <td><%=rs.getInt("book_id")%></td>
                                    <td>
                                        <div>
                                            <img class="img-fluid rounded" src="<%=rs.getString("book_img")%>" alt="" style="width: 80px; height: 120px;">

                                        </div>
                                    </td>
                                    <td><%=rs.getString("book_name")%></td>
                                    <td><%=rs.getString("category_name")%></td>
                                    <td><%=rs.getString("author_name")%></td>
                                    <td>
                                        <p class="mb-0"><%=rs.getString("description")%></p>
                                    </td>
                                    <td><%=rs.getString("book_price")%></td>
                                    <td>
                                        <div class="flex align-items-center list-user-action">
                                            <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" onclick="editBook(this)" bookId="<%=rs.getInt("book_id")%>"><i class="ri-pencil-line"></i></a>
                                            <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" onclick="deleteBook(this)" bookId="<%=rs.getInt("book_id")%>"><i class="ri-delete-bin-line"></i></a>
                                            <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="image" onclick="changeImage(this, <%=rs.getInt("book_id")%>)"><i class="ri-image-2-line"></i></a>
                                        </div>
                                    </td>
                                </tr>
                                <% } while (rs.next()); // Continue fetching and displaying book data
                                    } // End of ResultSet check
                                %>
                            </tbody>
                        </table>
                        <%-- Pagination navigation links --%>
                        <%
                            int totalBooks = service.getTotalBooksCount();
                            int totalPages = (int) Math.ceil((double) totalBooks / pageSize);
                        %>
                        <ul class="pagination">
                            <li class="page-item <%= currentPage == 1 ? "disabled" : ""%>">
                                <a class="page-link" href="?page=<%= currentPage - 1%>">Previous</a>
                            </li>

                            <%-- Calculate the range of page numbers to display --%>
                            <%
                                int startPage = Math.max(1, currentPage - 2);
                                int endPage = Math.min(totalPages, startPage + 4);
                            %>

                            <%-- Display page numbers within the specified range --%>
                            <% for (int i = startPage; i <= endPage; i++) {%>
                            <li class="page-item <%= currentPage == i ? "active" : ""%>">
                                <a class="page-link" href="?page=<%= i%>"><%= i%></a>
                            </li>
                            <% }%>

                            <li class="page-item <%= currentPage == totalPages ? "disabled" : ""%>">
                                <a class="page-link" href="?page=<%= currentPage + 1%>">Next</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Content End -->
    </div>
    <!-- Wrapper END -->
    <div id="statusajax"></div>
    <%@ include file="Footer.jsp" %>
    <%@ include file="Js.jsp" %>


</body>
</html>
