<%-- 
    Document   : newPassword
    Created on : Jan 29, 2024, 8:32:41 AM
    Author     : leduy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="text-center">
                            <h1 style="margin-top: 20px">
                                <strong>Reset Password</strong>
                            </h1>
                        </div>
                        <div class="pt-3 pb-3">
                            <form class="form-horizontal" action="newPassword" method="POST">
                                <!-- User Name Input -->
                                <div class="form-group row justify-content-center px-3">
                                    <div class="col-9 px-0">
                                        <input type="password" name="password" placeholder="New Password"
                                               class="form-control border-info placeicon">
                                    </div>
                                </div>
                                <!-- Password Input -->
                                <div class="form-group row justify-content-center px-3">
                                    <div class="col-9 px-0" style="margin-top: 10px">
                                        <input type="password" name="confPassword"
                                               placeholder="Confirm New Password"
                                               class="form-control">
                                    </div>
                                </div>

                                <!-- Log in Button -->
                                <div class="form-group row justify-content-center">
                                    <div class="col-2 px-3 mt-3">
                                        <input type="submit" value="Reset"
                                               class="btn btn-block btn-info">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
