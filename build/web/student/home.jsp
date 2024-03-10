<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
        </style>
    </head>
    <body>
        <div class="container-fluid px-0">
            <%@include file="./navbar.jsp" %>
            <div class="container feature-section">
                <%@include file="../carousel.jsp" %>
                <div class="row row-cols-1 row-cols-md-3 g-4 my-2">
                    <div class="col">
                        <div class="card feature-card">
                            <div class="card-header feature-card-header text-center">
                                <i class="fas fa-newspaper"></i>
                                <h4 class="d-inline-block ms-2">News Feed</h4>
                            </div>
                            <div class="card-body feature-card-body">
                                <a href="${pageContext.request.contextPath}/student/news">
                                    <i class="far fa-envelope"></i>Latest News
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card feature-card">
                            <div class="card-header feature-card-header text-center">
                                <i class="fas fa-calendar-alt"></i>
                                <h4 class="d-inline-block ms-2">Academic Information</h4>
                            </div>
                            <div class="card-body feature-card-body">
                                <a href="${pageContext.request.contextPath}/student/schedule?id=${sessionScope.accountId}">
                                    <i class="far fa-calendar-alt"></i>Weekly Timetable
                                </a>
                                <a href="${pageContext.request.contextPath}/student/slottoday?id=${sessionScope.accountId}" class="d-block mt-2">
                                    <i class="fas fa-calendar-day"></i>Schedule Today
                                </a>
                                <a href="${pageContext.request.contextPath}/student/studentlist" class="d-block mt-2">
                                    <i class="fas fa-users"></i>Student List
                                </a>
                                <a href="${pageContext.request.contextPath}/student/attreport?id=${sessionScope.accountId}" class="d-block mt-2">
                                    <i class="fas fa-chart-bar"></i>Attendance Statistic
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card feature-card">
                            <div class="card-header feature-card-header text-center">
                                <i class="fas fa-clipboard-list"></i>
                                <h4 class="d-inline-block ms-2">Application</h4>
                            </div>
                            <div class="card-body feature-card-body">
                                <a href="${pageContext.request.contextPath}/student/createApplication">
                                    <i class="fas fa-envelope-open-text"></i>Send Application
                                </a>
                                <a href="${pageContext.request.contextPath}/student/viewStatus" class="d-block mt-2">
                                    <i class="fas fa-clipboard-check"></i>Application Status
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