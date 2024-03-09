<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student list</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
            }
            .container-fluid{
                margin: 0!important;
                padding: 0!important;
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
        </style>
        <script>
            function submitForm() {
                document.getElementById("classForm").submit();
            }

            function submitSearch() {
                document.getElementById("searchForm").submit();
            }

            document.getElementById("searchInput").addEventListener("keyup", function (event) {
                if (event.key === "Enter") {
                    submitSearch();
                }
            });
        </script>
    </head>
    <body>
        <%@include file="./navbar.jsp" %>
        <div class="container">
            <div class="container">
                <div class="card">
                    <div class="row">
                        <div class="col-md-6">
                            <h2 class="card-title">Your Class</h2>
                            <form id="classForm" action="${pageContext.request.contextPath}/instructor/studentlist" method="get">
                                <div class="mb-3">
                                    <select class="form-select" id="classSelect" name="class_id" onchange="submitForm()">
                                        <option selected disabled>Select a Group</option>
                                        <c:forEach items="${requestScope.gsm}" var="g" varStatus="index">
                                            <option value="${g.group.id}" ${g.group.id == param.class_id ? 'selected' : ''}>${g.group.name} - ${g.subject.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-6">
                            <h2 class="card-title">Search by name-id-mail:</h2>
                            <form id="searchForm" action="${pageContext.request.contextPath}/instructor/studentlist" method="get">
                                <div class="input-group mb-3">
                                    <input class="form-control" placeholder="Search" name="search" value="${searchTxt}">
                                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i></button>
                                </div>          
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <c:set var="scm" value="${requestScope.scm}"/>
        <c:if test="${not empty scm}">
            <div class="card">
                <h2 class="card-title">Student List</h2>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr class="text-center">
                                <th>Index</th>
                                <th>Image</th>
                                <th>ID</th>
                                <th>Full Name</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.scm}" var="scm" varStatus="index">
                                <tr class="text-center">
                                    <td>${index.index + 1}</td>
                                    <td><img src="" alt="Image" class="img-thumbnail"></td>
                                        <c:choose>
                                            <c:when test="${not empty scm.student}">
                                            <td>${scm.student.id}</td>
                                            <td>${scm.student.name}</td>
                                            <td>${scm.student.email}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td colspan="3">Student Data Unavailable</td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>
    </body>
</html>