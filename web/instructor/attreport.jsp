<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Statistic</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background: #f1f1f1;
            }

            .container {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                padding: 30px;
                margin-top: 20px;
            }

            h1 {
                color: #6c757d;
            }

            .table {
                background: #fff;
                box-shadow: 0 0 5px rgba(0,0,0,0.05);
            }

            .btn {
                background: #6c757d;
                color: #fff;
            }

            .btn:hover {
                background: #5a6268;
            }

            .toggleImage {
                width: 50px;
                height: 50px;
            }

            @media (max-width: 767px) {
                .table th, .table td {
                    white-space: normal;
                }
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %> 
            <div class="container my-5">                    
                <h1 class="text-center">Attendance Statistics</h1> 
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive-lg">                        
                        <table class="table table-bordered table-hover">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th>Student ID</th>
                                    <th style="font-size: 12px; white-space: nowrap;">Name</th>
                                    <th style="font-size: 12px;"><input type="checkbox" name="show image" id="toggleImageCheckbox" onclick="toggleImages()" />Image</th>
                                        <c:forEach var="i" begin="1" end="${totalSession}" varStatus="loop">
                                        <th style="font-size: 12px; white-space: nowrap;">S ${i}</th>
                                        </c:forEach>
                                    <th style="font-size: 12px; white-space: nowrap;">Absent %</th>
                                    <th style="font-size: 12px; white-space: nowrap;">Report</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="entry" items="${attendanceMap}">
                                    <c:set var="absentSessions" value="0" />
                                    <tr class="text-center">
                                        <td style="font-size: 12px; white-space: nowrap;">${entry.key}</td>
                                        <td><img class="toggleImage" style="width: 50px; height: 50px;" src="https://cdn.discordapp.com/attachments/947741416992436235/1171005032691404921/profile.png?ex=655b1a6c&is=6548a56c&hm=428202d73c6b3e95f3b966e3840f79186e79afdc98a879ea0492fa4957d08806&" alt=""/></td>
                                            <c:forEach var="status" items="${entry.value.attendances}">
                                            <td style="font-size: 12px;">
                                                <c:choose>
                                                    <c:when test="${!status}">
                                                        <c:set var="absentSessions" value="${absentSessions + 1}" />A
                                                    </c:when>
                                                    <c:otherwise>
                                                        P
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </c:forEach>
                                        <c:forEach var="i" begin="${entry.value.attendances.size()}" end="${totalSession}">
                                            <td style="font-size: 12px;">-</td>
                                        </c:forEach>
                                        <c:set var="totalSessions" value="${totalSession}" />
                                        <c:set var="absentPercent" value="${(absentSessions / totalSessions) * 100}" />
                                        <td style="color: ${absentPercent < 20 ? "red" : "blue"};font-size: 12px;">${absentPercent}%</td>
                                        <td style="font-size: 12px;">
                                            <c:choose>
                                                <c:when test="${absentPercent >= 20}">
                                                    <a href="mailto:${entry.value.email}?subject=Warning: High Absentee Percentage&body=Your Attendance Percentage is now 20%. Don't absent any slot or you'll retry this Subject next Semester" style="color: yellow;">Warning</a>
                                                </c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
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
