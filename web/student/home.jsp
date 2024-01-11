
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <div class="container-fluid">                
            <%@include file="./navbar.jsp" %> 
            <div class="container">
                <header class="text-center mt-5">
                    <h1 class="display-2">Student Home Screen</h1>
                    <p class="lead">Template by w3.css</p>
                    <button class="btn btn-primary btn-lg">Get Started</button>
                </header>

                <!-- Content Section -->
                <div class="row mt-5">
                    <div class="col-md-8">
                        <h1 class="display-4">Lorem Ipsum</h1>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <i class="fa fa-anchor display-1 text-danger mt-5"></i>
                    </div>
                </div>

                <!-- Second Grid -->
                <div class="row bg-light mt-5 py-5">
                    <div class="col-md-4 text-center">
                        <i class="fa fa-coffee display-1 text-danger mt-5"></i>
                    </div>
                    <div class="col-md-8">
                        <h1 class="display-4">Lorem Ipsum</h1>
                        <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                </div>

                <!-- Quote of the Day -->
                <div class="container-fluid bg-black text-white text-center py-5">
                    <h1 class="display-3">Quote of the day: live life</h1>
                </div>

                <!-- Footer -->
                <footer class="container py-5 text-center text-muted">
                    <div class="display-4">
                        <i class="fa fa-facebook-official mx-3"></i>
                        <i class="fa fa-instagram mx-3"></i>
                        <i class="fa fa-snapchat mx-3"></i>
                        <i class="fa fa-pinterest-p mx-3"></i>
                        <i class="fa fa-twitter mx-3"></i>
                        <i class="fa fa-linkedin mx-3"></i>
                    </div>
                    <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
                </footer>
            </div>
        </div>
    </body>
</html>
