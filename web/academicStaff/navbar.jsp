<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
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
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a href="#" class="navbar-brand mx-4">FPT UNIVERSITY</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/acad/home" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Home"><i class="fa-solid fa-house"></i> Home</a>
                        </li>
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="listclass"><i class="fa-solid fa-clipboard-list"></i> Manage Class</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/acad/searchstu" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Search Student"><i class="fa-solid fa-magnifying-glass"></i> Search Student</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/acad/listNews" data-bs-toggle="tooltip" data-bs-placement="bottom" title="List News"><i class="fa-solid fa-newspaper"></i> List News</a>
                        </li>
                    </ul>
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
        <script>
            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
            const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
        </script>
    </body>
</html>