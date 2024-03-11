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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            .container-fluid{
                margin: 0!important;
                padding: 0!important;
            }
            .table {
                border: none;
                margin-top: 1rem;
            }
            .table > thead > tr > th,
            .table > tbody > tr > td {
                padding: 0.5rem 1rem;
                vertical-align: middle;
                border-bottom: 1px solid #ddd;
            }
            .table > thead > tr > th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %>
            <div class="container mt-4">
                <h2>News List</h2>
                <a href="${pageContext.request.contextPath}/acad/createNews" class="btn btn-primary mb-3"><i class="fas fa-plus"></i> Create New</a>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Title</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="news" items="${listNews}">
                            <tr>
                                <td>${news.id}</td>
                                <td>
                                    <span class="create-date">
                                        <i class="far fa-calendar-alt"></i>
                                        <fmt:formatDate value="${news.date}" pattern="dd/MM/yyyy"/>
                                    </span>
                                </td>
                                <td>${news.title}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/acad/updateNews?id=${news.id}" class="btn btn-sm btn-warning me-2"><i class="fas fa-edit"></i> Update</a>
                                    <form action="${pageContext.request.contextPath}/acad/deleteNews" method="post" style="display: inline-block;">
                                        <input type="hidden" name="id" value="${news.id}">
                                        <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>