<%-- 
    Document   : SimilarBooksFragment
    Created on : 29-Feb-2024, 9:04:37 pm
    Author     : ajay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-lg-12">
    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
        <div class="iq-card-header d-flex justify-content-between align-items-center position-relative">
            <div class="iq-header-title">
                <h4 class="card-title mb-0">Similar Books</h4>
            </div>
            <div class="iq-card-header-toolbar d-flex align-items-center">
                <a href="category.jsp" class="btn btn-sm btn-primary view-more">View More</a>
            </div>
        </div>
        <div class="iq-card-body single-similar-contens">
            <ul id="single-similar-slider" class="list-inline p-0 mb-0 row">
                <%
                    ResultSet similarRs = bookService.viewBooks();
                    while (similarRs.next()) {
                        if (similarRs.getString("category").equals(category)) {
                            if (similarRs.getInt("book_id") == thisBook) {
                                continue;
                            }

                %>
                <li class="col-md-3">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <div class="position-relative image-overlap-shadow">
                                <a href="javascript:void();"><img class="img-fluid rounded w-100" src="<%=similarRs.getString("book_img")%>" alt=""></a>
                                <div class="view-book">
                                    <a href="book-page.jsp" onclick="BookLanding('<%=similarRs.getInt("book_id")%>')" class="btn btn-sm btn-white">View Book</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-7 pl-0">
                            <h6 class="mb-2"><%=similarRs.getString("book_name")%></h6>
                            <p class="text-body">Author : <%=similarRs.getString("author_name")%></p>
                            <a href="book-page.jsp#" class="text-dark" tabindex="-1">Read Now<i class="ri-arrow-right-s-line"></i></a>
                        </div>
                    </div>
                </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
    </div>
</div>
