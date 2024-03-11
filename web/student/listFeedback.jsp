<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Feedback</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome Icons -->
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
            .img-thumbnail {
                max-width: 50px;
                max-height: 50px;
            }
        </style>
        <script>
            function submitForm() {
                document.getElementById("classForm").submit();
            }
        </script>
    </head>
    <body>
        <%@ include file="./navbar.jsp" %>

        <div class="container">
            <div class="card">
                <h2 class="card-title">List Feedback</h2>
                <form id="classForm" action="${pageContext.request.contextPath}/student/feedback" method="get">
                    <div class="mb-3">
                        <select class="form-select" id="classSelect" name="csm_id" onchange="submitForm()">
                            <option selected disabled>Select a Group</option>
                            <c:forEach items="${requestScope.gsm}" var="g" varStatus="index">
                                <option value="${g.gsm.id}" ${g.gsm.id == param.csm_id ? 'selected' : ''}>${g.group.name} - ${g.subject.name} - ${g.instructor.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
                <h2 class="card-title">Feedback Action</h2>
                <div class="card-body">
                    <c:set var="fb" value="${requestScope.fb}"/>
                    <c:choose>
                        <c:when test="${not empty fb}">
                            <a href="${pageContext.request.contextPath}/student/editfb?csm_id=${param.csm_id}" class="btn btn-primary">
                                <i class="far fa-edit"></i> Edit Feedback
                            </a>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${not empty param.csm_id}">
                                <a href="${pageContext.request.contextPath}/student/takefb?csm_id=${param.csm_id}" class="btn btn-danger">
                                    <i class="fas fa-clipboard-list"></i> Take Feedback
                                </a>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <!-- Bootstrap 5 JS Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Font Awesome JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    </body>
</html>