<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.14.0/toastify.min.css" integrity="sha512-D0I6m33cU6Vb/F7JtS4v8GnGcI5JxMkTmD0J5jIz9f+0OzG+B5uRyi+PvE0qU6RqF3HmU9c8R/ZTk4mQb4Zw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.14.0/toastify.min.js" integrity="sha512-7n+KIyD1/1nZfPzJv4A5RkNK8WxLyVL0qGQwB+XN8q9+LcVqQ3h+/HUkKvEe5L3kMqU1x3YO/NvKjB+0H6GwA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <style>
            body {
                background-image: url('https://cdn.discordapp.com/attachments/1207588646270541874/1211569718100754514/bg-2.jpg?ex=65eead3a&is=65dc383a&hm=a7c45a356fe19b68e2c69ab561f14fc92d9b9c6bef9e275b802f803ceee81482&');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                height: 100vh;
                overflow-y: hidden;
            }

            .form-label {
                color: white;
            }

            .card {
                background-color: rgba(255, 255, 255, 0.8);
                backdrop-filter: blur(10px);
            }

            .login-success, .login-failed {
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="container my-5">
            <div class="row justify-content-center my-6">    
                <div class="col-md-6">
                    <div class="card shadow-lg">
                        <div class="card-body">
                            <h3 class="card-title text-center mb-4">Sign In</h3>
                            <form id="form" class="signin-form" action="login" method="post">                               
                                <div class="mb-3">
                                    <label for="username" class="form-label text-black">Username</label>
                                    <input name="username" type="text" class="form-control" placeholder="Enter your username" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label text-black">Password</label>
                                    <div class="input-group">
                                        <input name="password" type="password" class="form-control" placeholder="Enter your password" required>
                                        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                            <i class="fas fa-eye-slash"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="rememberMe">
                                    <label class="form-check-label" for="rememberMe">Remember me</label>
                                    <a href="${pageContext.request.contextPath}/account/forgotPassword" class="float-end">Forgot Password?</a>
                                </div>
                                <div class="g-recaptcha mb-3" data-sitekey="6LcXVF4pAAAAAB_m0xoYKzmMOj5pS1cZVp2wDJfJ"></div>
                                <div class="mb-3">
                                    <p id="error" class="text-danger"></p>
                                    <p class="text-danger">${mess}</p>
                                    <p class="text-success">${status}</p>
                                </div>

                                <button type="submit" class="btn btn-primary w-100 mb-3" onclick="handleLogin()">Sign In</button>
                                <h5 class="text-center">OR</h5>

                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:9999/AttendanceSystem/LoginGoogleHandler&response_type=code&client_id=105080679537-2ard711gqiernlhfflh57gv5jm6tt3sm.apps.googleusercontent.com&approval_prompt=force" class="btn btn-danger w-100">
                                    <i class="fab fa-google"></i> Login with Google
                                </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                    document.getElementById("togglePassword").addEventListener("click", function () {
                                        var passwordInput = document.getElementsByName("password")[0];
                                        var eyeIcon = document.getElementById("togglePassword").querySelector("i");

                                        if (passwordInput.type === "password") {
                                            passwordInput.type = "text";
                                            eyeIcon.classList.remove("bi-eye-slash-fill");
                                            eyeIcon.classList.add("bi-eye-fill");
                                        } else {
                                            passwordInput.type = "password";
                                            eyeIcon.classList.remove("bi-eye-fill");
                                            eyeIcon.classList.add("bi-eye-slash-fill");
                                        }
                                    });

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
                                    function showSuccessNotification(message) {
                                        Toastify({
                                            text: message,
                                            duration: 3000,
                                            close: true,
                                            backgroundColor: "#4caf50",
                                            gravity: "top",
                                            position: "right",
                                            stopOnFocus: true,
                                            onClick: function () {}
                                        }).showToast();
                                    }
                                    function showErrorNotification(message) {
                                        Toastify({
                                            text: message,
                                            duration: 3000,
                                            close: true,
                                            backgroundColor: "#f44336",
                                            gravity: "top",
                                            position: "right",
                                            stopOnFocus: true,
                                            onClick: function () {}
                                        }).showToast();
                                    }
        </script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </body>
</html>
