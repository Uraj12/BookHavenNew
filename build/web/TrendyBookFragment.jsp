<%-- 
    Document   : SimilarBookFragment
    Created on : 28-Feb-2024, 7:33:35 pm
    Author     : ajay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projectx.Books.Service.EcomService"%>
<%@page import="com.projectx.Books.Service.BookService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>

<div class="col-lg-12">
    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
        <div class="iq-card-header d-flex justify-content-between align-items-center position-relative mb-0 trendy-detail">
            <div class="iq-header-title">
                <h4 class="card-title mb-0">Trendy Books</h4>
            </div>
            <div class="iq-card-header-toolbar d-flex align-items-center">
                <a href="category.jsp" class="btn btn-sm btn-primary view-more">View More</a>
            </div>
        </div>
        <div class="iq-card-body trendy-contens">
            <ul id="trendy-slider" class="list-inline p-0 mb-0 row">
                <%
                     BookService TrendyService = new BookService();
                    ResultSet TrendyRs = TrendyService.viewBooks();
                    while (TrendyRs.next()) {
                        if (TrendyRs.getBoolean("on_trend")) {
                         EcomService ETrendy = new EcomService();
                            int user_id = 1;
                            boolean isBookInCart = ETrendy.isBookInCart(user_id, TrendyRs.getInt("book_id"));
                            boolean isBookInWl = ETrendy.isBookInWl(user_id, TrendyRs.getInt("book_id"));
                

                %>
                <li class="col-md-3">
                    <div class="d-flex align-items-center">
                        <div class="col-5 p-0 position-relative image-overlap-shadow">
                            <a href="javascript:void();"><img class="img-fluid rounded w-100" style="width:113px; height:159px;" src="<%=TrendyRs.getString("book_img")%>" alt=""></a>
                            <div class="view-book">
                                <a href="#" onclick="BookLanding('<%=TrendyRs.getInt("book_id")%>')" class="btn btn-sm btn-white">View Book</a>
                            </div>
                        </div>
                        <div class="col-7">
                            <div class="mb-2">
                                <h6 class="mb-1"><%=TrendyRs.getString("book_name")%></h6>
                                <p class="font-size-13 line-height mb-1"><%=TrendyRs.getString("author_name")%></p>
                                <div class="d-block">
                                    <span class="font-size-13 text-warning">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </span>
                                </div>
                            </div>
                           <div class="price d-flex align-items-center">
                                <%
                                    if (TrendyRs.getBoolean("has_offer")) {
                                %>
                                <span class="pr-1 old-price">$100</span>
                                <%
                                    }
                                %>
                                <h6><b>$<%=TrendyRs.getInt("book_price")%></b></h6>
                            </div>
                            <div class="iq-product-action">
                                <%
                                    if (isBookInCart) {
                                %>
                                <a href="javascript:void();"><i class="ri-shopping-cart-2-fill text-primary" onclick="UpdateCartItem(<%=user_id%>, '<%=TrendyRs.getInt("book_id")%>')"></i></a>
                                    <%
                                    } else {
                                    %>
                                <a href="javascript:void();"><i class="ri-shopping-cart-2-line text-primary" onclick="UpdateCartItem(<%=user_id%>, '<%=TrendyRs.getInt("book_id")%>')"></i></a>
                                    <%
                                        }
                                        if (isBookInWl) {
                                    %>
                                <a href="javascript:void();" class="ml-2"><i class="ri-heart-fill text-danger" onclick="UpdateWlItem(<%=user_id%>, '<%=TrendyRs.getInt("book_id")%>')"></i></a>
                                    <%
                                    } else {
                                    %>
                                <a href="javascript:void();" class="ml-2"><i class="ri-heart-line text-danger" onclick="UpdateWlItem(<%=user_id%>, '<%=TrendyRs.getInt("book_id")%>')"></i></a>
                                    <%
                                        }
                                    %>
                            </div>  
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