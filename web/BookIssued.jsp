<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectx.Books.Service.EcomService"%>
<%@page import="com.projectx.Books.Service.BookService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<div class="col-lg-12">
    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
        <div class="iq-card-header d-flex justify-content-between align-items-center position-relative mb-0 similar-detail">
            <div class="iq-header-title">
                <h4 class="card-title mb-0">Books Issued</h4>
            </div>
            <div class="iq-card-header-toolbar d-flex align-items-center">
                <a href="category.html" class="btn btn-sm btn-primary view-more">View More</a>
            </div>
        </div>                         
        <div class="iq-card-body similar-contens">
            <ul id="similar-slider" class="list-inline p-0 mb-0 row">
                <% 
                    EcomService CEFService = new EcomService();
                    BookService offerService1 = new BookService();
                    String useremail = (String) session.getAttribute("email");
                    int userid = CEFService.getUSerIdByEmail(useremail);
                    ResultSet issued = offerService1.viewIssuedBooks(userid);

                    // Check if the ResultSet is not null and has at least one row
                    if (issued != null && issued.next()) {
                     

                        do {
                            String returnDateString = issued.getString("return_date");
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            Date returnDate = dateFormat.parse(returnDateString);
                            Date currentDate = new Date();

                            // Compare returnDate with currentDate directly to determine if the book is overdue
                            String redClass = (returnDate.before(currentDate)) ? "text-danger" : "";
                            String overdueMessage = (returnDate.before(currentDate)) ? "Book overdue" : "";
                %>
                <li class="col-md-3">
                    <div class="d-flex align-items-center">
                        <div class="col-5 p-0 position-relative image-overlap-shadow">
                            <a href="javascript:void();"><img class="img-fluid rounded w-100" style="width:113px; height:159px;" src="<%=issued.getString("book_img")%>" alt=""></a>
                            <div class="view-book">
                                <a href="#" onclick="BookLanding('<%=issued.getInt("book_id")%>')" class="btn btn-sm btn-white">View Book</a>
                            </div>
                        </div>
                        <div class="col-7">
                            <div class="mb-2">
                                <h6 class="mb-1  <%=redClass%>" ><%=issued.getString("book_name")%></h6>
                                <p class="font-size-13 line-height mb-1"><%=issued.getString("author_name")%></p>
                                <div class="d-block">
                                    <span class="font-size-13 text-warning">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </span>
                                    <p class="font-size-13 line-height mb-1 <%=redClass%>"> Return Date <%=issued.getString("return_date")%></p>
                                  
                                      <p class="font-size-13 line-height mb-1 <%=redClass%>"><%= overdueMessage %></p>
                                </div>
                            </div>
                            <div class="price d-flex align-items-center">
                                <%
                                    if (issued.getBoolean("has_offer")) {
                                %>
                                <span class="pr-1 old-price">$100</span>
                                <%
                                    }
                                %>
                                <h6><b>$<%=issued.getInt("book_price")%></b></h6>
                            </div>
                        </div>
                    </div>
                </li>
                <% 
                        } while (issued.next());
                    } else {
                %>
                <li>No books issued</li>
                <% 
                    }
                %>
            </ul>
        </div>
    </div>
</div>
