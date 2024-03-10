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
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/admin/home" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Home"><i class="fa-solid fa-house"></i> Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/admin/manageacc" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Manage Account"><i class="fa-regular fa-calendar"></i> Manage Account</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/createacc?action=add">Add</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/manageacc?action=deletedList">Inactive</a>
                        </li>
                    </ul>
                    <div class="user-dropdown dropdown">
                        <a class="d-flex align-items-center text-decoration-none dropdown-toggle me-4" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle me-2">
                            ${sessionScope.acc.username}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile"><i class="fa-solid fa-user me-2"></i>Profile</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal">
                                    <i class="fa-solid fa-arrow-right-from-bracket me-2"></i>Sign out
                                </a>
                            </li>                        
                        </ul>
                    </div
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