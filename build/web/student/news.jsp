<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>News List</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .container-fluid {
                margin: 0!important;
                padding: 0!important;
            }
            .news-card {
                margin-bottom: 15px;
            }
            .news-title {
                font-weight: bold;
                color: #212529;
                text-decoration: none;
            }
            .news-excerpt {
                color: #6c757d;
                font-size: 0.9rem;
            }
            .create-date {
                color: #76b7e9;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %>
            <div class="container mt-4">
                <h2>News Feed</h2>
                <div class="row">
                    <c:forEach var="news" items="${newsList}">
                        <div class="col-md-6 col-lg-4 mb-3">
                            <div class="card news-card">
                                <div class="card-body">
                                    <a href="${pageContext.request.contextPath}/student/newsDetail?id=${news.id}" class="news-title">${news.title}</a>
                                    <hr class="mb-2">
                                    <span class="create-date">
                                        <i class="far fa-calendar-alt"></i>
                                        <fmt:formatDate value="${news.date}" pattern="dd/MM/yyyy"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
