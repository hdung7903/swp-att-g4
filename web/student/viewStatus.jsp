<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Applications</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            td, th {
                text-align: center;
                vertical-align: middle !important;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%@include file="./navbar.jsp" %>
            <h1 class="mt-4">List of Applications</h1>
            <table class="table table-bordered mt-4">
                <thead class="thead-dark">
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
                            <td>${app.create_date}</td>
                            <td>${app.content}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${app.isSpend}">
                                        <c:choose>
                                            <c:when test="${app.isApprove}">
                                                <span class="badge badge-success">Chấp Nhận</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-danger">Từ chối</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        not view
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${app.comment}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <a href="${pageContext.request.contextPath}/student/createApplication?id=${sessionScope.accountId}"> Create Application </a>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
