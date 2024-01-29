<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Attendance</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .description-input-cell,
            .student-name-cell {
                text-align: center;
                vertical-align: middle;
            }
            .toggleImage {
                display: none;
                margin: auto;
            }
        </style>
        <script>
            function confirmAttendance() {
                var conf = confirm("Sure attended?");
                return conf;
            }

            function toggleImages() {
                var images = document.getElementsByClassName('toggleImage');
                var checkbox = document.getElementById("toggleImageCheckbox");

                for (var i = 0; i < images.length; i++) {
                    if (checkbox.checked) {
                        images[i].style.display = "block";
                    } else {
                        images[i].style.display = "none";
                    }
                }
            }
        </script>
    </head>
    <body>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %> 
            <div class="container">
                <h1 class="text-center mb-4">Attendance Sheet</h1>
                <div class="card mb-3">
                    <div class="card-body text-center">
                        <h5 class="card-title d-inline-block mr-2">Class: ${requestScope.ses.group.name}</h5>
                        <h5 class="card-title d-inline-block mr-2">Subject: ${requestScope.ses.subject.name}</h5><br>
                        <h5 class="card-title d-inline-block">Time Slot: ${requestScope.ses.time.description}</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <form action="${pageContext.request.contextPath}/instructor/editatt" method="POST" onsubmit="return confirmAttendance()">
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
                                            <td>
                                                ${index.index + 1}
                                            </td>
                                            <td style="font-size: 12px; white-space: nowrap;">${a.student.name}
                                                <input type="hidden" name="student_id" value="${a.student.id}"/>
                                            </td>
                                            <td>
                                                <img class="toggleImage" src="https://cdn.discordapp.com/attachments/947741416992436235/1171005032691404921/profile.png?ex=655b1a6c&is=6548a56c&hm=428202d73c6b3e95f3b966e3840f79186e79afdc98a879ea0492fa4957d08806&" alt="" style="text-align: center; vertical-align: middle;" width="100" height="100"/>
                                            </td>                                                                                                       
                                            <td>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           <c:if test="${!a.status}">
                                                               checked="checked"
                                                           </c:if>
                                                           name="status${a.student.id}" value="Absent"/>
                                                    <label class="form-check-label">Absent</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           <c:if test="${a.status}">
                                                               checked="checked"
                                                           </c:if>
                                                           name="status${a.student.id}" value="Present"/>
                                                    <label class="form-check-label">Present</label>
                                                </div>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" value="${a.description}"
                                                       name="att_description${a.student.id}"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <input type="hidden" value="${requestScope.ses.id}" name="session_id"/>
                            <input type="submit" class="btn btn-success center" value="Edit Attendance"/>
                        </form>
                    </div> 
                </div>
            </div>
    </body>
</html>