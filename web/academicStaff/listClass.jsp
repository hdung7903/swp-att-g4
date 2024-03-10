<%-- 
    Document   : listClass
    Created on : Mar 4, 2024, 10:57:28 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Class List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
            }
            .container {
                padding: 20px;
            }
            .card {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                padding: 20px;
                margin-bottom: 20px;
            }
            .card-title {
                color: #007bff;
                font-size: 24px;
                margin-bottom: 20px;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
                transition: background-color 0.3s;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .table {
                background-color: #fff;
                box-shadow: 0 0 5px rgba(0,0,0,0.05);
            }
            .table thead th {
                font-size: 14px;
                background-color: #f8f9fa;
                border-bottom: none;
            }
            .table tbody td {
                font-size: 14px;
            }
            .table tbody tr:hover {
                background-color: #f0f0f0;
            }
            .img-thumbnail {
                max-width: 50px;
                max-height: 50px;
            }
            .pagination {
                display: inline-block;
            }
            .pagination a {
                color: black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active {
                background-color: #4a61e4;
                color: white;
            }
            .pagination a:hover:not(.active) {
                background-color: chocolate;
            }
        </style>
    </head>
    <body>
        <%@include file="./navbar.jsp" %>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">Class List</h2>
                    <a href="info" class="btn btn-primary mb-3"><i class="fas fa-plus me-2"></i>Create Class</a>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr class="text-center">
                                    <th>Class Name</th>
                                    <th>Link Meet</th>
                                    <th>View Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listG}" var="listG">
                                    <tr class="text-center">
                                        <td>${listG.name}</td>
                                        <td>${listG.link_url}</td>
                                        <td><a href="details?id=${listG.id}"><i class="fas fa-eye"></i></a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <c:set var="page" value="${requestScope.page}" />
                        <div class="d-flex justify-content-center mb-2">
                            <div class="pagination">
                                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                    <a class="${i==page?"active":""}" href="listclass?page=${i}">${i}</a>
                                </c:forEach>
                            </div>
                        </div>                     
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>