<%-- 
    Document   : Navs
    Created on : 24-Feb-2024, 11:00:48 pm
    Author     : ajay
--%>
<%@page import="com.projectx.Books.Service.EcomService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Sidebar  -->
<div class="iq-sidebar">
    <div class="iq-sidebar-logo d-flex justify-content-between">
        <a href="index.jsp" class="header-logo">
            <img src="images/logo.png" class="img-fluid rounded-normal" alt="">
            <div class="logo-title">
                <span class="text-primary text-uppercase">BookHaven</span>
            </div>
        </a>
        <div class="iq-menu-bt-sidebar">
            <div class="iq-menu-bt align-self-center">
                <div class="wrapper-menu">
                    <div class="main-circle"><i class="las la-bars"></i></div>
                </div>
            </div>
        </div>
    </div>
    <div id="sidebar-scrollbar">
        <nav class="iq-sidebar-menu">
            <ul id="iq-sidebar-toggle" class="iq-menu">
                <li class="active active-menu">
                    <a href="index.jsp#dashboard" class="iq-waves-effect" data-toggle="collapse" aria-expanded="true"><span class="ripple rippleEffect"></span><i class="las la-home iq-arrow-left"></i><span>Shop</span></a>
                    <ul id="dashboard" class="iq-submenu collapse show" data-parent="#iq-sidebar-toggle">
                        <li class="active"><a href="index.jsp"><i class="las la-house-damage"></i>Home Page</a></li>
                        <li><a href="category.jsp"><i class="ri-function-line"></i>Category Page</a></li>
                        <li><a href="Checkout.jsp"><i class="ri-checkbox-multiple-blank-line"></i>Checkout</a></li>
                        <li><a href="wishlist.jsp"><i class="ri-heart-line"></i>wishlist</a></li>
                         <li><a href="UserBookIssuedHistory.jsp"><i class="ri-heart-line"></i>Book Issued History</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- TOP Nav Bar -->
