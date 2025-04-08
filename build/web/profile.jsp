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
                <div class="container-fluid">
                    <div class="row profile-content">
                        <div class="col-12 col-md-12 col-lg-4">
                            <div class="iq-card">
                                <div class="iq-card-body profile-page">
                                    <div class="profile-header">
                                        <%
                                            EcomService ecomService = new EcomService();
                                            ResultSet rs = ecomService.AdminProfile(userEmail);
                                            while (rs.next()) {

                                        %>
                                        <div class="cover-container text-center">
                                            <img src="images/user/1.jpg" alt="profile-bg" class="rounded-circle img-fluid">
                                            <div class="profile-detail mt-3">
                                                <h3><%= rs.getString("name")%></h3>


                                            </div>
                                            <div class="iq-social d-inline-block align-items-center">
                                                <ul class="list-inline d-flex p-0 mb-0 align-items-center">
                                                    <li>
                                                        <a href="profile.jsp#" class="avatar-40 rounded-circle bg-primary mr-2 facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="profile.jsp#" class="avatar-40 rounded-circle bg-primary mr-2 twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="profile.jsp#" class="avatar-40 rounded-circle bg-primary mr-2 youtube"><i class="fa fa-youtube-play" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li >
                                                        <a href="profile.jsp#" class="avatar-40 rounded-circle bg-primary pinterest"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="iq-card">
                                <div class="iq-card-header d-flex justify-content-between align-items-center mb-0">
                                    <div class="iq-header-title">
                                        <h4 class="card-title mb-0">Personal Details</h4>
                                    </div>
                                </div> 

                                <div class="iq-card-body">
                                    <ul class="list-inline p-0 mb-0">
                                        <li>
                                            <div class="row align-items-center justify-content-between mb-3">
                                                <div class="col-sm-6">
                                                    <h6>Name</h6>                                       
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="mb-0" id="name" contentEditable="false"><%= rs.getString("name")%></p>                                       
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row align-items-center justify-content-between mb-3">
                                                <div class="col-sm-6">
                                                    <h6>Email</h6>                                       
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="mb-0" id="email" contentEditable="false"><%= rs.getString("email")%></p>                                       
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row align-items-center justify-content-between mb-3">
                                                <div class="col-sm-6">
                                                    <h6>contact</h6>                                       
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="mb-0" id="phno" contentEditable="false"><%= rs.getString("contact")%></p>                                       
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row align-items-center justify-content-between mb-3">
                                                <div class="col-sm-6">
                                                    <h6>address1</h6>                                       
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="mb-0" id="address1" contentEditable="false"><%= rs.getString("address1")%></p>                                       
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            
                                        </li>   

                                        <li>
                                            <div class="row align-items-center justify-content-between mb-3">
                                                <div class="col-sm-6">
                                                    <a href="profile-edit.jsp"><button id="editButton" class="btn btn-primary">Edit</button></a>

                                                </div>

                                            </div>
                                        </li>

                                    </ul>
                                </div>
                                <%}%>
                            </div>

                        </div>

                        <div class="col-12 col-md-12 col-lg-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                        <div class="iq-card-header d-flex justify-content-between align-items-center mb-0">
                                            <div class="iq-header-title">
                                                <h4 class="card-title mb-0">Latest Uploads</h4>
                                            </div>
                                        </div> 
                                        <%
                                            int totalwishlistcount = ecomService.totalwishlistcount();
                                            int totalissuedbookcount = ecomService.totalissuedbookcount(userEmail);
