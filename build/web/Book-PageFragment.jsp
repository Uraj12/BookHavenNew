<%-- 
    Document   : Book-PageFragment
    Created on : 01-Mar-2024, 3:25:42 pm
    Author     : ajay
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.projectx.Books.Service.EcomService"%>
<%@page import="com.projectx.Books.Service.BookService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="iq-card iq-card-block iq-card-stretch iq-card-height">
    <div class="iq-card-header d-flex justify-content-between align-items-center">
        <h4 class="card-title mb-0">Books Description</h4>
    </div>
    <%
        String category = null;
        int thisBook = 0;
        int BookId = Integer.parseInt(request.getParameter("id"));
        BookService bookService = new BookService();
        ResultSet bookrs = bookService.viewBooks();

        while (bookrs.next()) {
            if (bookrs.getInt("book_id") == BookId) {
                category = bookrs.getString("category");
                thisBook = bookrs.getInt("book_id");
    %>

    <%        EcomService CEFService = new EcomService();
     String useremail = (String) session.getAttribute("email");
     System.out.println("useremail"+useremail);
        int user_id = CEFService.getUSerIdByEmail(useremail);
         
        boolean isBookInCart = CEFService.isBookInCart(user_id, bookrs.getInt("book_id"));
        boolean isBookInWl = CEFService.isBookInWl(user_id, bookrs.getInt("book_id"));
    %>
    <div class="iq-card-body pb-0">
        <div class="description-contens align-items-top row">
            <div class="col-md-6">
                <div class="iq-card-transparent iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-body p-0">
                        <div class="row align-items-center">
                            <div class="col-3">
                                <ul id="description-slider-nav" class="list-inline p-0 m-0  d-flex align-items-center">
                                    <li>
                                        <a href="javascript:void(0);">
                                            <img style="width:118px; height:180px;" src="<%=bookrs.getString("book_img")%>" class="img-fluid rounded w-100" alt="">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <img style="width:118px; height:180px;" src="<%=bookrs.getString("book_img")%>" class="img-fluid rounded w-100" alt="">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <img style="width:118px; height:180px;" src="<%=bookrs.getString("book_img")%>" class="img-fluid rounded w-100" alt="">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <img style="width:118px; height:180px;" src="<%=bookrs.getString("book_img")%>" class="img-fluid rounded w-100" alt="">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <img style="width:118px; height:180px;" src="<%=bookrs.getString("book_img")%>" class="img-fluid rounded w-100" alt="">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <img style="width:118px; height:190px;" src="<%=bookrs.getString("book_img")%>" class="img-fluid rounded w-100" alt="">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-9">
                                <ul id="description-slider" class="list-inline p-0 m-0  d-flex align-items-center">
                                   
                                    <li>
                                        <a href="javascript:void(0);">
                                            <img style="width:421px; height:559px;" src="<%=bookrs.getString("book_img")%>" class="img-fluid w-100 rounded" alt="">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="iq-card-transparent iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-body p-0">
                        <input type="hidden" value="<%=BookId%>" id="book_id">
                        <div class="text-primary mb-4"><span class="text-body"><%=bookrs.getString("category")%></span></div>
                        <h3 class="mb-3"><%=bookrs.getString("book_name")%></h3>
                        <div class="price d-flex align-items-center font-weight-500 mb-2">
                            <%
                                if (bookrs.getBoolean("has_offer")) {
                            %>
                            <span class="font-size-20 pr-2 old-price">$<%=bookrs.getInt("book_price")%></span>
                            <span class="font-size-24 text-dark">$48</span>
                            <%
                            } else {%>
                            <span class="font-size-24 text-dark">$<%=bookrs.getInt("book_price")%></span>

                            <%
                                }
                            %>

                        </div>
                        <div class="mb-3 d-block">
                            <span class="font-size-20 text-warning">
                                <i class="fa fa-star mr-1"></i>
                                <i class="fa fa-star mr-1"></i>
                                <i class="fa fa-star mr-1"></i>
                                <i class="fa fa-star mr-1"></i>
                                <i class="fa fa-star"></i>
                            </span>
                        </div>
                        <span class="text-dark mb-4 pb-4 iq-border-bottom d-block"><%=bookrs.getString("description")%></span>
                        <div class="text-primary mb-4">Author: <span class="text-body"><%=bookrs.getString("author_name")%></span></div>
                        <div class="mb-4 d-flex align-items-center">  
                            <%
                                if (isBookInCart) {
                            %>
                            <a href="#" class="btn btn-primary view-more mr-2" onclick="updateSingleCart(<%=user_id%>, '<%=bookrs.getInt("book_id")%>')">In Cart</a>
                            <%
                                }else{
                            %>
                            <a href="#" class="btn btn-primary view-more mr-2" onclick="updateSingleCart(<%=user_id%>, '<%=bookrs.getInt("book_id")%>')">Add to Cart</a>
                            <%
                                } 
                            %>     
                            <a href="#" class="btn btn-primary view-more mr-2">Buy Now</a>
                            <a href="#" class="btn btn-primary view-more mr-2" onclick="IssueBook(<%=user_id%> ,'<%=bookrs.getInt("book_id")%>')" id="issue" >Issue Now</a>
                             <a href="#" class="btn btn-primary view-more mr-2" onclick="RenewalBook(<%=user_id%> ,'<%=bookrs.getInt("book_id")%>')" >Renew Now</a>
                                                    <a href="#" class="btn btn-primary view-more mr-2" onclick="ReturnBook(<%=user_id%> ,'<%=bookrs.getInt("book_id")%>')" >Return book</a>
                        </div>
                        <div class="mb-3">
                            <%
                            if (isBookInWl) {
                            %>
                            <a href="javascript:void();" class="text-body text-center"><span class="avatar-30 rounded-circle bg-primary d-inline-block mr-2"><i class="ri-heart-line" onclick="updateSingleWl(<%=user_id%>, '<%=bookrs.getInt("book_id")%>')"></i></span><span>In Wishlist</span></a>
                            <%
                                }else{
                            %>
                            <a href="javascript:void();" class="text-body text-center"><span class="avatar-30 rounded-circle bg-primary d-inline-block mr-2"><i class="ri-heart-fill" onclick="updateSingleWl(<%=user_id%>, '<%=bookrs.getInt("book_id")%>')"></i></span><span>Add to Wishlist</span></a>
                            <%
                                }
                            %>
                            
                            
                            
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>
    
</div>
    
    
    <script>
      



    </script>