<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="welcome">

        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container-fluid">
                        <a class="navbar-brand" href="#">Attendance System</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                        <c:if test ="${sessionScope.acc == null}">
                            <ul class="navbar-nav">                    
                                <li class="nav-item">
                                    <a style="font-size:20px" class="nav-link" href="Login.jsp">Login</a>
                                </li>
                            </ul>
                        </c:if>
                    </div>
                </div>
            </nav>
        </header>

        <main class="container mt-5">
            <div class="text-center">
                <p class="fs-3">Welcome to</p>
                <h1 class="display-2 text-primary">Jason's Classroom</h1>
                <blockquote class="fs-4">A place to study for your High School Equivalency Diploma</blockquote>
            </div>
        </main>


        <div id="message" class="modal fade" tabindex="-1" aria-labelledby="messageLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="messageLabel">Contact</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Coming soon...</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer mt-auto py-3 bg-primary text-white">
            <div class="container text-center">
                <p>&copy; 2016 Jason</p>
            </div>
        </footer>
        <%@include file="./modal/loginModal.jsp" %>
    </body>
</html>
