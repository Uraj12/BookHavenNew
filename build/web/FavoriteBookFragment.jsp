<%-- 
    Document   : FavoriteBookFragment
    Created on : 28-Feb-2024, 7:43:30 pm
    Author     : ajay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-lg-12">
    <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
        <div class="iq-card-header d-flex justify-content-between align-items-center position-relative">
            <div class="iq-header-title">
                <h4 class="card-title mb-0">Wishful Reads</h4>
            </div>
            <div class="iq-card-header-toolbar d-flex align-items-center">
                <a href="category.jsp" class="btn btn-sm btn-primary view-more">View More</a>
            </div>
        </div>  
        <div class="iq-card-body favorites-contens">
            <ul id="favorites-slider" class="list-inline p-0 mb-0 row">
                <li class="col-md-4">
                    <div class="d-flex align-items-center">
                        <div class="col-5 p-0 position-relative">
                            <a href="javascript:void();">
                                <img src="images/favorite/01.jpg" class="img-fluid rounded w-100" alt="">
                            </a>                                
                        </div>
                        <div class="col-7">
                            <h5 class="mb-2">Every Book is a new Wonderful Travel..</h5>
                            <p class="mb-2">Author : Pedro Araez</p>                                          
                            <div class="d-flex justify-content-between align-items-center text-dark font-size-13">
                                <span>Reading</span>
                                <span class="mr-4">78%</span>
                            </div>
                            <div class="iq-progress-bar-linear d-inline-block w-100">
                                <div class="iq-progress-bar iq-bg-primary">
                                    <span class="bg-primary" data-percent="78"></span>
                                </div>
                            </div>
                            <a href="index.jsp" class="text-dark">Read Now<i class="ri-arrow-right-s-line"></i></a>
                        </div>
                    </div>
                </li>
                <li class="col-md-4">
                    <div class="d-flex align-items-center">
                        <div class="col-5 p-0 position-relative">
                            <a href="javascript:void();">
                                <img src="images/favorite/02.jpg" class="img-fluid rounded w-100" alt="">
                            </a>                                
                        </div>
                        <div class="col-7">
                            <h5 class="mb-2">Casey Christie night book into find...</h5>
                            <p class="mb-2">Author : Michael klock</p>                                          
                            <div class="d-flex justify-content-between align-items-center text-dark font-size-13">
                                <span>Reading</span>
                                <span class="mr-4">78%</span>
                            </div>
                            <div class="iq-progress-bar-linear d-inline-block w-100">
                                <div class="iq-progress-bar iq-bg-danger">
                                    <span class="bg-danger" data-percent="78"></span>
                                </div>
                            </div>
                            <a href="index.jsp#" class="text-dark">Read Now<i class="ri-arrow-right-s-line"></i></a>
                        </div>
                    </div>
                </li>
                <li class="col-md-4">
                    <div class="d-flex align-items-center">
                        <div class="col-5 p-0 position-relative">
                            <a href="javascript:void();">
                                <img src="images/favorite/03.jpg" class="img-fluid rounded w-100" alt="">
                            </a>                                
                        </div>
                        <div class="col-7">
                            <h5 class="mb-2">The Secret to English Busy People..</h5>
                            <p class="mb-2">Author : Daniel Ace</p>                                          
                            <div class="d-flex justify-content-between align-items-center text-dark font-size-13">
                                <span>Reading</span>
                                <span class="mr-4">78%</span>
                            </div>
                            <div class="iq-progress-bar-linear d-inline-block w-100">
                                <div class="iq-progress-bar iq-bg-info">
                                    <span class="bg-info" data-percent="78"></span>
                                </div>
                            </div>
                            <a href="index.jsp#" class="text-dark">Read Now<i class="ri-arrow-right-s-line"></i></a>
                        </div>
                    </div>
                </li>
                <li class="col-md-4">
                    <div class="d-flex align-items-center">
                        <div class="col-5 p-0 position-relative">
                            <a href="javascript:void();">
                                <img src="images/favorite/04.jpg" class="img-fluid rounded w-100" alt="">
                            </a>                                
                        </div>
                        <div class="col-7">
                            <h5 class="mb-2">The adventures of Robins books...</h5>
                            <p class="mb-2">Author : Luka Afton</p>                                          
                            <div class="d-flex justify-content-between align-items-center text-dark font-size-13">
                                <span>Reading</span>
                                <span class="mr-4">78%</span>
                            </div>
                            <div class="iq-progress-bar-linear d-inline-block w-100">
                                <div class="iq-progress-bar iq-bg-success">
                                    <span class="bg-success" data-percent="78"></span>
                                </div>
                            </div>
                            <a href="index.jsp#" class="text-dark">Read Now<i class="ri-arrow-right-s-line"></i></a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
