<%-- 
    Document   : singleBook
    Created on : 03-Mar-2024, 8:18:49 pm
    Author     : ajay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-sm-6 col-md-4 col-lg-3">
            <div class="iq-card iq-card-block iq-card-stretch iq-card-height browse-bookcontent">
                <div class="iq-card-body p-0">
                    <div class="d-flex align-items-center">
                        <div class="col-6 p-0 position-relative image-overlap-shadow">
                            <a href="javascript:void();"><img style="width:135px; height:180px;" class="img-fluid rounded w-100" src="<%=rs.getString("book_img")%>" alt=""></a>
                            <div class="view-book">
                                <a href="#" onclick="BookLanding('<%=rs.getInt("book_id")%>')" class="btn btn-sm btn-white">View Book</a>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="mb-2">
                                <h6 class="mb-1"><%=rs.getString("book_name")%></h6>
                                <p class="font-size-13 line-height mb-1"><%=rs.getString("author_name")%></p>
                                <div class="d-block line-height">
                                    <span class="font-size-11 text-warning">
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
                                    if (rs.getBoolean("has_offer")) {
                                %>
                                <span class="pr-1 old-price">$100</span>
                                <%
                                    }
                                %>
                                <h6><b>$<%=rs.getInt("book_price")%></b></h6>
                            </div>
                            <div class="iq-product-action">
                                <%
                                    if (isBookInCart) {
                                %>
                                <a href="javascript:void();"><i class="ri-shopping-cart-2-fill text-primary" onclick="UpdateCartItem(<%=user_id%>, '<%=rs.getInt("book_id")%>')"></i></a>
                                    <%
                                    } else {
                                    %>
                                <a href="javascript:void();"><i class="ri-shopping-cart-2-line text-primary" onclick="UpdateCartItem(<%=user_id%>, '<%=rs.getInt("book_id")%>')"></i></a>
                                    <%
                                        }
                                        if (isBookInWl) {
                                    %>
                                <a href="javascript:void();" class="ml-2"><i class="ri-heart-fill text-danger" onclick="UpdateWlItem(<%=user_id%>, '<%=rs.getInt("book_id")%>')"></i></a>
                                    <%
                                    } else {
                                    %>
                                <a href="javascript:void();" class="ml-2"><i class="ri-heart-line text-danger" onclick="UpdateWlItem(<%=user_id%>, '<%=rs.getInt("book_id")%>')"></i></a>
                                    <%
                                        }
                                    %>
                            </div>                                    
                        </div>
                    </div>
                </div>
            </div>
        </div>