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
                font-weight: bold;
                font-size: 1.5rem;
                transition: transform 0.3s ease;
            }
            .navbar-brand:hover {
                transform: scale(1.05);
            }
            .nav-link {
                transition: color 0.2s ease;
            }
            .nav-link:hover, .nav-link:focus {
                color: #f8f9fa !important;
            }
            .active .nav-link {
                color: #ffffff !important;
                background-color: rgba(255, 255, 255, 0.1);
                border-radius: 0.25rem;
            }
            .user-profile img {
                border-radius: 50%;
                transition: border-color 0.3s ease;
            }
            .user-profile img:hover {
                border-color: #f8f9fa;
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
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/student/home" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Home"><i class="fa-solid fa-house"></i> Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/student/schedule?id=${sessionScope.accountId}" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Schedule"><i class="fa-regular fa-calendar"></i> Schedule</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/student/slottoday?id=${sessionScope.accountId}" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Attendance"><i class="fa-solid fa-calendar-check"></i> Attendance</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/student/attreport?id=${sessionScope.accountId}" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Attendance Report"><i class="fa-solid fa-chart-bar"></i> Attendance Report</a>
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