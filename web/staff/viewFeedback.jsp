<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Feedback</title>
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

            .no-feedback {
                color: red;
            }

            /* Custom Styles */
            .feedback-table {
                margin-top: 20px;
            }

            .feedback-table th,
            .feedback-table td {
                vertical-align: middle;
            }

            .feedback-table .no-feedback {
                font-weight: bold;
            }
        </style>
        <script>
            function submitForm() {
                document.getElementById("classForm").submit();
            }
        </script>
    </head>

    <body>
        <%@include file="./navbar.jsp" %>

        <div class="container">
            <div class="container my-3">
                <h2 class="display-4 text-center mb-4">View Feedback Sheet</h2>
                <h3 class="display-6 text-center mb-4">From student: ${requestScope.groupList[0].student.name}</h3>
            </div>

            <div class="col-md-6">
                <h2 class="card-title">List Feedback</h2>
                <form id="classForm" action="${pageContext.request.contextPath}/staff/viewfb" method="get">
                    <div class="mb-3">
                        <select class="form-select" id="classSelect" name="csm_id" onchange="submitForm()">
                            <option selected disabled>Select a Group</option>
                            <c:forEach items="${requestScope.g}" var="g" varStatus="index">
                                <option value="${g.gsm.id}" ${g.gsm.id == param.csm_id ? 'selected' : ''}>${g.group.name} - ${g.subject.name} - ${g.instructor.name}</option>
                            </c:forEach>
                            <input type="hidden" value="${requestScope.groupList[0].student.id}" name="student_id" id="studentId" readonly />
                        </select>
                    </div>
                </form>
            </div>

            <div class="card mb-3">
                <div class="card-body text-center">
                    <h5 class="card-title d-inline-block mr-2">Class: ${requestScope.gsm[0].group.name}</h5>
                    <h5 class="card-title d-inline-block mr-2">Subject: ${requestScope.gsm[0].subject.name}</h5><br>
                    <h5 class="card-title d-inline-block">Instructor: ${requestScope.gsm[0].instructor.name}</h5>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <form action="${pageContext.request.contextPath}/staff/viewfb" method="get">
                        <table class="table table-bordered feedback-table">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th>Teacher's Punctuality</th>
                                    <th>Coverage of Syllabus</th>
                                    <th>Teaching Skills</th>
                                    <th>Teacher's Support</th>
                                    <th>Comment</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty requestScope.list}">
                                        <tr>
                                            <td colspan="5" class="no-feedback">No feedback has been sent</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${requestScope.list}" var="fb" varStatus="index">
                                            <tr class="text-center">
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${fb.punctuality == 1}">Always punctual</c:when>
                                                        <c:when test="${fb.punctuality == 2}">Mostly punctual</c:when>
                                                        <c:when test="${fb.punctuality == 3}">Rarely punctual</c:when>
                                                        <c:when test="${fb.punctuality == 4}">Not at all punctual</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${fb.fully_syllabus == 1}">Fully covers syllabus</c:when>
                                                        <c:when test="${fb.fully_syllabus == 2}">Mostly covers syllabus</c:when>
                                                        <c:when test="${fb.fully_syllabus == 3}">Partially covers syllabus</c:when>
                                                        <c:when test="${fb.fully_syllabus == 4}">Does not cover syllabus</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${fb.intructor_skills == 1}">Very Good</c:when>
                                                        <c:when test="${fb.intructor_skills == 2}">Good</c:when>
                                                        <c:when test="${fb.intructor_skills == 3}">Average</c:when>
                                                        <c:when test="${fb.intructor_skills == 4}">Poor</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${fb.instructor_support == 1}">Very Good</c:when>
                                                        <c:when test="${fb.instructor_support == 2}">Good</c:when>
                                                        <c:when test="${fb.instructor_support == 3}">Average</c:when>
                                                        <c:when test="${fb.instructor_support == 4}">Poor</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>${fb.comment}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
