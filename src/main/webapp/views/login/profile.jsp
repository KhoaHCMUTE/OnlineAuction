<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
         integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
         integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
   <style>
       * {
           margin: 0;
           padding: 0;
       }

       html {
           width: 100vw;
           height: 100vh;
       }

       body {
           background-repeat: no-repeat;
           background-attachment: fixed;
           background-size: cover;
           background-position: top;
           background-image: url(http://bit.ly/2gPLxZ4);
           width: 100%;
           height: 100%;
           font-family: Arial, Helvetica;
           letter-spacing: 0.02em;
           font-weight: 400;
           -webkit-font-smoothing: antialiased;
       }

       .user-login-box > * {
           display: inline-block;
           width: 200px;
       }

       .fa-thumbs-up {
           color: green;
       }

       .fa-thumbs-down {
           color: navy;
       }

       .row4 {
           padding-left: 5px;
           padding-top: 30px;
       }

       .row1 {
           padding-left: 230px;
           padding-top: 20px;
       }

       .page-content {
           padding-top: 50px;
           padding-left: 110px;
       }

       .user-card-full {
           overflow: hidden
       }

       .card {
           border-radius: 5px;
           -webkit-box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
           box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
           border: none;
           margin-bottom: 30px
       }

       .m-r-0 {
           margin-right: 0px
       }

       .m-l-0 {
           margin-left: 0px
       }

       .user-card-full .user-profile {
           border-radius: 5px 0 0 5px
       }

       .bg-c-lite-green {
           background: -webkit-gradient(linear, left top, right top, from(#f29263), to(#ee5a6f));
           background: linear-gradient(to right, #ee5a6f, #f29263)
       }

       .user-profile {
           padding: 20px 0
       }

       .card-block {
           padding: 1.25rem
       }

       .m-b-25 {
           margin-bottom: 25px
       }

       .img-radius {
           border-radius: 5px
       }

       h6 {
           font-size: 14px
       }

       .card .card-block p {
           line-height: 25px
       }

       @media only screen and (min-width: 1400px) {
           p {
               font-size: 14px
           }
       }

       .card-block {
           padding: 1.25rem
       }

       .b-b-default {
           border-bottom: 1px solid #e0e0e0
       }

       .m-b-20 {
           margin-bottom: 20px
       }

       .p-b-5 {
           padding-bottom: 5px !important
       }

       .card .card-block p {
           line-height: 25px
       }

       .m-b-10 {
           margin-bottom: 10px
       }

       .text-muted {
           color: #919aa3 !important
       }

       .b-b-default {
           border-bottom: 1px solid #e0e0e0
       }

       .f-w-600 {
           font-weight: 600
       }

       .m-b-20 {
           margin-bottom: 20px
       }

       .m-t-40 {
           margin-top: 20px
       }

       .p-b-5 {
           padding-bottom: 5px !important
       }

       .m-b-10 {
           margin-bottom: 10px
       }

       .m-t-40 {
           margin-top: 20px
       }

       .user-card-full .social-link li {
           display: inline-block
       }

       .user-card-full .social-link li a {
           font-size: 20px;
           margin: 0 10px 0 0;
           -webkit-transition: all 0.3s ease-in-out;
           transition: all 0.3s ease-in-out
       }
   </style>
   <title>Profile</title>
</head>

<body>
<form class="page-content page-container" method="post" id="page-content">
   <div class="row container d-flex justify-content-center">
      <div class="col-xl-9 col-md-15">
         <div class="card user-card-full">
            <div class="row m-l-0 m-r-0">
               <div class="col-sm-3 bg-c-lite-green user-profile">
                  <c:choose>
                  <c:when test="${AuthUser.permission == 1}">
                  <div class="card-block text-center text-white">
                     <div class="m-b-25"><img src="https://img.icons8.com/bubbles/100/000000/user.png"
                                              class="img-radius" alt="User-Profile-Image"></div>
                     <h5 class="f-w-600">Admin</h5>
                     <p>${AuthUser.name}</p>
                     <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                  </div>
               </div>
               <div class="col-sm-9">
                  <div class="card-block">
                     <h5 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h5>
                     <div class="row">
                        <div class="col-sm-6">
                           <p class="m-b-10 f-w-600">UserName</p>
                           <input type="text" style="outline: none; border: white" class="text-muted f-w-400" readonly
                                  value="${AuthUser.userName}">
                        </div>
                        <div class="col-sm-6">
                           <div class="col-sm-15">
                              <p class="m-b-10 f-w-600">Email</p>
                              <h6 class="text-muted f-w-400">${AuthUser.email}</h6>
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-sm-6">
                           <p class="m-b-10 f-w-600">Password</p>
                           <input type="password" style="outline: none; border: white;" class="text-muted f-w-400"
                                  readonly value="${AuthUser.passWord}">
                        </div>
                        <div style="padding-top: 25px; padding-right: 10px" class="col-sm-6">
                           <a class="btn btn-outline-warning small" type="submit"
                              href="${pageContext.request.contextPath}/account/changepw"> Change Password</a>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-sm-6">
                           <p class="m-b-10 f-w-600">Day Of Birth</p>
                           <h6 class="text-muted f-w-400">${AuthUser.dob}</h6>
                        </div>
                        <div style="padding-top: 25px; padding-right: 10px" class="col-sm-6">
                           <a class="btn btn-outline-warning small" type="submit"
                              href="${pageContext.request.contextPath}/account/changeun"> Change Username</a>
                        </div>
                     </div>
                     <br>
                     <div class="row">
                        <div class="col-sm-6">
                           <a style="color: red"
                              href="${pageContext.request.contextPath}/assess/index?UserId=${AuthUser.id}"><p
                                   class="m-b-10 f-w-600">Scores</p></a>
                        </div>
                     </div>
                     <div class="row1">
                        <a style="color: black; font-weight: bold; padding-left: 250px; padding-top: 15px"
                           href="${pageContext.request.contextPath}/home/index">Home</a>
                     </div>
                  </div>
               </div>
               </c:when>
               <c:otherwise>
               <div class="card-block text-center text-white">
                  <div class="m-b-25"><img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius"
                                           alt="User-Profile-Image"></div>
                  <h5 class="f-w-600">User</h5>
                  <p>${AuthUser.name}</p>
                  <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
               </div>
            </div>
            <div class="col-sm-9">
               <div class="card-block">
                  <h5 class="m-b-20 p-b-5 b-b-default f-w-600">Permission</h5>
                  <div class="row">
                     <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">UserName</p>
                        <input type="text" style="outline: none; border: white" class="text-muted f-w-400" readonly
                               value="${AuthUser.userName}">
                     </div>
                     <div class="col-sm-6">
                        <div class="col-sm-17">
                           <p class="m-b-10 f-w-600">Email</p>
                           <h6 class="text-muted f-w-400">${AuthUser.email}</h6>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Password</p>
                        <input type="password" style="outline: none; border: white" class="text-muted f-w-400" readonly
                               value="${AuthUser.passWord}">
                     </div>
                     <div style="padding-top: 25px; padding-right: 10px" class="col-sm-6">
                        <a class="btn btn-outline-warning small" type="submit"
                           href="${pageContext.request.contextPath}/account/changepw"> Change Password</a>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Day Of Birth</p>
                        <h6 class="text-muted f-w-400">${AuthUser.dob}</h6>
                     </div>
                     <div style="padding-top: 25px; padding-right: 10px" class="col-sm-6">
                        <a class="btn btn-outline-warning small" type="submit"
                           href="${pageContext.request.contextPath}/account/changeun"> Change Username</a>
                     </div>
                  </div>
                  <br>
                  <div class="row">
                     <div class="col-sm-6">
                        <a style="color: red"
                           href="${pageContext.request.contextPath}/assess/index?UserId=${AuthUser.id}"><p
                                class="m-b-10 f-w-600">Scores</p></a>
                     </div>
                  </div>
                  <c:if test="${AuthUser.permission == 0}">
                     <h5 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Permission</h5>
                     <div class="row">
                        <div class="col-sm-6">
                           <p class="m-b-10 f-w-600">Bidder</p>
                           <h6 class="text-muted f-w-400">Available</h6>
                        </div>
                        <div class="col-sm-6">
                           <p style="padding-left: 20px" class="m-b-10 f-w-600 ">Seller</p>
                           <a class="btn btn-outline-secondary small" type="submit"
                              href="${pageContext.request.contextPath}/account/notify">Upgrage</a>
                        </div>
                     </div>
                     <div class="row1">
                        <a style="color: black; font-weight: bold; padding-left: 250px"
                           href="${pageContext.request.contextPath}/home/index">Home</a>
                     </div>
                  </c:if>
                  <c:if test="${AuthUser.permission == 2}">
                     <h5 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Permission</h5>
                     <div class="row">
                        <div class="col-sm-6">
                           <p class="m-b-10 f-w-600">Bidder</p>
                           <h6 class="text-muted f-w-400">Available</h6>
                        </div>
                        <div class="col-sm-6">
                           <p class="m-b-10 f-w-600 ">Seller</p>
                           <h6 class="text-muted f-w-400">Available</h6>
                        </div>
                     </div>
                     <div class="row1">
                        <a style="color: black; font-weight: bold; padding-left: 250px"
                           href="${pageContext.request.contextPath}/home/index">Home</a>
                     </div>
                  </c:if>
               </div>
            </div>
            </c:otherwise>
            </c:choose>
         </div>
      </div>
   </div>
</form>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>