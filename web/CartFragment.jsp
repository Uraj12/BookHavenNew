<%-- 
    Document   : CartFragment
    Created on : 29-Feb-2024, 1:35:00 am
    Author     : ajay
--%>
<%@page import="com.projectx.Books.Service.EcomService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%                int checkoutItems = 0;
                EcomService ecomService = new EcomService();
                ResultSet checkoutRs = ecomService.ViewCartItems();
                //add Session to get user id
                while (checkoutRs.next()) {
                    if (checkoutRs.getInt("user_id") == 1) {
                        checkoutItems++;
                    }
                }
            %>

    <div class="iq-card">
        <div class="iq-card-header d-flex justify-content-between iq-border-bottom mb-0">
            <div class="iq-header-title">
                <h4 class="card-title">Shopping Cart (<%=checkoutItems%>)</h4>

            </div>
           
        </div>
        <div class="iq-card-body">
            <ul class="list-inline p-0 m-0">
                <%
                    ResultSet checkoutProductRs = ecomService.ViewCartItems();
                    int user_id=1;
                    while (checkoutProductRs.next()) {
                        if (checkoutProductRs.getInt("user_id") == user_id) {
                            int quantity = checkoutProductRs.getInt("quantity");
                            int price = checkoutProductRs.getInt("book_price");
                            int totalPrice = quantity * price;
                %>
                <li class="checkout-product">
                    <div class="row align-items-center">
                        <div class="col-sm-2">
                            <span class="checkout-product-img">
                                <a href="javascript:void();"><img class="img-fluid rounded" style="width:80px; height:106px;" src="<%=checkoutProductRs.getString("book_img")%>" alt=""></a>
                            </span>
                        </div>
                        <div class="col-sm-4">
                            <div class="checkout-product-details">
                                <h5><%=checkoutProductRs.getString("book_name")%></h5>
                                <p class="text-success">In stock</p>
                                <div class="price">
                                    <h5>$<%=totalPrice%>.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-10">
                                    <div class="row align-items-center mt-2">
                                        <div class="col-sm-7 col-md-6">
                                            <button type="button" class="fa fa-minus qty-btn" id="btn-minus" onclick="quantityChanged(this, 'minus', '<%=checkoutProductRs.getInt("cart_item_id")%>')"></button>
                                            <input type="text" id="quantity" value="<%=checkoutProductRs.getInt("quantity")%>" readonly>
                                            <input type="hidden" value="<%=checkoutProductRs.getInt("book_quantity")%>">
                                            <button type="button" class="fa fa-plus qty-btn" id="btn-plus" onclick="quantityChanged(this, 'add', '<%=checkoutProductRs.getInt("cart_item_id")%>')"></button>
                                        </div>
                                        <div class="col-sm-5 col-md-6">
                                            <span class="product-price">$<%=checkoutProductRs.getInt("book_price")%>.00</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <a href="javascript:void();" class="text-dark font-size-20"><i class="ri-delete-bin-7-fill" onclick="DeleteCartItem(<%=user_id%>,'<%=checkoutProductRs.getInt("book_id")%>')"></i></a>
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

