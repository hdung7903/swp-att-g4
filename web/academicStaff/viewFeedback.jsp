<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Feedback</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
        <%@ include file="./navbar.jsp" %>

        <div class="container">
            <div class="my-3">
                <h2 class="display-4 text-center mb-4">View Feedback Sheet</h2>
                <h3 class="display-6 text-center mb-4">From student: ${requestScope.groupList[0].student.name}</h3>
            </div>

            <div class="col-md-6 mb-3">
                <h2 class="card-title">List Feedback</h2>
                <form id="classForm" action="${pageContext.request.contextPath}/acad/viewfb" method="get">
                    <select class="form-select" id="classSelect" name="csm_id" onchange="submitForm()">
                        <option selected disabled>Select a Group</option>
                        <c:forEach items="${requestScope.g}" var="g" varStatus="index">
                            <option value="${g.gsm.id}" ${g.gsm.id == param.csm_id ? 'selected' : ''}>${g.group.name} - ${g.subject.name} - ${g.instructor.name}</option>
                        </c:forEach>
                    </select>
                    <input type="hidden" value="${requestScope.groupList[0].student.id}" name="student_id" id="studentId" readonly />
                </form>
            </div>

            <c:choose>
                <c:when test="${empty requestScope.list}">
                    <div class="alert alert-danger" role="alert">
                        No feedback has been sent.
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card mb-3">
                        <div class="card-body text-center">
                            <h5 class="card-title d-inline-block me-2">Class: ${requestScope.gsm[0].group.name}</h5>
                            <h5 class="card-title d-inline-block me-2">Subject: ${requestScope.gsm[0].subject.name}</h5><br>
                            <h5 class="card-title d-inline-block">Instructor: ${requestScope.gsm[0].instructor.name}</h5>
                        </div>
                    </div>
                    <table class="table table-bordered feedback-table">
                        <thead class="table-dark">
                            <tr class="text-center">
                                <th>Teacher's Punctuality</th>
                                <th>Coverage of Syllabus</th>
                                <th>Teaching Skills</th>
                                <th>Teacher's Support</th>
                                <th>Comment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.list}" var="fb" varStatus="index">
                                <tr class="text-center">
                                    <td>
                                        <c:choose>
                                            <c:when test="${fb.punctuality == 1}"><i class="fa fa-check-circle text-success"></i> Always punctual</c:when>
                                            <c:when test="${fb.punctuality == 2}"><i class="fa fa-clock text-warning"></i> Mostly punctual</c:when>
                                            <c:when test="${fb.punctuality == 3}"><i class="fa fa-times-circle text-danger"></i> Rarely punctual</c:when>
                                            <c:when test="${fb.punctuality == 4}"><i class="fa fa-ban text-danger"></i> Not at all punctual</c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${fb.fully_syllabus == 1}"><i class="fa fa-book-open text-success"></i> Fully covers syllabus</c:when>
                                            <c:when test="${fb.fully_syllabus == 2}"><i class="fa fa-book text-warning"></i> Mostly covers syllabus</c:when>
                                            <c:when test="${fb.fully_syllabus == 3}"><i class="fa fa-book-reader text-warning"></i> Partially covers syllabus</c:when>
                                            <c:when test="${fb.fully_syllabus == 4}"><i class="fa fa-times text-danger"></i> Does not cover syllabus</c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${fb.intructor_skills == 1}"><i class="fa fa-chalkboard-teacher text-success"></i> Very Good</c:when>
                                            <c:when test="${fb.intructor_skills == 2}"><i class="fa fa-chalkboard text-warning"></i> Good</c:when>
                                            <c:when test="${fb.intructor_skills == 3}"><i class="fa fa-user-edit text-warning"></i> Average</c:when>
                                            <c:when test="${fb.intructor_skills == 4}"><i class="fa fa-user-times text-danger"></i> Poor</c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${fb.instructor_support == 1}"><i class="fa fa-hands-helping text-success"></i> Very Good</c:when>
                                            <c:when test="${fb.instructor_support == 2}"><i class="fa fa-handshake text-warning"></i> Good</c:when>
                                            <c:when test="${fb.instructor_support == 3}"><i class="fa fa-hands text-warning"></i> Average</c:when>
                                            <c:when test="${fb.instructor_support == 4}"><i class="fa fa-thumbs-down text-danger"></i> Poor</c:when>
                                        </c:choose>
                                    </td>
                                    <td>${fb.comment}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    </body>
</html>