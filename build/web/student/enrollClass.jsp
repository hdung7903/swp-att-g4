<%-- 
Document   : enroll
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
        <title>Enroll in Classes</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
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
        <div class="container mt-4">
            <h2>Search Subjects</h2>
            <form id="searchForm" action="${pageContext.request.contextPath}/student/enroll" method="GET" class="mb-4">
                <div class="input-group">
                    <input class="form-control" placeholder="Enter subject name" name="search" value="${searchTxt}">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                </div>          
            </form>
            <c:if test="${empty gsm}">
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <i class="fa fa-exclamation-triangle" aria-hidden="true"></i> 
                        <div>
                             Subject can't be found
                        </div>
                    </div>
            </c:if>
            <c:if test="${not empty gsm}">   
                <div class="card">
                    <h2 class="card-title text-center mb-4">Class Register <i class="fa fa-chalkboard-teacher"></i></h2>
                        <c:choose>
                            <c:when test="${not empty mess}">
                                <c:choose>
                                    <c:when test="${mess == 'Register successfull!'}">
                                    <div class="alert alert-success text-center" role="alert">
                                        <i class="fa fa-check-circle"></i> ${mess}
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="alert alert-danger text-center" role="alert">
                                        <i class="fa fa-exclamation-circle"></i> ${mess}
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                    </c:choose>

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
                                        <td>${g.totalStudent}</td>
                                        <td>
                                            <form id="enrollForm${loop.index}" action="${pageContext.request.contextPath}/student/enroll" method="POST">
                                                <input type="hidden" value="${g.subject.name}" name="subject_name"/>
                                                <input type="hidden" value="${g.group.id}" name="class_id"/>
                                                <button type="submit" class="btn btn-primary">Enroll <i class="fa fa-sign-in-alt"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>