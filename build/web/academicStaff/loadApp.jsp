<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List of Applications</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .container-fluid{
                margin:0!important;
                padding: 0!important;
            }
            .table {
                width: 100%;
            }
            .table th, .table td {
                text-align: center;
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %>
            <h1 class="mt-4">List of Applications</h1>
            <table class="table table-bordered mt-4">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Student Name</th>
                        <th>Student ID</th>
                        <th>View</th>
                        <th>Status</th>
                        <th>Create Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="application" items="${applications}">
                        <tr>
                            <td>${application.id}</td>
                            <td>${application.student.name}</td>
                            <td>${application.student.id}</td>
                            <td>
                                <form action="load" method="post">
                                    <input type="hidden" name="applicationId" value="${application.id}">
                                    <a href="${pageContext.request.contextPath}/acad/viewContent?id=${application.id}" class="btn btn-primary">View</a>
                                </form>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${application.isApprove}">
                                        <span class="badge badge-success">Approved</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-danger">Not yet</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <fmt:formatDate value="${application.create_date}" pattern="dd-MM-yyyy" var="formattedDate" />${formattedDate}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="?page=1">&laquo;</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage - 1}">&lt;</a>
                        </li>
                    </c:if>

                    <c:forEach begin="1" end="${totalPages}" var="page">
                        <li class="page-item ${page == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${page}">${page}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage + 1}">&gt;</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="?page=${totalPages}">&raquo;</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>