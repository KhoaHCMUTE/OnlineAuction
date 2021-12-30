<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://fonts.googleapis.com/css?family=Raleway:300' rel='stylesheet' type='text/css'>
    <style>
        body {
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            height: 100vh;
        }

        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }
        #logreg-forms{
            width:412px;
            margin:10vh auto;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
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
            background-color: #ebfffe;
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
        #logreg-forms .form-reset, #logreg-forms .form-signup{ display: none; }
        #logreg-forms .form-signup .social-btn{ width:210px; }
        #logreg-forms .form-signup input { margin-bottom: 2px;}
        .form-signup .social-login{
            width:210px !important;
            margin: 0 auto;
        }
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
        }
    </style>
    <title>Account</title>
</head>
<body>
<div id="logreg-forms">
            <form method="post" class="form-signin" >
                <h1 class="h2 mb-3 font-weight-normal" style="text-align: center">New Account</h1><br>

                <input type="text" id="txtUsername" class="form-control" placeholder="User Name" name="UserName"  autofocus="">
                <input type="password" id="txtPassword" class="form-control" placeholder="Password" name="rawpwd" >
                <input type="text" id="txtName" class="form-control" placeholder="Name" name="Name" >
                <input type="email" id="txtEmail" class="form-control" placeholder="Email" name="Email" >
                <input type="text" id="txtDOB" class="form-control" placeholder="Date Of Birth" name="Dob" >
                <br>
                <button style="color: #f3f3f3" class="btn btn-outline-success btn-block" type="submit" ><i class="fas fa-user-plus"></i> Sign Up</button>
                <hr>
                <a style="color: white" href="${pageContext.request.contextPath}/account/login" id="cancel_signup"><i class="fas fa-angle-left"></i> Login</a>
            </form>
            <br>
        </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $('#logreg-forms').on('submit', function (e) {
        e.preventDefault();
        const UserName = $('#txtUsername').val();
        if (UserName.length === 0) {
            alert('Invalid username.');
            return;
        }
        const PassWord = $('#txtPassword').val();
        if (PassWord.length === 0) {
            alert('Invalid password.');
            return;
        }
        const Name = $('#txtName').val();
        if (Name.length === 0) {
            alert('Invalid name.');
            return;
        }
        const Email = $('#txtEmail').val();
        if (Email.length === 0) {
            alert('Invalid email.');
            return;
        }
        const Dob = $('#txtDOB').val();
        if (Dob.length === 0) {
            alert('Invalid Date Of Birth.');
            return;
        }
        $.getJSON('${pageContext.request.contextPath}/account/isavailable?User=' + UserName,function (data){
            if(data === true){
                $('#logreg-forms').off('submit').submit();
            } else {
                alert('Username is registered');
            }
        });
        $.getJSON('${pageContext.request.contextPath}/account/isavailablea?User1=' + Email,function (data1){
            if(data1 === true){
                $('#logreg-forms').off('submit').submit();

            } else {
                alert('This email is registered');
            }
        });
    });
    $('#txtDOB').datetimepicker({
        format: 'd/m/Y',
        timepicker: false,
        mask: true
    });
</script>
</body>
</html>