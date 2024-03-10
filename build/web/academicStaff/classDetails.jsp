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
        </style>
    </head>
    <body>
        <%@include file="./navbar.jsp" %>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">Class List</h2>
                    <c:set value="${requestScope.class_id}" var="class_id"/>
                    <a href="addStudent?id=${class_id}" class="btn btn-primary mb-3"><i class="fas fa-plus me-2"></i>Create Class</a>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr class="text-center">
                                    <th>Class Name</th>
                                    <th>Subject</th>
                                    <th>Instructor</th>
                                    <th>Slots</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listGSM}" var="listGSM" varStatus="loop">
                                    <tr class="text-center">
                                        <td>${listGSM.group.name}</td>
                                        <td>${listGSM.subject.name}</td>
                                        <td>${empty listGSM.instructor.name ? 'Unknown' : listGSM.instructor.name}</td>
                                        <td>${listGSM.total_slots}</td>
                                        <td>
                                            <a href="updateclass?csm_id=${listGSM.id}&subject_id=${listGSM.subject.id}" class="text-primary me-2"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="text-danger" onclick="doDelete('${listGSM.id}', '${listGSM.group.id}', '${listGSM.group.name}', '${listGSM.subject.name}')"><i class="fas fa-trash-alt"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <a href="listclass" class="text-black" style="text-decoration:none"><i class="fas fa-arrow-left me-2"></i>Go Back</a>
                </div>
            </div>
        </div>

        <script>
            function doDelete(csm_id, class_id, class_name, subject_name) {
                if (confirm("Are you sure you want to delete class " + class_name + "-" + subject_name + "?")) {
                    window.location = "deleteclass?csm_id=" + csm_id + "&class_id=" + class_id;
                }
            }
        </script>
    </body>
</html>