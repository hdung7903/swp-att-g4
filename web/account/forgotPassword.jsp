<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Password Recovery</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                background-color: #f7f7f7;
                color: #5a5a5a;
                font-family: "Lato", sans-serif;
            }

            .card {
                border-radius: 8px;
                border: none;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .card-header, .card-footer {
                background-color: transparent;
                border-bottom: 1px solid #eaeaea;
                border-top: 1px solid #eaeaea;
                color: #5a5a5a;
                font-size: 1.1rem;
            }

            .btn-primary {
                background-color: #0088cc;
                border-color: #0088cc;
                border-radius: 4px;
                padding: 10px 25px;
                font-weight: 500;
            }

            .btn-primary:hover {
                background-color: #0077b3;
                border-color: #0077b3;
            }

            .form-control:focus {
                border-color: #66afe9;
                box-shadow: 0 0 0 0.2rem rgba(102, 175, 233, 0.5);
            }

            .form-text {
                font-size: 0.85rem;
            }

            h2 {
                font-weight: 700;
                margin-bottom: 10px;
            }

            p.text-muted {
                margin-bottom: 30px;
            }

            .fa-lock {
                color: #0088cc;
            }
        </style>
    </head>
    <body>
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="card">
                        <div class="card-header text-center">
                            <h2><i class="fa fa-lock me-2"></i>Password Recovery</h2>
                            <p class="text-muted">Follow the steps below to reset your password.</p>
                            <ol class="list-unstyled mb-4 text-start">
                                <li><i class="fa fa-user text-primary me-2"></i>Enter your username and email address below.</li>
                                <li><i class="fa fa-envelope text-primary me-2"></i>We'll send an OTP to your email.</li>
                                <li><i class="fa fa-key text-primary me-2"></i>Use the OTP to set a new password.</li>
                            </ol>
                        </div>
                        <div class="card-body">
                            <form action="forgotPassword" method="POST">
                                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                    ${requestScope.mess}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <div class="mb-3">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" required>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                    <div class="form-text">Enter your registered email address to receive the OTP.</div>
                                </div>
                                <div class="card-footer d-flex justify-content-between">
                                    <button type="submit" class="btn btn-primary">Get New Password</button>
                                    <a href="${pageContext.request.contextPath}/login-page" class="btn btn-outline-secondary">Back to Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
