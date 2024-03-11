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
        <title>Insert Subject</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
        <div class="container mt-4">
            <div class="card">
                <h2 class="card-title">Class List</h2>
                <div class="d-flex gap-2 mb-3">
                    <a href="${pageContext.request.contextPath}/acad/assignsub" class="btn btn-primary"><i class="fa fa-calendar-check"></i> Assigned Subject</a>
                    <a href="${pageContext.request.contextPath}/acad/removesub" class="btn btn-danger"><i class="fa fa-calendar-times"></i> Remove Subject</a>
                </div>
                <div class="table-responsive">
                    <form id="" action="subject" method="POST">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr class="text-center">
                                    <th>Subject ID</th>
                                    <th>Subject Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listSub}" var="listSub" varStatus="loop">
                                    <tr class="text-center">
                                        <td>${listSub.id}</td>
                                        <td>${listSub.name}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <p class="text-danger fs-5" >${requestScope.mess}</p>
                        <div class="mb-3">
                            <label for="id" class="form-label">Subject ID</label>
                            <input type="text" class="form-control" name="id" id="id" required>
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Subject Name</label>
                            <input type="text" class="form-control" name="name" id="name" required>
                        </div>
                        <button type="submit" name="submit" id="submit" class="btn btn-success">Insert</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>