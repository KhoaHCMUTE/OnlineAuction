<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <style>
        body{
            background-image: url(https://wallpaperaccess.com/full/3915815.jpg);
        }
        #logreg-forms{
            width:412px;
            margin:10vh auto;
            background-color:#f3f3f3;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            transition: all 0.3s cubic-bezier(.25,.8,.25,1);
        }
        #logreg-forms form {
            width: 100%;
            max-width: 410px;
            padding: 15px;
            margin: auto;
        }
        #logreg-forms .form-control {
            position: relative;
            box-sizing: border-box;
            height: auto;
            padding: 10px;
            font-size: 16px;
        }
        #logreg-forms .form-control:focus { z-index: 2; }
        #logreg-forms .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        #logreg-forms .form-signin input[type="password"] {
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        #logreg-forms .social-login{
            width:390px;
            margin:0 auto;
            margin-bottom: 14px;
        }
        #logreg-forms .social-btn{
            font-weight: 100;
            color:white;
            width:190px;
            font-size: 0.9rem;
        }

        #logreg-forms a{
            display: block;
            padding-top:10px;
            color:lightseagreen;
        }

        #logreg-form .lines{
            width:200px;
            border:1px solid red;
        }


        #logreg-forms button[type="submit"]{ margin-top:10px; }

        #logreg-forms .facebook-btn{  background-color:#3C589C; }

        #logreg-forms .google-btn{ background-color: #DF4B3B; }

        #logreg-forms .form-reset, #logreg-forms .form-signup{ display: none; }

        #logreg-forms .form-signup .social-btn{ width:210px; }

        #logreg-forms .form-signup input { margin-bottom: 2px;}

        .form-signup .social-login{
            width:210px !important;
            margin: 0 auto;
        }

        /* Mobile */

        @media screen and (max-width:500px){
            #logreg-forms{
                width:300px;
            }

            #logreg-forms  .social-login{
                width:200px;
                margin:0 auto;
                margin-bottom: 10px;
            }
            #logreg-forms  .social-btn{
                font-size: 1.3rem;
                font-weight: 100;
                color:white;
                width:200px;
                height: 56px;

            }
            #logreg-forms .social-btn:nth-child(1){
                margin-bottom: 5px;
            }
            #logreg-forms .social-btn span{
                display: none;
            }
            #logreg-forms  .facebook-btn:after{
                content:'Facebook';
            }

            #logreg-forms  .google-btn:after{
                content:'Google+';
            }

        }
    </style>
    <title>New Password</title>
</head>
<body>
<div id="logreg-forms">
    <c:if test="${HError}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Change Failed!</strong> ${Error}
        </div>
    </c:if>
    <form action="" method="post" class="form-signin">
        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">New Password</h1>
<%--        <input type="text" id="txtUsername" class="form-control"  name="UserName" readonly value="${AuthUser.userName}">--%>
        <input type="text" id="txtUsername" class="form-control" placeholder="User Name" name="UserName" required="" autofocus="">
        <input type="password" id="txtPassword" class="form-control" placeholder="Old Password" name="PassWord" required="">
        <input type="password" id="txtNewPassword" class="form-control" placeholder="New Password" name="rawpwd" autofocus>
        <br><br>
        <button class="btn btn-outline-success btn-block" type="submit" href="${pageContext.request.contextPath}/account/changepw"><i class="fas fa-sign-in-alt"></i>Change Password</button><br>
        <hr>
        <a href="${pageContext.request.contextPath}/account/profile" id="cancel_signup"><i class="fas fa-angle-left"></i>Profile</a>
    </form>
    <br>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
    $('#logreg-forms').on('submit', function (e) {
        if(${HError}) {
            alert('Successful Change');
            return;
        }
    });
</script>

</body>
</html>