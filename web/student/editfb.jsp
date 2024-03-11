<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Feedback</title>
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

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .form-check-label {
                margin-left: 0.3rem;
            }
        </style>
    </head>

    <body>
        <%@ include file="./navbar.jsp" %>

        <div class="container">
            <h1 class="text-center mb-4">Edit Feedback Sheet</h1>
            <div class="card mb-3">
                <div class="card-body text-center">
                    <h5 class="card-title d-inline-block me-2">Class: ${requestScope.gsm[0].group.name}</h5>
                    <h5 class="card-title d-inline-block me-2">Subject: ${requestScope.gsm[0].subject.name}</h5><br>
                    <h5 class="card-title d-inline-block">Instructor: ${requestScope.gsm[0].instructor.name}</h5>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <form action="${pageContext.request.contextPath}/student/editfb" method="POST">
                        <table class="table table-bordered">
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
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="punctuality" id="punctuality1" value="1" checked>
                                                <label class="form-check-label" for="punctuality1">Always punctual</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="punctuality" id="punctuality2" value="2">
                                                <label class="form-check-label" for="punctuality2">Mostly punctual</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="punctuality" id="punctuality3" value="3">
                                                <label class="form-check-label" for="punctuality3">Rarely punctual</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="punctuality" id="punctuality4" value="4">
                                                <label class="form-check-label" for="punctuality4">Not at all punctual</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="fully_syllabus" id="fully_syllabus1" value="1" checked>
                                                <label class="form-check-label" for="fully_syllabus1">Fully covers syllabus</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="fully_syllabus" id="fully_syllabus2" value="2">
                                                <label class="form-check-label" for="fully_syllabus2">Mostly covers syllabus</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="fully_syllabus" id="fully_syllabus3" value="3">
                                                <label class="form-check-label" for="fully_syllabus3">Partially covers syllabus</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="fully_syllabus" id="fully_syllabus4" value="4">
                                                <label class="form-check-label" for="fully_syllabus4">Does not cover syllabus</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="intructor_skills" id="intructor_skills1" value="1" checked>
                                                <label class="form-check-label" for="intructor_skills1">Very Good</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="intructor_skills" id="intructor_skills2" value="2">
                                                <label class="form-check-label" for="intructor_skills2">Good</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="intructor_skills" id="intructor_skills3" value="3">
                                                <label class="form-check-label" for="intructor_skills3">Average</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="intructor_skills" id="intructor_skills4" value="4">
                                                <label class="form-check-label" for="intructor_skills4">Poor</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="instructor_support" id="instructor_support1" value="1" checked>
                                                <label class="form-check-label" for="instructor_support1">Very Good</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="instructor_support" id="instructor_support2" value="2">
                                                <label class="form-check-label" for="instructor_support2">Good</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="instructor_support" id="instructor_support3" value="3">
                                                <label class="form-check-label" for="instructor_support3">Average</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="instructor_support" id="instructor_support4" value="4">
                                                <label class="form-check-label" for="instructor_support4">Poor</label>
                                            </div>
                                        </td>
                                        <td>
                                            <textarea class="form-control form-control-comment" name="comment" placeholder="Enter your comment">${fb.comment}</textarea>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <input type="hidden" value="${requestScope.gsm[0].id}" name="csm_id">
                        <input type="hidden" value="${requestScope.list[0].id}" name="fb_id">
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Feedback</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap 5 JS Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Font Awesome JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    </body>

</html>