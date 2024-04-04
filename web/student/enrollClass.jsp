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
            .notification {
                background-color: #ffcccc;
                border-radius: 5px;
                padding: 10px 20px;
                margin: 20px 0;
            }
            .notification strong {
                font-weight: bold;
            }
            .notification p {
                margin: 0;
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
        <div class="container">
            <h2>Search Subjects</h2>
            <form id="searchForm" action="${pageContext.request.contextPath}/student/enroll" method="GET">
                <div class="input-group mb-3">
                    <input class="form-control" placeholder="Enter subject name" name="search" value="${searchTxt}">
                    <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i></button>
                </div>
            </form>
            <div class="notification">
                <p><strong>The maximum number of subjects currently being studied and registered is 5.</strong></p>
            </div>

            <div class="card">          
                <div class="row">
                    <div class="col-md-6">
                        <h3>Subjects Learned: </h3>
                        <ul>
                            <c:forEach var="subject" items="${subjectsLearn}">
                                <li>${subject.name}</li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <h3>Subjects Registered: </h3>
                        <ul>
                            <c:forEach var="subject" items="${subjectsRegisted}">
                                <li>${subject.name}</li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="card">
                <h2 class="text-center mb-4"> Class Register<i class="fas fa-chalkboard-teacher"></i></h2>
                    <c:if test="${mess2 == 'The number of subjects currently being studing and registered has reached the limit!' }">
                    <div class="alert alert-danger" role="alert">
                        ${mess2}
                    </div>
                </c:if>
                <c:if test="${mess1 == 'You have learned this subject !' and not empty searchTxt}">
                    <div class="alert alert-danger" role="alert">
                        ${mess1}
                    </div>
                </c:if>
                <c:if test="${mess1 == 'You should search for these subjects: ' and not empty searchTxt}">
                    <div class="alert alert-danger" role="alert">
                        ${mess1}
                        <ul>
                            <c:forEach var="subject" items="${subjectsNotLearn}">
                                <li>${subject.name}</li>
                                </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <c:choose>
                    <c:when test="${mess == 'Register successfull!'}">
                        <div class="alert alert-success" role="alert">
                            ${mess}
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-danger" role="alert">
                            ${mess}
                        </div>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${not empty requestScope.gsm and mess1 != 'You have learned this subject !' and empty mess2 }">
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
                    </c:when>
                </c:choose>
            </div>
        </div>
    </body>
</html>
