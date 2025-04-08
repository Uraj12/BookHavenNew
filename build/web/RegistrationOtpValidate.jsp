<%-- 
    Document   : RegistrationOtpValidate
    Created on : 19-Feb-2024, 8:42:49 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <style type="text/css">
        .form-gap {
            padding-top: 70px;
        }
           .form-gap {
            padding-top: 70px;
        }
        body {
            background-color: #f8f8f8; /* Set background color to #f8f8f8 */
        }
        .btn-primary {
            background-color: #f8f8f8; /* Set button background color to #f8f8f8 */
            color: #333; /* Set button text color */
            border-color: #ccc; /* Set button border color */
        }
        .btn-primary:hover,
        .btn-primary:focus,
        .btn-primary:active,
        .btn-primary.active,
        .open .dropdown-toggle.btn-primary {
            background-color: #ccc; /* Set button background color on hover */
            border-color: #ccc; /* Set button border color on hover */
            color: #333; /* Set button text color on hover */
        }
    </style>
</head>
<body>
       <%
            if(session.getAttribute("email") == null ){
                response.sendRedirect("login.jsp");
            }
        %>
    <div class="form-gap"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                            <h3>
                                <i class="fa fa-lock fa-4x"></i>
                            </h3>
                            <h2 class="text-center">Verify Registration OTP</h2>
                            <%
                                if(request.getAttribute("message")!=null) {
                                    out.print("<p class='text-danger ml-1'>"+request.getAttribute("message")+"</p>");
                                }
                            %>
                            <div class="panel-body">
                                <form id="verify-otp-form" action="session.fin?process=registrationOtpValidate" role="form" autocomplete="off" class="form" method="post">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                            <input id="otp" name="otp" placeholder="Enter OTP" class="form-control" type="text" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="verify-otp-submit" class="btn btn-lg btn-primary btn-block" value="Verify OTP" type="submit">
                                    </div>
                                    <input type="hidden" class="hide" name="token" id="token" value="">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
