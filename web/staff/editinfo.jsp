<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .container {
                background-color: #fff;
                border-radius: 10px;
                padding: 30px;
                box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
                margin-top: 50px;
            }

            .card-title {
                font-size: 1.25rem;
            }

            .form-control-comment {
                height: 150px;
                resize: vertical;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }
        </style>
    </head>

    <body>
        <%@include file="./navbar.jsp" %>

        <div class="container">
            <c:set var="iList" value="${requestScope.iList}"/>
            <c:set var="stuList" value="${requestScope.stuList}"/>
            <c:choose>
                <c:when test="${not empty iList}">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <form action="${pageContext.request.contextPath}/staff/editinfo" method="POST">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr class="text-center">
                                            <th>id</th>
                                            <th>username</th>
                                            <th>password</th>
                                            <th>role_id</th>
                                            <th>Full Name</th>
                                            <th>email</th>
                                            <th>dob</th>
                                            <th>gender</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.iList}" var="i">
                                            <tr class="text-center">
                                                <td>${i.instructor.id}</td>
                                                <td>${i.username}</td>
                                                <td>${i.password}</td>
                                                <td>${i.role_id}</td>
                                                <td>${i.instructor.name}</td>
                                                <td>${i.instructor.email}</td>
                                                <td>${i.instructor.dob}</td>
                                                <td>${i.instructor.gender}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <input type="hidden" value="" name="csm_id">
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:if test="${not empty stuList}">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <form action="${pageContext.request.contextPath}/staff/editinfo" method="POST">
                                    <table class="table table-bordered">
                                        <thead class="thead-dark">
                                            <tr class="text-center">
                                                <th>id</th>
                                                <th>username</th>
                                                <th>password</th>
                                                <th>role_id</th>
                                                <th>Full Name</th>
                                                <th>email</th>
                                                <th>dob</th>
                                                <th>gender</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.stuList}" var="stu" varStatus="index">
                                                <tr class="text-center">
                                                    <td>${stu.student.id}</td>
                                                    <td>${stu.username}</td>
                                                    <td>${stu.password}</td>
                                                    <td>${stu.role_id}</td>
                                                    <td>${stu.student.name}</td>
                                                    <td>${stu.student.email}</td>
                                                    <td>${stu.student.dob}</td>
                                                    <td>${stu.student.gender}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <input type="hidden" value="" name="csm_id">
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
