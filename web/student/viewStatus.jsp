<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Applications</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
        <style>
            .container-fluid {
                margin: 0 !important;
                padding: 0 !important;
            }

            td, th {
                text-align: center;
                vertical-align: middle !important;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %>
            <div class="container">
                <h1 class="mt-4">List of Applications</h1>
                <a href="${pageContext.request.contextPath}/student/createApplication?id=${sessionScope.accountId}" class="btn btn-primary mt-3">
                    <i class="fas fa-plus"></i> Create Application
                </a>
                <table class="table table-bordered mt-4">
                    <thead class="bg-dark text-light">
                        <tr>
                            <th>ID</th>
                            <th>Create Date</th>
                            <th>Content</th>
                            <th>Status</th>
                            <th>Comment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${appByStu}">
                            <tr>
                                <td>${app.id}</td>
                                <td>
                                    <fmt:formatDate value="${app.create_date}" pattern="dd-MM-yyyy" var="formattedDate" />
                                    ${formattedDate}
                                </td>
                                <td>${app.content}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${app.isApprove}">
                                            <span class="badge bg-success"><i class="fas fa-check"></i> Approve</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger"><i class="fas fa-times"></i> Reject</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${app.comment}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    </body>
</html>
