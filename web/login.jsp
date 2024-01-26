<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->

<!doctype html>
<html lang="en">
    <head>
        <title>Login Form</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/5.0.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/styleLogin.css">

    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="img" style="background-image: url(images/bg-2.jpg);">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Sign In</h3>
                                    </div>
                                    <div class="w-100">
                                    </div>
                                </div>
                                <c:set var="cookie" value="${pageContext.request.cookies}"/>
                                <form class="signin-form" action="login" method="post" >
                                    <p class="text-danger" >${mess}</p>
                                    
                                    <div style="position: relative" >
                                        <label class="label" for="name">Username</label>
                                        <input name="username" type="text" value="${cookie.cuser.value}" class="form-control" placeholder="Username">
                                    </div>
                                    
                                    <div style="position: relative">
                                        <label class="label" for="password">Password</label>    
                                        <img id="passicon" src="images/close-eye.jpg" style="width: 25px; position: absolute;
                                             cursor: pointer; top: 50px; right: 15px" onclick="togglePassword()">
                                        <input name="password" type="password" value="${cookie.cpass.value}" 
                                               id="password" class="form-control" placeholder="Password">                                       
                                    </div>
                                               
                                    <div style="position: relative; top:4px">
                                        <button type="submit" style="color: blue"class="form-control btn btn-primary rounded submit px-3">Sign In</button>
                                    </div>
                                               
                                    <h5 style="text-align: center; color: grey; position: relative; top:5px">OR</h5>
                                    
                                    <div>
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:9999/AttendanceSystem/LoginGoogleHandler&response_type=code
                                                &client_id=105080679537-2ard711gqiernlhfflh57gv5jm6tt3sm.apps.googleusercontent.com&approval_prompt=force"
                                                style="color: #004085"class="form-control btn btn-primary rounded submit px-3">Login with Google</a>
                                    </div>
                                    
                                    <div class="form-group d-md-flex" style="position: relative;top:3px">
                                        <div class="w-50 text-left">
                                            <label class="form-check">
                                                <input class="form-check-input" name="remember"
                                                       ${cookie.crmb!=null?'checked':''} type="checkbox" value="" id="form2Example31" />
                                                <label class="form-check-label" for="form2Example31"> Remember me </label>
                                            </label>
                                        </div>
                                        <div class="w-50 text-md-right">
                                            <a href="#">Forgot Password</a>                   
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                                 function togglePassword() {
                                                     var passwordInput = document.getElementById("password");
                                                     var passwordIcon = document.getElementById("passicon");

                                                     if (passwordInput.type === "password") {
                                                         passwordInput.type = "text";
                                                         passwordIcon.src = "images/open-eye.jpg";
                                                     } else {
                                                         passwordInput.type = "password";
                                                         passwordIcon.src = "images/close-eye.jpg";
                                                     }
                                                 }
        </script>

    </body>
</html>