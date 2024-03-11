<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>News Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .create-date {
                color: #76b7e9;
                text-decoration: none;
            }
            .container-fluid{
                margin: 0!important;
                padding:0!important;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file='./navbar.jsp' %>
            <div class="container mt-4">
                <c:forEach var="details" items="${detail}">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h2 class="card-title">${details.title}</h2>
                              <span class="create-date">
                                <i class="far fa-calendar-alt"></i>
                                <fmt:formatDate value="${details.date}" pattern="dd/MM/yyyy"/>
                            </span>
                            <hr class="my-3">
                            <p class="card-text">${details.content}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
