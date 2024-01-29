<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            body {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
                overflow-x: hidden;
            }

            .container {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100vw;
            }

            .img {
                flex: 1;
                max-width: 50%; /* Điều chỉnh chiều rộng của hình ảnh */
            }

            .login-wrap {
                flex: 1;
                max-width: 50%;
                margin-top: 120px;/* Điều chỉnh chiều rộng của biểu mẫu đăng nhập */
            }
            .container{
                margin: 0!important;
                padding: 0!important;
            }
        </style>
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
                            <div class="img" >
                                <img src="https://cdn.discordapp.com/attachments/947741416992436235/1200439545934643270/bg-2.jpg?ex=65c62f72&is=65b3ba72&hm=4f1bb4e6cf91ec8e5044f28825ea2e96a8aae00765deaf9530838716d6144028&" alt="">
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
                                <form id="form" class="signin-form" action="login" method="post" >
<!--                                    <p class="text-danger" >${mess}</p>-->
                                    <div class="form-group mb-3">
                                        <label class="label" for="name">Username</label>
                                        <input  name="username" type="text" value="${cookie.cuser.value}" class="form-control" placeholder="Username" required>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="password">Password</label>
                                        <div class="input-group">
                                            <input name="password" type="password" value="" class="form-control" placeholder="Password" required>
                                            <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                                <span id="eyeIcon"><i class="bi bi-eye-slash-fill"></i></span>
                                            </button>

                                        </div>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="w-50 text-left">
                                            <label class="form-check">
                                                <input class="form-check-input" name="remember" ${cookie.crmb!=null?'checked':''} type="checkbox" value="" id="form2Example31" />
                                                <label class="form-check-label" for="form2Example31"> Remember me </label>
                                            </label>
                                        </div>
                                        <div class="w-50 text-right">
                                            <a href="account/forgotPassword.jsp">Forgot Password?</a>
                                        </div>
                                    </div>
                                    <div class="g-recaptcha" data-sitekey="6LcXVF4pAAAAAB_m0xoYKzmMOj5pS1cZVp2wDJfJ"></div>
                                    <p id="error" class="text-danger" ></p>
                                    <p class="text-danger" >${mess}</p>
                                    <p class="text-success" >${status}</p>
                                    <br><!-- comment -->
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign In</button>
                                    </div>
                                    <h5 style="text-align: center">OR</h5>
                                    <div>
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:9999/AttendanceSystem/LoginGoogleHandler&response_type=code
                                           &client_id=105080679537-2ard711gqiernlhfflh57gv5jm6tt3sm.apps.googleusercontent.com&approval_prompt=force"
                                           class="form-control btn btn-primary rounded submit px-3">Login with Google</a>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            document.getElementById("togglePassword").addEventListener("click", function () {
                var passwordInput = document.getElementsByName("password")[0];
                var eyeIcon = document.getElementById("eyeIcon");

                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    eyeIcon.innerHTML = '<i class="bi bi-eye-fill"></i>';
                } else {
                    passwordInput.type = "password";
                    eyeIcon.innerHTML = '<i class="bi bi-eye-slash-fill"></i>';
                }
            });
        </script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                let isValid = false;
                const form = document.getElementById("form");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    event.preventDefault();
                    const response = grecaptcha.getResponse();
                    if (response) {
                        form.submit();
                    } else {
                        error.innerHTML = "Please check";
                    }
                });
            };
        </script>
    </body>
</html>