//                                            int totalduebookcount = ecomService.TotalOrders();
                                            int issuehistory = ecomService.issuehistory(userEmail);
                                            int totalorders = ecomService.totalorders(userEmail);
                                            int duebooks = ecomService.duebooks(userEmail);

                                        %>
                                        <div class="iq-card-body">
                                            <ul class="list-inline p-0 mb-0">
                                                <li class="d-flex mb-4 align-items-center">
                                                    <div class="profile-icon bg-secondary"><span><i class="ri-file-3-fill"></i></span></div>
                                                    <div class="media-support-info ml-3">
                                                        <h6>Wishlist</h6>
                                                        <p class="mb-0"><%= totalwishlistcount%></p>
                                                    </div>
                                                    <div class="iq-card-toolbar">
                                                        <div class="dropdown">
                                                            <span class="font-size-24" id="dropdownMenuButton01" data-toggle="dropdown" aria-expanded="false">
                                                                <i class="ri-more-line"></i>
                                                            </span>

                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="d-flex mb-4 align-items-center">
                                                    <div class="profile-icon bg-secondary"><span><i class="ri-image-fill"></i></span></div>
                                                    <div class="media-support-info ml-3">
                                                        <h6>Issueed Books</h6>
                                                        <p class="mb-0"><%= totalissuedbookcount%></p>
                                                    </div>
                                                    <div class="iq-card-toolbar">
                                                        <div class="dropdown">
                                                            <span class="font-size-24" id="dropdownMenuButton02" data-toggle="dropdown" aria-expanded="false">
                                                                <i class="ri-more-line"></i>
                                                            </span>

                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="d-flex mb-4 align-items-center">
                                                    <div class="profile-icon bg-secondary"><span><i class="ri-video-fill"></i></span></div>
                                                    <div class="media-support-info ml-3">
                                                        <h6>Due Books</h6>
                                                        <p class="mb-0"><%= duebooks%></p>
                                                    </div>
                                                    <div class="iq-card-toolbar">
                                                        <div class="dropdown">
                                                            <span class="font-size-24" id="dropdownMenuButton03" data-toggle="dropdown" aria-expanded="false">
                                                                <i class="ri-more-line"></i>
                                                            </span>

                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="d-flex mb-4 align-items-center">
                                                    <div class="profile-icon bg-secondary"><span><i class="ri-file-3-fill"></i></span></div>
                                                    <div class="media-support-info ml-3">
                                                        <h6>Issue History</h6>
                                                        <p class="mb-0"><%= issuehistory%></p>
                                                    </div>
                                                    <div class="iq-card-toolbar">
                                                        <div class="dropdown">
                                                            <span class="font-size-24" id="dropdownMenuButton04" data-toggle="dropdown" aria-expanded="false">
                                                                <i class="ri-more-line"></i>
                                                            </span>

                                                        </div>
                                                    </div>
                                                </li>

                                                <li class="d-flex mb-4 align-items-center">
                                                    <div class="profile-icon bg-secondary"><span><i class="ri-file-3-fill"></i></span></div>
                                                    <div class="media-support-info ml-3">
                                                        <h6>Orders</h6>
                                                        <p class="mb-0"><%= totalorders%></p>
                                                    </div>
                                                    <div class="iq-card-toolbar">
                                                        <div class="dropdown">
                                                            <span class="font-size-24" id="dropdownMenuButton04" data-toggle="dropdown" aria-expanded="false">
                                                                <i class="ri-more-line"></i>
                                                            </span>

                                                        </div>
                                                    </div>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                        <div class="iq-card-header d-flex justify-content-between align-items-center mb-0">
                                            <div class="iq-header-title">
                                                <h4 class="card-title mb-0">Top Books</h4>

                                            </div>
                                            <div class="iq-card-header-toolbar d-flex align-items-center">
                                                <a href="category.jsp" class="btn btn-sm btn-primary view-more">View More</a>
                                            </div>
                                        </div>
                                        <%
                                            ResultSet topbooks = ecomService.topbooks();
                                            int counter = 0; // Counter to track the number of books displayed
                                            while (topbooks.next() && counter < 5) { // Stop after displaying 5 books
                                                counter++;
                                        %>
                                        <div class="iq-card-body">
                                            <ul class="list-inline p-0 mb-0">
                                                <li>
                                                    <div class="media align-items-center">
                                                        <div class="">
                                                            <img class="rounded" style="width:50px; height:70px;" src="<%= topbooks.getString("book_img")%>" alt="">
                                                        </div>
                                                        <div class="media-body ml-3">
                                                            <h6 class="mb-0 "><%= topbooks.getString("book_name")%></h6>
                                                            <p class="mb-0">$<%= topbooks.getInt("book_price")%></p>
                                                        </div>
                                                    </div>                                       
                                                </li>
                                            </ul>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>


                                </div>

                            </div>

                            <div class="iq-card">
                                <div class="iq-card-header d-flex justify-content-between align-items-center mb-0">
                                    <div class="iq-header-title">
                                        <h4 class="card-title mb-0">Favourate Authors</h4>
                                    </div>

                                    <div class="iq-card-header-toolbar d-flex align-items-center">
                                        <div class="dropdown">
                                            <span class="dropdown-toggle text-primary" id="dropdownMenuButton05" data-toggle="dropdown">
                                                <i class="ri-more-fill"></i>
                                            </span>

                                        </div>
                                    </div>
                                </div>
                                <%
                                    ResultSet favAuthors = ecomService.favAuthor(userEmail);
                                    while (favAuthors.next()) {
                                %>
                                <div class="iq-card-body">
                                    <ul class="perfomer-lists m-0 p-0">
                                        <li class="d-flex mb-4 align-items-center">
                                            <div class="user-img img-fluid"><img class="img-fluid avatar-50 rounded-circle" src="<%= favAuthors.getString("img")%>" alt=""></div>
                                            <div class="media-support-info ml-3">
                                                <h5><%= favAuthors.getString("author_name")%></h5>
                                                <p class="mb-0"><%= favAuthors.getString("short_about")%></p> <!-- Display shortened about text -->
                                            </div>

                                        </li>
                                        <!-- Other list items for each author -->
                                    </ul>
                                </div>
                                <% }%>

                            </div>

                        </div>





                    </div>

                </div>

            </div>

        </div>
        <div type="hidden" id="profile"></div>
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