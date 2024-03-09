<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .container-fluid{
                margin: 0!important;
                padding: 0!important;
            }
            body {
                background-color: #f4f6f9;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .feature-content {
                background-color: #ffffff;
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
                border-radius: 0.5rem;
                padding: 2rem;
            }
            .feature-header {
                background-color: #0d6efd;
                color: #ffffff;
                border-radius: 0.5rem 0.5rem 0 0;
                padding: 0.5rem 1rem;
                margin: -2rem -2rem 2rem -2rem;
            }
            .feature-link {
                color: #0d6efd;
                transition: color 0.15s ease-in-out;
            }
            .feature-link:hover {
                color: #024abc;
                text-decoration: none;
            }
            .feature-icon {
                font-size: 2rem;
                color: #0d6efd;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %>
            <div class="container my-5">
                <%@include file="../carousel.jsp" %>
                <div class="feature-content my-5">
                    <div class="row row-cols-1 row-cols-md-2 g-4">
                        <div class="col">
                            <div class="feature-header">
                                <i class="bi bi-pencil-square feature-icon"></i>
                                <h2 class="d-inline-block ms-3">Application</h2>
                            </div>
                            <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-action feature-link">
                                    <i class="fa-solid fa-envelope"></i> Send Application
                                </a>
                                <a href="#" class="list-group-item list-group-item-action feature-link">
                                    <i class="fa-solid fa-list-check"></i> Application Status
                                </a>
                                <a href="${pageContext.request.contextPath}/student/enroll" class="list-group-item list-group-item-action feature-link">
                                    <i class="fa-solid fa-envelope"></i> Register class
                                </a>
                            </div>
                        </div>
                        <div class="col">
                            <div class="feature-header">
                                <i class="bi bi-book feature-icon"></i>
                                <h2 class="d-inline-block ms-3">Academic Information</h2>
                            </div>
                            <div class="list-group">
                                <a href="${pageContext.request.contextPath}/student/feedback" class="list-group-item list-group-item-action feature-link">
                                    <i class="fa-solid fa-calendar-week"></i> Feedback about teaching
                                </a>
                                <a href="#" class="list-group-item list-group-item-action feature-link">
                                    <i class="fa-solid fa-calendar-day"></i> Schedule today
                                </a>
                                <a href="#" class="list-group-item list-group-item-action feature-link">
                                    <i class="fa-solid fa-users"></i> Student List
                                </a>
                                <a href="#" class="list-group-item list-group-item-action feature-link">
                                    <i class="fa-solid fa-chart-bar"></i> Attendance Statistic
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