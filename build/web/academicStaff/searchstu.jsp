<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search student</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container-fluid {
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

        .bi-search::before {
            content: "\f002";
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            font-style: normal;
        }
    </style>

    <script>
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
        <div class="card">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="card-title">Search by name-id-mail:</h2>
                    <form id="searchForm" action="${pageContext.request.contextPath}/acad/searchstu" method="get">
                        <div class="input-group mb-3">
                            <input id="searchInput" class="form-control" placeholder="Search" name="search" value="${searchTxt}">
                            <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <c:set var="students" value="${requestScope.scm}" />
        <c:if test="${not empty students}">
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
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${students}" var="student" varStatus="index">
                                <tr class="text-center">
                                    <td>${index.index + 1}</td>
                                    <td><img src="path_to_student_image/${student.id}.jpg" alt="Image" class="img-thumbnail"></td>
                                    <td>${student.id}</td>
                                    <td>${student.name}</td>
                                    <td>${student.email}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/acad/attreport?student_id=${student.id}" class="text-danger font-weight-bold">View Statistic</a>
                                        / <a href="${pageContext.request.contextPath}/acad/viewfb?student_id=${student.id}" class="font-weight-bold">View Feedback</a>
                                        <input type="hidden" name="student_id" value="${student.id}" />
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>
    </div>
</body>

</html>
