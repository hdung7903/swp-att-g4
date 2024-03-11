<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                background-color: #f4f6f9;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .feature-section {
                padding: 3rem 0;
            }
            .feature-card {
                background-color: #ffffff;
                border: none;
                border-radius: 0.5rem;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out;
            }
            .feature-card:hover {
                transform: translateY(-5px);
            }
            .feature-card-header {
                background-color: #0d6efd;
                color: #ffffff;
                padding: 1rem;
                border-radius: 0.5rem 0.5rem 0 0;
            }
            .feature-card-body {
                padding: 1.5rem;
            }
            .feature-card-body i {
                color: #0d6efd;
                margin-right: 0.5rem;
            }
            .feature-card-body a {
                text-decoration: none;
                color: #0d6efd;
                transition: color 0.15s ease-in-out;
            }
            .feature-card-body a:hover {
                color: #024abc;
            }
            .navbar-brand {
                color: #fff;
                font-weight: bold;
                font-size: 1.5rem;
            }
            .navbar-dark .navbar-nav .nav-link {
                color: rgba(255, 255, 255, 0.55);
            }
            .navbar-dark .navbar-nav .nav-link:hover,
            .navbar-dark .navbar-nav .nav-link:focus {
                color: rgba(255, 255, 255, 0.75);
            }
            .navbar-dark .navbar-nav .active>.nav-link {
                color: #fff;
            }
            .user-dropdown img {
                border: 2px solid #fff;
            }
            .user-dropdown .dropdown-toggle::after {
                display: none;
            }
            .user-dropdown .dropdown-menu {
                right: 0;
                left: auto;
            }
            .user-dropdown .dropdown-item {
                padding: 10px;
                transition: background-color 0.3s;
            }
            .user-dropdown .dropdown-item:hover {
                background-color: #f8f9fa;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid px-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a href="#" class="navbar-brand mx-4">FPT UNIVERSITY</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">                       
                        <div class="user-profile d-flex align-items-center me-4">
                            <a href="${pageContext.request.contextPath}/profile" class="text-decoration-none">
                                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2">
                                ${sessionScope.acc.username}
                            </a>
                            <a href="#" class="btn btn-outline-light ms-2" data-bs-toggle="modal" data-bs-target="#logoutModal">
                                <i class="fas fa-arrow-right-from-bracket"></i> Sign out
                            </a>
                        </div>
                    </div>
                </div>
                <%@include file="../modal/logoutModal.jsp" %>
            </nav>
            <div class="container feature-section">
                <%@include file="../carousel.jsp" %>
                <div class="row row-cols-1 row-cols-md-3 g-4 my-2">
                    <div class="col">
                        <div class="card feature-card">
                            <div class="card-header feature-card-header text-center">
                                <i class="bi bi-pencil-square"></i>
                                <h4 class="d-inline-block ms-2">Application</h4>
                            </div>
                            <div class="card-body feature-card-body">
                                <a href="${pageContext.request.contextPath}/acad/load">
                                    <i class="fa fa-list-alt"></i>List Application
                                </a>
                                <a href="${pageContext.request.contextPath}/acad/registion" class="d-block mt-2">
                                    <i class="fa fa-user-check"></i>Student Request
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card feature-card">
                            <div class="card-header feature-card-header text-center">
                                <i class="bi bi-book"></i>
                                <h4 class="d-inline-block ms-2">Academic Management</h4>
                            </div>
                            <div class="card-body feature-card-body">
                                <a href="${pageContext.request.contextPath}/acad/listclass">
                                    <i class="fa fa-chalkboard-teacher"></i>Manage Class
                                </a>
                                <a href="${pageContext.request.contextPath}/acad/searchstu" class="d-block mt-2">
                                    <i class="fa fa-users-cog"></i>Manage Student
                                </a>
                                <a href="${pageContext.request.contextPath}/acad/subject" class="d-block mt-2">
                                    <i class="fa fa-book"></i>Manage Subject
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card feature-card">
                            <div class="card-header feature-card-header text-center">
                                <i class="bi bi-megaphone"></i>
                                <h4 class="d-inline-block ms-2">News</h4>
                            </div>
                            <div class="card-body feature-card-body">
                                <a href="${pageContext.request.contextPath}/acad/listNews">
                                    <i class="fa fa-newspaper-o"></i>Manage News
                                </a>
                                <a href="${pageContext.request.contextPath}/acad/createNews" class="d-block mt-2">
                                    <i class="fa fa-plus-square"></i>Create News
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
            const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
        </script>
    </body>
</html>