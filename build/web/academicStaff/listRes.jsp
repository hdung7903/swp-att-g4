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
        <title>Class list</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
            .pagination{
                display: inline-block;
            }
            .pagination a{
                color: black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active{
                background-color: #4a61e4;
                color: white;
            }
            .pagination a:hover:not(.active){
                background-color: chocolate;
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
        <div class="card">
                <h2 class="card-title">Entry requirements</h2>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr class="text-center">
                                <th>Class ID</th>
                                <th>Class Name</th>
                                <th>Student ID</th>
                                <th>Student Name</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listRes}" var="listRes" >
                                <tr class="text-center">
                                    <td>${listRes.group.id}</td>
                                    <td>${listRes.group.name}</td>
                                    <td>${listRes.student.id}</td>
                                    <td>${listRes.student.name}</td>
                                    <td>
                                        <a class="me-3" href="#"  onclick="doApprove('${listRes.id}',  '${listRes.group.name}',  '${listRes.group.id}', '${listRes.student.name}', '${listRes.student.id}')">Approve</a>
                                        <a class="ms-3" href="#" onclick="doDelete('${listRes.id}')">Denied</a>
                                    </td>
                                </tr>
                                <script type="text/javascript">
                                    function doDelete(id) {
                                        if (confirm("Are you sure you want to denied this requirment?")) {
                                            window.location = "deleteregis?id=" + id;
                                        }
                                    }
                                </script>
                                <script type="text/javascript">
                                    function doApprove(id, class_name, class_id, student_name, student_id) {
                                        if (confirm("Are you sure you want to add " + student_name + " into " + class_name + "?" )) {
                                            window.location = "approveregis?id=" + id + "&class_id=" + class_id + "&student_id=" + student_id;
                                        }
                                    }
                                </script>
                            </c:forEach>
                        </tbody>
                    </table>
                        <a href="home">BACK TO HOME</a>
                </div>
            </div>
    </body>
</html>