<div class="iq-top-navbar">
    <div class="iq-navbar-custom">
        <nav class="navbar navbar-expand-lg navbar-light p-0">
            <div class="iq-menu-bt d-flex align-items-center">
                <div class="wrapper-menu">
                    <div class="main-circle"><i class="las la-bars"></i></div>
                </div>
                <div class="iq-navbar-logo d-flex justify-content-between">
                    <a href="index.jsp" class="header-logo">
                        <img src="images/logo.png" class="img-fluid rounded-normal" alt="">
                        <div class="logo-title">
                            <span class="text-primary text-uppercase" >BookHaven</span>
                        </div>
                    </a>
                </div>
            </div>
            <div class="navbar-breadcrumb">
                <h5 class="mb-0">Shop</h5>
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Home Page</li>
                    </ul>
                </nav>
            </div>
            <div class="iq-search-bar">
                <form action="index.jsp#" class="searchbox">
                    <input type="text" class="text search-input" placeholder="Search Here...">
                    <a class="search-link" href="index.jsp#"><i class="ri-search-line"></i></a>
                </form>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"  aria-label="Toggle navigation">
                <i class="ri-menu-3-line"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto navbar-list">
                    <li class="nav-item nav-icon search-content">
                        <a href="index.jsp#" class="search-toggle iq-waves-effect text-gray rounded">
                            <i class="ri-search-line"></i>
                        </a>
                        <form action="index.jsp#" class="search-box p-0">
                            <input type="text" class="text search-input" placeholder="Type here to search...">
                            <a class="search-link" href="index.jsp#"><i class="ri-search-line"></i></a>
                        </form>
                    </li>
                    <li class="nav-item nav-icon">
                        <a href="index.jsp#" class="search-toggle iq-waves-effect text-gray rounded">
                            <i class="ri-notification-2-line"></i>
                            <span class="bg-primary dots"></span>
                        </a>
                        <div class="iq-sub-dropdown">
                            <div class="iq-card shadow-none m-0">
                                <div class="iq-card-body p-0">
                                    <div class="bg-primary p-3">
                                        <h5 class="mb-0 text-white">All Notifications<small class="badge  badge-light float-right pt-1">4</small></h5>
                                    </div>


                                    <a href="index.jsp#" class="iq-sub-card" >
                                        <div class="media align-items-center">
                                            <div class="">
                                                <img class="avatar-40 rounded" src="images/user/01.jpg" alt="">
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 ">Emma Watson Barry</h6>
                                                <small class="float-right font-size-12">Just Now</small>
                                                <p class="mb-0">95 MB</p>
                                            </div>
                                        </div>
                                    </a>


                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item nav-icon dropdown">
                        <a href="index.jsp#" class="search-toggle iq-waves-effect text-gray rounded">
                            <i class="ri-mail-line"></i>
                            <span class="bg-primary dots"></span>
                        </a>
                        <div class="iq-sub-dropdown">
                            <div class="iq-card shadow-none m-0">
                                <div class="iq-card-body p-0 ">
                                    <div class="bg-primary p-3">
                                        <h5 class="mb-0 text-white">All Messages<small class="badge  badge-light float-right pt-1">5</small></h5>
                                    </div>


                                    <a href="index.jsp#" class="iq-sub-card">
                                        <div class="media align-items-center">
                                            <div class="">
                                                <img class="avatar-40 rounded" src="images/user/01.jpg" alt="">
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 ">Barry Emma Watson</h6>
                                                <small class="float-left font-size-12">13 Jun</small>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>

                    <%
                        int totalItems = 0;
                        EcomService ecomservice = new EcomService();
                        ResultSet Cartrs = ecomservice.ViewCartItems();
                        //add Session to get user id
                        while (Cartrs.next()) {
                            if (Cartrs.getInt("user_id") == 1) {
                                totalItems++;
                            }
                        }
                    %>

                    <li class="nav-item nav-icon dropdown">
                        <a href="index.jsp#" class="search-toggle iq-waves-effect text-gray rounded">
                            <i class="ri-shopping-cart-2-line"></i>
                            <span class="badge badge-danger count-cart rounded-circle"><%=totalItems%></span>
                        </a>
                        <div class="iq-sub-dropdown">
                            <div class="iq-card shadow-none m-0">
                                <div class="iq-card-body p-0 toggle-cart-info">
                                    <div class="bg-primary p-3">
                                        <h5 class="mb-0 text-white">All Carts<small class="badge  badge-light float-right pt-1"><%=totalItems%></small></h5>
                                    </div>

                                    <%
                                        // Repeat this block of code based on the value of totalItems
                                        int cartcount = 0;
                                        ResultSet CartrsNested = ecomservice.ViewCartItems();
                                        while (CartrsNested.next() && cartcount < 4) {
                                            if (CartrsNested.getInt("user_id") == 1) {

                                    %>
                                    <a href="index.jsp#" class="iq-sub-card">
                                        <div class="media align-items-center">
                                            <div class="">
                                                <img class="rounded" style="width:50px; height:70px;" src="<%=CartrsNested.getString("book_img")%>" alt="">
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 "><%=CartrsNested.getString("book_name")%></h6>
                                                <p class="mb-0">$<%=CartrsNested.getInt("book_price")%></p>
                                            </div>

                                        </div>
                                    </a>

                                    <%

                                                cartcount++;
                                            }
                                        }
                                    %>

                                    <div class="d-flex align-items-center text-center p-3">
                                        <a class="btn btn-primary mr-2 iq-sign-btn" href="Checkout.jsp" role="button">View Cart</a>
                                        <a class="btn btn-primary iq-sign-btn" href="index.jsp#" role="button">Shop now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="line-height pt-3">
                        <%
                            String userEmail = (String) session.getAttribute("email");
                            EcomService ecomService1 = new EcomService();
                            ResultSet rs1 = ecomService1.AdminProfile(userEmail);
                            while (rs1.next()) {
                                if (userEmail != null && !userEmail.isEmpty()) {
                                    char firstLetter = userEmail.charAt(0);

                        %>
                        <a href="index.jsp#" class="search-toggle iq-waves-effect d-flex align-items-center">
                            <div class=" name-initial">

                                <span class="initial"> <%= Character.toUpperCase(firstLetter)%></span>


                            </div>
                            <div class="caption">
                                <h6 class="mb-1 line-height"><%= rs1.getString("name")%></h6>
                              
                            </div>
                        </a>
                        <%}
                                            }%>
                        <div class="iq-sub-dropdown iq-user-dropdown">
                            <div class="iq-card shadow-none m-0">
                                <div class="iq-card-body p-0 ">
                                    <div class="bg-primary p-3">
                                        <h5 class="mb-0 text-white line-height">Hello Barry Tech</h5>
                                        <span class="text-white font-size-12">Available</span>
                                    </div>
                                    <a href="profile.jsp" class="iq-sub-card iq-bg-primary-hover">
                                        <div class="media align-items-center">
                                            <div class="rounded iq-card-icon iq-bg-primary">
                                                <i class="ri-file-user-line"></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 ">My Profile</h6>
                                                <p class="mb-0 font-size-12">View personal profile details.</p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="profile-edit.jsp" class="iq-sub-card iq-bg-primary-hover">
                                        <div class="media align-items-center">
                                            <div class="rounded iq-card-icon iq-bg-primary">
                                                <i class="ri-profile-line"></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 ">Edit Profile</h6>
                                                <p class="mb-0 font-size-12">Modify your personal details.</p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="account-setting.jsp" class="iq-sub-card iq-bg-primary-hover">
                                        <div class="media align-items-center">
                                            <div class="rounded iq-card-icon iq-bg-primary">
                                                <i class="ri-account-box-line"></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 ">Account settings</h6>
                                                <p class="mb-0 font-size-12">Manage your account parameters.</p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="privacy-setting.jsp" class="iq-sub-card iq-bg-primary-hover">
                                        <div class="media align-items-center">
                                            <div class="rounded iq-card-icon iq-bg-primary">
                                                <i class="ri-lock-line"></i>
                                            </div>
                                            <div class="media-body ml-3">
                                                <h6 class="mb-0 ">Privacy Settings</h6>
                                                <p class="mb-0 font-size-12">Control your privacy parameters.</p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="d-inline-block w-100 text-center p-3">
                                        <button class="bg-primary iq-sign-btn"  role="button" onclick="logout()">Sign out<i class="ri-login-box-line ml-2"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
                        <div type="hidden" id="logout"></div>
</div>

<!-- TOP Nav Bar END -->

<script>
function logout() {
     ajaxCall('POST', 'Ecommerce.fin', 'logout','$process='+logout ,'isHTML');
    
    
}
</script>