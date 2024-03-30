<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Feedback</title>
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
            <h1 class="text-center mb-4">Edit Feedback Sheet</h1>
            <div class="card mb-3">
                <div class="card-body text-center">
                    <h5 class="card-title d-inline-block mr-2">Class: ${requestScope.gsm[0].group.name}</h5>
                    <h5 class="card-title d-inline-block mr-2">Subject: ${requestScope.gsm[0].subject.name}</h5><br>
                    <h5 class="card-title d-inline-block">Instructor: ${requestScope.gsm[0].instructor.name}</h5>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <form action="${pageContext.request.contextPath}/student/editfb" method="POST" onsubmit="return submitForm()">
                        <table class="table table-bordered">
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
                                <c:forEach items="${requestScope.list}" var="fb" varStatus="index">
                                    <tr class="text-center">
                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="punctuality" id="punctuality${index}" value="1" ${fb.punctuality == 1 ? 'checked' : ''}>
                                                <label class="form-check-label" for="punctuality${index}">Always punctual</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="punctuality" id="punctuality${index}" value="2" ${fb.punctuality == 2 ? 'checked' : ''}>
                                                <label class="form-check-label" for="punctuality${index}">Mostly punctual</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="punctuality" id="punctuality${index}" value="3" ${fb.punctuality == 3 ? 'checked' : ''}>
                                                <label class="form-check-label" for="punctuality${index}">Rarely punctual</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="punctuality" id="punctuality${index}" value="4" ${fb.punctuality == 4 ? 'checked' : ''}>
                                                <label class="form-check-label" for="punctuality${index}">Not at all punctual</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="fully_syllabus" id="fully_syllabus1_${index.index}" value="1" ${fb.fully_syllabus == 1 ? 'checked' : ''}>
                                                <label class="form-check-label" for="fully_syllabus1_${index.index}">Fully covers syllabus</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="fully_syllabus" id="fully_syllabus2_${index.index}" value="2" ${fb.fully_syllabus == 2 ? 'checked' : ''}>
                                                <label class="form-check-label" for="fully_syllabus2_${index.index}">Mostly covers syllabus</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="fully_syllabus" id="fully_syllabus3_${index.index}" value="3" ${fb.fully_syllabus == 3 ? 'checked' : ''}>
                                                <label class="form-check-label" for="fully_syllabus3_${index.index}">Partially covers syllabus</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="fully_syllabus" id="fully_syllabus4_${index.index}" value="4" ${fb.fully_syllabus == 4 ? 'checked' : ''}>
                                                <label class="form-check-label" for="fully_syllabus4_${index.index}">Does not cover syllabus</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="intructor_skills" id="intructor_skills1_${index.index}" value="1" ${fb.intructor_skills == 1 ? 'checked' : ''}>
                                                <label class="form-check-label" for="intructor_skills1_${index.index}">Very Good</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="intructor_skills" id="intructor_skills2_${index.index}" value="2" ${fb.intructor_skills == 2 ? 'checked' : ''}>
                                                <label class="form-check-label" for="intructor_skills2_${index.index}">Good</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="intructor_skills" id="intructor_skills3_${index.index}" value="3" ${fb.intructor_skills == 3 ? 'checked' : ''}>
                                                <label class="form-check-label" for="intructor_skills3_${index.index}">Average</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="intructor_skills" id="intructor_skills4_${index.index}" value="4" ${fb.intructor_skills == 4 ? 'checked' : ''}>
                                                <label class="form-check-label" for="intructor_skills4_${index.index}">Poor</label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="instructor_support" id="instructor_support1_${index.index}" value="1" ${fb.instructor_support == 1 ? 'checked' : ''}>
                                                <label class="form-check-label" for="instructor_support1_${index.index}">Very Good</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="instructor_support" id="instructor_support2_${index.index}" value="2" ${fb.instructor_support == 2 ? 'checked' : ''}>
                                                <label class="form-check-label" for="instructor_support2_${index.index}">Good</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="instructor_support" id="instructor_support3_${index.index}" value="3" ${fb.instructor_support == 3 ? 'checked' : ''}>
                                                <label class="form-check-label" for="instructor_support3_${index.index}">Average</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="instructor_support" id="instructor_support4_${index.index}" value="4" ${fb.instructor_support == 4 ? 'checked' : ''}>
                                                <label class="form-check-label" for="instructor_support4_${index.index}">Poor</label>
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
                            <button type="submit" class="btn btn-primary">Submit Feedback</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
                        
         <script>
            function submitForm() {
                alert("FeedBack successfully!");
                return true;
            }
        </script>
    </body>
</html>