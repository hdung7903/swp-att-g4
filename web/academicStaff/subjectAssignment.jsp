<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Subject Assignment</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha256-dzpCJV1B6dSwA9fRjPb2yBAh9pF4WBKlTdLWU5/KOpU=" crossorigin="anonymous">
    </head>
    <body>

        <div class="container mt-5">
            <h1 class="mb-4">Subject Assignment</h1>

            <form action="${pageContext.request.contextPath}/acad/assignsub" method="get">
                <div class="mb-3">
                    <label for="instructorId" class="form-label">Instructor:</label>
                    <select id="instructorId" name="instructorId" class="form-select">
                        <option value="" disabled selected>Choose an instructor</option>
                        <c:forEach var="instructor" items="${instructors}">
                            <option value="${instructor.id}">${instructor.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Show Unassigned Subjects</button>
            </form>

            <br>

            <c:choose>
                <c:when test="${not requestScope.status}">
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                        <div>
                            Please choose a teacher
                        </div>
                    </div>
                </c:when>
                <c:when test="${empty unassignedSubjects}">
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                        <div>
                            Teacher have been assigned all subject
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <h2>Unassigned Subjects</h2>
                    <form action="${pageContext.request.contextPath}/acad/assignsub" method="post">
                        <table class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th>Subject Name</th>
                                    <th>Add Subject</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="subject" items="${unassignedSubjects}">
                                    <tr>
                                        <td>${subject.name}</td>
                                        <td><input type="checkbox" name="subjectIds" value="${subject.id}" class="form-check-input"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <input type="hidden" name="instructorId" value="${requestScope.insid}" />
                        <button type="submit" class="btn btn-success"><i class="fas fa-check"></i> Assign Subjects</button>
                    </form>
                </c:otherwise>
            </c:choose>
                    <a href="home" class="text-black" style="text-decoration:none"><i class="fas fa-arrow-left me-2"></i>Go Back</a>
        </div>
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
