
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
        <!-- loader Start -->
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
                <div class="container-fluid checkout-content">
                    <div class="row">
                        <div id="cart" class="card-block show p-0 col-12">
                            <div class="row align-item-center" >
                                <div class="col-lg-8" id="refresh-cart" >
                                <%@include file="CartFragment.jsp" %>
                                </div>
                                <div class="col-lg-4">
                                    <div class="iq-card">
                                        <div class="iq-card-body">
                                            <p>Options</p>
                                            <div class="d-flex justify-content-between">
                                                <span>Coupons</span>
                                                <span><a href="Checkout.jsp#"><strong>Apply</strong></a></span>
                                            </div>
                                            <hr>
                                            <p><b>Price Details</b></p>
                                            <div class="d-flex justify-content-between mb-1">
                                                <span>Total MRP</span>
                                                <span>$829</span>
                                            </div>
                                            <div class="d-flex justify-content-between mb-1">
                                                <span>Bag Discount</span>
                                                <span class="text-success">-20$</span>
                                            </div>
                                            <div class="d-flex justify-content-between mb-1">
                                                <span>Estimated Tax</span>
                                                <span>$15</span>
                                            </div>
                                            <div class="d-flex justify-content-between mb-1">
                                                <span>EMI Eligibility</span>
                                                <span><a href="Checkout.jsp#">Details</a></span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span>Delivery Charges</span>
                                                <span class="text-success">Free</span>
                                            </div>
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <span class="text-dark"><strong>Total</strong></span>
                                                <span class="text-dark"><strong>$824</strong></span>
                                            </div>
                                            <a id="place-order" href="javascript:void();" class="btn btn-primary d-block mt-3 next">Place order</a>
                                        </div>
                                    </div>
                                    <div class="iq-card ">
                                        <div class="card-body iq-card-body p-0 iq-checkout-policy">
                                            <ul class="p-0 m-0">
                                                <li class="d-flex align-items-center">
                                                    <div class="iq-checkout-icon">
                                                        <i class="ri-checkbox-line"></i>
                                                    </div>
                                                    <h6>Security policy (Safe and Secure Payment.)</h6>
                                                </li>
                                                <li class="d-flex align-items-center">
                                                    <div class="iq-checkout-icon">
                                                        <i class="ri-truck-line"></i>
                                                    </div>
                                                    <h6>Delivery policy (Home Delivery.)</h6>
                                                </li>
                                                <li class="d-flex align-items-center">
                                                    <div class="iq-checkout-icon">
                                                        <i class="ri-arrow-go-back-line"></i>
                                                    </div>
                                                    <h6>Return policy (Easy Retyrn.)</h6>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="address" class="card-block p-0 col-12">
                            <div class="row align-item-center">
                                <div class="col-lg-8">
                                    <div class="iq-card">
                                        <div class="iq-card-header d-flex justify-content-between">
                                            <div class="iq-header-title">
                                                <h4 class="card-title">Add New Address</h4>
                                            </div>
                                        </div>
                                        <div class="iq-card-body">
                                            <form onsubmit="required()">
                                                <div class="row mt-3">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Full Name: *</label> 
                                                            <input type="text" class="form-control" name="fname" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group"> 
                                                            <label>Mobile Number: *</label> 
                                                            <input type="text" class="form-control" name="mno" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group"> 
                                                            <label>Flat, House No: *</label> 
                                                            <input type="text" class="form-control" name="houseno" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group"> 
                                                            <label>Landmark e.g. near apollo hospital:: *</label> 
                                                            <input type="text" class="form-control" name="landmark" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group"> 
                                                            <label>Town/City: *</label> 
                                                            <input type="text" class="form-control" name="city" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group"> 
                                                            <label>Pincode: *</label> 
                                                            <input type="text" class="form-control" name="pincode" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group"> 
                                                            <label>State: *</label> 
                                                            <input type="text" class="form-control" name="state" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="addtype">Address Type</label>
                                                            <select class="form-control" id="addtype">
                                                                <option>Home</option>
                                                                <option>Office</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <button id="savenddeliver" type="submit" class="btn btn-primary">Save And Deliver Here</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="iq-card">
                                        <div class="iq-card-body">
                                            <h4 class="mb-2">Nik John</h4>
                                            <div class="shipping-address">
                                                <p class="mb-0">9447 Glen Eagles Drive</p>
                                                <p>Lewis Center, OH 43035</p>
                                                <p>UTC-5: Eastern Standard Time (EST)</p>
                                                <p>202-555-0140</p>
                                            </div>
                                            <hr>
                                            <a id="deliver-address" href="javascript:void();" class="btn btn-primary d-block mt-1 next">Deliver To this Address</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="payment" class="card-block p-0 col-12">
                            <div class="row align-item-center">
                                <div class="col-lg-8">
                                    <div class="iq-card">
                                        <div class="iq-card-header d-flex justify-content-between">
                                            <div class="iq-header-title">
                                                <h4 class="card-title">Payment Options</h4>
                                            </div>
                                        </div>
                                        <div class="iq-card-body">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <img src="images/booking/cart.png" alt="" height="40" width="50">
                                                    <span>US Unlocked Debit Card 12XX XXXX XXXX 0000</span>
                                                </div>
                                                <span>Nik John</span>
                                                <span>28/2020</span>
                                            </div>
                                            <form class="mt-3">
                                                <div class="d-flex align-items-center">
                                                    <span>Enter CVV: </span>
                                                    <div class="cvv-input ml-3 mr-3">
                                                        <input type="text" class="form-control" required=""> 
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Continue</button>
                                                </div>
                                            </form>
                                            <hr>
                                            <div class="card-lists">
                                                <div class="form-group">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="credit" name="customRadio" class="custom-control-input">
                                                        <label class="custom-control-label" for="credit"> Credit / Debit / ATM Card</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="netbaking" name="customRadio" class="custom-control-input">
                                                        <label class="custom-control-label" for="netbaking"> Net Banking</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="emi" name="emi" class="custom-control-input">
                                                        <label class="custom-control-label" for="emi"> EMI (Easy Installment)</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="cod" name="cod" class="custom-control-input">
                                                        <label class="custom-control-label" for="cod"> Cash On Delivery</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="add-card">
                                                <a href="Checkout.jsp#"><span><i class="ri-add-box-line mr-2 font-size-18"></i>Add Gift Card</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="iq-card">
                                        <div class="iq-card-body">
                                            <h4 class="mb-2">Price Details</h4>
                                            <div class="d-flex justify-content-between">
                                                <span>Price 3 Items</span>
                                                <span><strong>$1000.00</strong></span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span>Delivery Charges</span>
                                                <span class="text-success">Free</span>
                                            </div>
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <span>Amount Payable</span>
                                                <span><strong>$1000.00</strong></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
        <%@include file="Js.jsp" %>
    </body>
</html>