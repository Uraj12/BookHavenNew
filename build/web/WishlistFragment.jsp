<%-- 
    Document   : WishlistFragment
    Created on : 29-Feb-2024, 12:13:47 pm
    Author     : ajay
--%>

<%@page import="com.projectx.Books.Service.EcomService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%                int wlCount = 0;
    EcomService WlService = new EcomService();
    ResultSet wlTotalCount = WlService.ViewWlItems();
    //add Session to get user id
    while (wlTotalCount.next()) {
        if (wlTotalCount.getInt("user_id") == 1) {
            wlCount++;
        }
    }
%>
<div class="container-fluid checkout-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="iq-card">
                <div class="iq-card-header d-flex justify-content-between iq-border-bottom mb-0">
                    <div class="iq-header-title">
                        <h4 class="card-title">Wishlist (<%=wlCount%>)</h4>
                    </div>
                    
                </div>
                <div class="iq-card-body">
                    <ul class="list-inline p-0 m-0">
                        <%
                            //add session to get user id
                            int user_id=1;
                            ResultSet WlRs = WlService.ViewWlItems();
                            while (WlRs.next()) {
                                if (WlRs.getInt("user_id") == user_id) {
                        %>
                        <li class="checkout-product">
                            <div class="row align-items-center">
                                <div class="col-sm-3 col-lg-2">
                                    <div class="row align-items-center">
                                        <div class="col-sm-3">
                                            <a href="javascript:void();" class="badge badge-danger"  onclick="DeleteWlItem(<%=user_id%>,'<%=WlRs.getInt("book_id")%>')"><i class="ri-close-fill"></i></a>
                                        </div>
                                        <div class="col-sm-9">
                                            <span class="checkout-product-img">
                                                <a href="javascript:void();"><img class="img-fluid rounded" style="width:80px; height:106px;" src="<%=WlRs.getString("book_img")%>" alt=""></a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 col-lg-4">
                                    <div class="checkout-product-details">
                                        <h5><%=WlRs.getString("book_name")%></h5>
                                        <p class="text-success">In stock</p>
                                        <div class="price">
                                            <h5>$<%=WlRs.getInt("book_price")%>.00</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-6">
                                    <div class="row">
                                        <div class="col-sm-8">

                                        </div>
                                        <div class="col-sm-4">
                                            <a href="wishlist.jsp#"><button type="submit" class="btn btn-primary view-more" onclick="AddToCart(<%=user_id%>, '<%=WlRs.getInt("book_id")%>')">Add To Cart</button></a>
                                        </div>
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
    </div>
</div>
