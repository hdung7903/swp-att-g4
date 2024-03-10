<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Remove Assigned Subjects</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-4">
            <h1 class="mb-4">Remove Assigned Subjects</h1>

            <form action="${pageContext.request.contextPath}/acad/removesub" method="get">
                <div class="form-group">
                    <label for="instructorId">Select Instructor:</label>
                    <select id="instructorId" name="instructorId" class="form-control" required>
                        <option value="" disabled selected>Choose an instructor</option>
                        <c:forEach var="instructor" items="${requestScope.instructors}">
                            <option value="${instructor.id}" ${instructor.id eq requestScope.insid ? 'selected' : ''}>${instructor.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Show Assigned Subjects</button>
            </form>
            <c:if test="${not empty requestScope.assignedSubjects}">
                <hr>
                <h2>Assigned Subjects</h2>
                <form action="${pageContext.request.contextPath}/acad/removesub" method="post">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Subject Name</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="subject" items="${requestScope.assignedSubjects}">
                                <tr>
                                    <td>${subject.name}</td>
                                    <td><input type="checkbox" name="subjectIds" value="${subject.id}"></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <input type="hidden" name="instructorId" value="${requestScope.insid}">
                    <button type="submit" class="btn btn-danger">Remove Subjects</button>
                </form>
            </c:if>
            <c:if test="${empty requestScope.assignedSubjects}">
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                        <div>
                            Please choose an instructor
                        </div>
                    </div>

            </c:if>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>