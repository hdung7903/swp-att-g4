<%-- 
    Document   : takeatt
    Created on : Jan 8, 2024, 8:24:06 PM
    Author     : leduy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
    <body>
        <div class="container">
            <%@include file="./navbar.jsp" %> 
            <h1 class="text-center mb-4">Attendance Sheet</h1>
            <div class="card mb-3">
                <div class="card-body text-center">
                    <h5 class="card-title d-inline-block mr-2">Class: ${requestScope.ses.group.name}</h5>
                    <h5 class="card-title d-inline-block mr-2">Subject:${requestScope.ses.subject.name}</h5><br>
                    <h5 class="card-title d-inline-block mr-2">at:${requestScope.ses.room.rid}</h5>
                    <h5 class="card-title d-inline-block">Time Slot:${requestScope.ses.time.description}</h5>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <form action="${pageContext.request.contextPath}/lecture/takeatt" method="POST">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th>Student</th>
                                    <th><input type="checkbox" name="show image" id="toggleImageCheckbox" onclick="toggleImages()" />Image</th>
                                    <th>Status</th>
                                    <th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="text-center">
                                    <td>John Doe<input type="hidden" name="stuid" value=""/></td>
                                    <td><img class="toggleImage" src="https://cdn.discordapp.com/attachments/947741416992436235/1171005032691404921/profile.png?ex=655b1a6c&is=6548a56c&hm=428202d73c6b3e95f3b966e3840f79186e79afdc98a879ea0492fa4957d08806&" alt=""/></td>
                                    <td>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" checked="checked" name="status" value="absent"/>
                                            <label class="form-check-label">Absent</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="status" value="present"/>
                                            <label class="form-check-label">Present</label>
                                        </div>
                                    </td>
                                    <td><input type="text" class="form-control" value="" name="description"/></td>
                                </tr>
                                
                            </tbody>
                        </table>
                        <input type="hidden" value="" name="sesid"/>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#attendanceConfirmationModal">Take Attendance</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Your modal here -->

        <script>
            document.getElementById("toggleImageCheckbox").addEventListener("change", function () {
                var images = document.getElementsByClassName('toggleImage');
                for (var i = 0; i < images.length; i++) {
                    if (this.checked) {
                        images[i].style.display = "none";
                    } else {
                        images[i].style.display = "block";
                    }
                }
            });
        </script>
    </body>
</html>
