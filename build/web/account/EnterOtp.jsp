
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>OTP Page</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style type="text/css">
            .form-gap {
                padding-top: 70px;
            }
        </style>
    </head>
    <body>
        <div class="form-gap"></div>
        <div class="container">
            <div class="row">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="text-center">
                            <h3>
                                <i class="fa fa-lock fa-4x"></i>
                            </h3>
                            <h2 class="text-center">Enter OTP</h2>
                            <%
                                if(request.getAttribute("message")!=null){
                                    out.print("<p class='text-danger ml-1'>"+request.getAttribute("message")+"</p>");
                                }
                            %>

                            <div class="panel-body">

                                <form id="register-form" action="validateOtp" role="form" autocomplete="off"
                                      class="form" method="post">

                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i
                                                    class="glyphicon glyphicon-envelope color-blue"></i></span> 
                                            <input id="opt" name="otp" placeholder="Enter OTP"
                                                   class="form-control" type="text" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="recover-submit" style="margin-top: 10px"
                                               class="btn btn-lg btn-primary btn-block"
                                               value="Reset Password" type="submit">
                                    </div>

                                    <input type="hidden" class="hide" name="token" id="token"
                                           value="">
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
