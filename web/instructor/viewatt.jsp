<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .container-fluid{
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
        </style>
        <script>
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
                    <div class="col-md-12">
                        <form action="${pageContext.request.contextPath}/instructor/viewatt" method="get" onsubmit="return confirmAttendance()">
                            <table class="table table-bordered">
                                <thead class="thead-dark">
                                    <tr class="text-center">
                                        <th style="font-size: 12px;
                                            white-space: nowrap;"></th>
                                        <th style="font-size: 12px;
                                            white-space: nowrap;">Student</th>
                                        <th style="font-size: 12px;"><input type="checkbox" name="show image" id="toggleImageCheckbox"  onclick="toggleImages()" />Image</th>
                                        <th style="font-size: 12px;
                                            white-space: nowrap;">Status</th>
                                        <th style="white-space: nowrap;">Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.atts}" var="a" varStatus="index">
                                        <tr class="text-center">
                                            <td>
                                                ${index.index + 1}
                                            </td>
                                            <td style="font-size: 12px;
                                                white-space: nowrap;">${a.student.name}</td>
                                            <td>
                                                <img class="toggleImage" src="https://cdn.discordapp.com/attachments/947741416992436235/1171005032691404921/profile.png?ex=655b1a6c&is=6548a56c&hm=428202d73c6b3e95f3b966e3840f79186e79afdc98a879ea0492fa4957d08806&" alt="" style="text-align: center;
                                                     vertical-align: middle;" width="100" height="100"/>
                                            </td>                                                                                                       
                                            <td style="font-size: 12px;
                                                white-space: nowrap;">
                                                <c:if test="${!a.status}">Absent</c:if>
                                                <c:if test="${a.status}">Present</c:if>
                                                </td>
                                                <td>${a.description}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="container d-flex justify-content-center align-items-center text-center">
                                <a href="${pageContext.request.contextPath}/instructor/editatt?id=${ses.id}" class="btn btn-success">Edit Attendance</a>
                            </div>
                        </form>
                    </div> 
                </div>
            </div>
    </body>
</html>