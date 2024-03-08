
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .container-fluid {
                margin: 0!important;
                padding: 0!important;
            }
            .description-input-cell,
            .student-name-cell {
                text-align: center;
                vertical-align: middle;
            }

            .toggleImage {
                display: none;
                margin: auto;
            }

            /* Navbar Styles */
            .navbar-brand {
                font-weight: bold;
                font-size: 1.5rem;
                transition: transform 0.3s ease;
            }
            .navbar-brand:hover {
                transform: scale(1.05);
            }
            .nav-link {
                transition: color 0.2s ease;
            }
            .nav-link:hover, .nav-link:focus {
                color: #f8f9fa !important;
            }
            .active .nav-link {
                color: #ffffff !important;
                background-color: rgba(255, 255, 255, 0.1);
                border-radius: 0.25rem;
            }
            .user-profile img {
                border-radius: 50%;
                transition: border-color 0.3s ease;
            }
            .user-profile img:hover {
                border-color: #f8f9fa;
            }
        </style>
        <script>
            function toggleImages() {
                var images = document.getElementsByClassName('toggleImage');
                var checkbox = document.getElementById("toggleImageCheckbox");
                for (var i = 0; i < images.length; i++) {
                    images[i].style.display = checkbox.checked ? "block" : "none";
                }
            }

            function submitAttendanceForm() {
                var attendanceForm = document.getElementById('attendanceForm');
                var confirmationModal = new bootstrap.Modal(document.getElementById('confirmationModal'));
                confirmationModal.show();

                document.getElementById('confirmSubmit').addEventListener('click', function() {
                    attendanceForm.submit();
                });
            }

            function showSuccessModal() {
                var successModal = new bootstrap.Modal(document.getElementById('successModal'));
                successModal.show();
            }
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %> 
            <div class="container">
                <h1 class="text-center my-3">Attendance Sheet</h1>
                <div class="card mb-3">
                    <div class="card-body text-center">
                        <h5 class="card-title d-inline-block mr-2">Class: ${requestScope.ses.group.name}</h5>
                        <h5 class="card-title d-inline-block mr-2">Subject: ${requestScope.ses.subject.name}</h5><br>
                        <h5 class="card-title d-inline-block">Time Slot: ${requestScope.ses.time.description}</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <form action="${pageContext.request.contextPath}/instructor/takeatt" method="POST" onsubmit="return confirmAttendance()">
                            <table class="table table-bordered">
                                <thead class="thead-dark">
                                    <tr class="text-center">
                                        <th style="font-size: 12px; white-space: nowrap;"></th>
                                        <th style="font-size: 12px; white-space: nowrap;">Student</th>
                                        <th style="font-size: 12px;"><input type="checkbox" name="show image" id="toggleImageCheckbox" onclick="toggleImages()" />Image</th>
                                        <th style="font-size: 12px; white-space: nowrap;">Status</th>
                                        <th style="white-space: nowrap;">Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.atts}" var="a" varStatus="index">
                                        <tr class="text-center">
                                            <td style="text-align: center; vertical-align: middle;">
                                                ${index.index + 1}
                                            </td>
                                            <td class="student-name-cell" style="font-size: 12px; white-space: nowrap;">${a.student.name}
                                                <input type="hidden" name="student_id" value="${a.student.id}"/>
                                            </td>
                                            <td>
                                                <img class="toggleImage" src="https://cdn.discordapp.com/attachments/947741416992436235/1171005032691404921/profile.png?ex=655b1a6c&is=6548a56c&hm=428202d73c6b3e95f3b966e3840f79186e79afdc98a879ea0492fa4957d08806&" alt="" style="text-align: center; vertical-align: middle;" width="100" height="100"/>
                                            </td>
                                            <td style="font-size: 12px; white-space: nowrap; vertical-align: middle; text-align: center;">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" checked="checked"
                                                           name="status${a.student.id}" value="Absent"/>
                                                    <label class="form-check-label">Absent</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           name="status${a.student.id}" value="Present"/>
                                                    <label class="form-check-label">Present</label>
                                                </div>
                                            </td>
                                            <td class="description-input-cell">
                                                <input type="text" class="form-control" value="${a.description}"
                                                       name="att_description${a.student.id}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <input type="hidden" value="${requestScope.ses.id}" name="session_id"/>
                            <input type="submit" class="btn btn-primary center" value="Take Attendance"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>