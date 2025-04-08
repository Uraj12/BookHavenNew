<%-- 
    Document   : UserBookIssuedHistory
    Created on : 29-Mar-2024, 4:19:07 pm
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Css.jsp" %>
    </head>
    <body>
           <%
            if(session.getAttribute("email") == null ){
                response.sendRedirect("login.jsp");
            }
        %>
        <div id="loading">
            <div id="loading-center">
            </div>
        </div>
        <div class="wrapper">

            <div id="nav">
                <%@include file="Navs.jsp" %>
            </div>
            
            <div id="content-page" class="content-page">
                <div class="container-fluid">
                  
              <%@include file="BookIssued.jsp" %> 
              <div class="col-lg-12">
                   <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
        <div class="iq-card-header d-flex justify-content-between align-items-center position-relative mb-0 similar-detail">
            <div class="iq-header-title">
                <h4 class="card-title mb-0">Books Issued History</h4>
            </div>
            <div class="iq-card-header-toolbar d-flex align-items-center">
                <a href="category.html" class="btn btn-sm btn-primary view-more">View More</a>
            </div>
        </div>  
            <div class="row">
                <%
                    EcomService ecomService = new EcomService();
                    ResultSet IssuedBookHistory = ecomService.IssuedBookHistory(userEmail);
                    while (IssuedBookHistory.next()) {
                %>

                <div class="iq-card-body ">
                   
                    <ul class="list-inline p-0 mb-0">
                        <li>
                            <div class="media align-items-center">
                                <div class="">
                                    <img class="rounded" style="width:100px; height:120px;" src="<%= IssuedBookHistory.getString("book_img")%>" alt="">
                                </div>
                                <div class="media-body ml-3">
                                    <h6 class="mb-0 "><%= IssuedBookHistory.getString("book_name")%></h6>
                                    <p class="mb-0">$<%= IssuedBookHistory.getInt("book_price")%></p>
                                     <p class="mb-0">Requested date <%= IssuedBookHistory.getString("request_date")%></p>
                                     <p class="mb-0">Return date <%= IssuedBookHistory.getString("return_date")%></p>
                                </div>
                            </div>                                       
                        </li>
                    </ul>
                </div>

                <%}%>
            </div>
                   </div>
              </div>
        </div>
            </div>
        </div>        <%@include file="Footer.jsp" %>
        <%@include file="Js.jsp" %>
    </body>
</html>
