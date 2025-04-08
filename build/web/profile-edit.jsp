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
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="iq-card">
                                <div class="iq-card-body p-0">
                                    <div class="iq-edit-list">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="iq-edit-list-data">
                                <div class="tab-content">
                                    <div class="tab-pane fade active show" id="personal-information" role="tabpanel">
                                        <div class="iq-card">
                                            <div class="iq-card-header d-flex justify-content-between">
                                                <div class="iq-header-title">
                                                    <h4 class="card-title">Personal Information</h4>
                                                </div>
                                            </div>
                                            <%
                                            EcomService ecomService = new EcomService();
                                            ResultSet rs = ecomService.AdminProfile(userEmail);
                                            while (rs.next()) {
                                            %>
                                            <div class="iq-card-body">
                                                <form method="post">
                                                    <div class="form-group row align-items-center">
                                                        <div class="col-md-12">
                                                            <div class="profile-img-edit">
                                                                <img class="profile-pic" src="images/user/11.png" alt="profile-pic">
                                                                <div class="p-image">
                                                                    <i class="ri-pencil-line upload-button"></i>
                                                                    <input class="file-upload" type="file" accept="image/*"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class=" row align-items-center">
                                                        <div class="form-group col-sm-6">
                                                            <label for="fname">Name:</label>
                                                            <input type="text" class="form-control" id="name" value="<%= rs.getString("name")%>">
                                                        </div>

                                                        <div class="form-group col-sm-6">
                                                            <label for="uname">Email</label>
                                                            <input type="text" class="form-control" id="email" value="<%= rs.getString("email")%>">
                                                        </div>
                                                        <div class="form-group col-sm-6">
                                                            <label for="cname">contact</label>
                                                            <input type="text" class="form-control" id="phno" value="<%= rs.getString("contact")%>">
                                                        </div>

                                                        <div class="form-group col-sm-12">
                                                            <label>Address 1:</label>
                                                            <input class="form-control" name="address1" value=" <%= rs.getString("address1")%>" >

                                                            
                                                        </div>
                                                         <div class="form-group col-sm-12">
                                                            <label>Address 2:</label>
                                                            <input class="form-control" name="address2" value=" <%= rs.getString("address2")%>" >

                                                           
                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn btn-primary mr-2" onclick="saveChanges()">Submit</button>
                                                    <button type="reset" class="btn iq-bg-danger">Cancel</button>
                                                </form>
                                            </div>
                                            <%}%>
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