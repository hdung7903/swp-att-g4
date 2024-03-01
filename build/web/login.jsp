<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://cdn.discordapp.com/attachments/1207588646270541874/1211569718100754514/bg-2.jpg?ex=65eead3a&is=65dc383a&hm=a7c45a356fe19b68e2c69ab561f14fc92d9b9c6bef9e275b802f803ceee81482&');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 100vh;
        }

        .container {
            margin-top: 120px;
        }

        .form-label {
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-4">Sign In</h3>
                        <form id="form" class="signin-form" action="login" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input name="username" type="text" class="form-control" placeholder="Enter your username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <div class="input-group">
                                    <input name="password" type="password" class="form-control" placeholder="Enter your password" required>
                                    <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                        <i class="bi bi-eye-slash-fill"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="rememberMe">
                                <label class="form-check-label" for="rememberMe">Remember me</label>
                                <a href="account/forgotPassword.jsp" class="float-end">Forgot Password?</a>
                            </div>
                            <div class="g-recaptcha mb-3" data-sitekey="6LcXVF4pAAAAAB_m0xoYKzmMOj5pS1cZVp2wDJfJ"></div>
                            <div class="mb-3">
                                <p id="error" class="text-danger"></p>
                                <p class="text-danger">${mess}</p>
                                <p class="text-success">${status}</p>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 mb-3">Sign In</button>
                            <h5 class="text-center">OR</h5>
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:9999/AttendanceSystem/LoginGoogleHandler&response_type=code&client_id=105080679537-2ard711gqiernlhfflh57gv5jm6tt3sm.apps.googleusercontent.com&approval_prompt=force" class="btn btn-primary w-100">Login with Google</a>
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
    </script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>
</html>