<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enroll in Classes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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
            .form-select {
                max-width: 100%;
            }
        </style>
        <script>
            function submitSearch() {
                document.getElementById("searchForm").submit();
            }
        </script>
    </head>
    <body>
        <%@include file="./navbar.jsp" %>
        <h2>Search Subjects</h2>
        <form id="searchForm" action="${pageContext.request.contextPath}/student/enroll" method="GET">
            <div class="input-group mb-3">
                <input class="form-control" placeholder="Enter subject name" name="search" value="${searchTxt}">
                <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i></button>
            </div>          
        </form>

        <div class="card">
            <h2 class="text-center mb-4">Enroll Class <i class="fas fa-chalkboard-teacher"></i></h2>
            <p style="color: red; font-size: 18px">${mess}</p>
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr class="text-center">
                            <th>Class Name</th>
                            <th>Number of Students</th>
                            <th>Enroll</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.gsm}" var="g" varStatus="loop">
                            <tr class="text-center">
                                <td>${g.group.name}</td>
                                <td>${g.numStudents}</td>
                                <td>
                                    <form id="enrollForm${loop.index}" action="${pageContext.request.contextPath}/student/enroll" method="POST">
                                        <input type="hidden" value="${g.subject.name}" name="subject_name"/>
                                        <input type="hidden" value="${g.group.id}" name="class_id"/>
                                        <button type="submit" class="btn btn-primary center">Enroll</button>
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
