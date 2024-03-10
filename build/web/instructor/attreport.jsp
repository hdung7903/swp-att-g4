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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background-color: #f4f7fc;
                font-family: 'Open Sans', sans-serif;
            }
            .container-fluid{
                margin: 0!important;
                padding: 0!important;
            }
            .container, .card {
                border-radius: 0.5rem;
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            }
            .card-header {
                background-color: #fff;
                border-bottom: none;
            }
            .table th, .table td {
                vertical-align: middle;
            }
            .btn-primary {
                background-color: #5c77ff;
                border-color: #5c77ff;
            }
            .btn-primary:hover {
                background-color: #4a61e4;
                border-color: #4a61e4;
            }
            .form-select:focus {
                border-color: #5c77ff;
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(92, 119, 255, 0.25);
            }
            .toggleImage {
                display: none;
            }
            .icon-link {
                color: inherit;
                text-decoration: none;
            }
            .icon-link:hover {
                color: inherit;
            }
            .text-warning {
                color: #ffc107 !important;
            }
            .text-danger {
                color: #dc3545 !important;
            }
            .text-success {
                color: #28a745 !important;
            }
            .table-hover tbody tr:hover {
                background-color: #f4f7fc;
            }
            .table thead {
                background-color: #e2e6ea;
            }
            .form-label {
                font-weight: 600;
            }
            .card {
                margin-bottom: 30px;
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
            <div class="container-fluid bg-white p-4 my-3">
                <div class="row mb-4">
                    <div class="col-12">
                        <h1 class="text-center text-dark mb-3">Attendance Statistics</h1>
                        <div class="card">
                            <div class="card-header">
                                <form method="get" action="${pageContext.request.contextPath}/instructor/attstatistic" id="attendanceForm" class="row g-3 align-items-center">
                                    <div class="col-md-8">
                                        <label for="groupIdSelect" class="form-label">Select Group:</label>
                                        <select class="form-select" aria-label="Group selection" name="groupId" id="groupIdSelect">
                                            <option selected disabled>Select a Group</option>
                                            <c:forEach items="${requestScope.groupList}" var="group">
                                                <option value="${group.gsm.id}" data-group-name="${group.name}">${group.name}</option>
                                            </c:forEach>
                                        </select>
                                        <input type="hidden" value="${sessionScope.accountId}" name="id" readonly />
                                    </div>
                                    <div class="col-md-4 d-grid mt-5">
                                        <button type="submit" class="btn btn-primary" onclick="handleView()">View <i class="bi bi-eye"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <c:if test="${not empty attendanceMap}">
                            <div class="table-responsive mt-3" style="overflow-x: hidden;">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr class="text-center">
                                            <th>Name</th>
                                            <th>Image <input class="form-check-input ms-2" type="checkbox" id="toggleImageCheckbox" /></th>
                                                <c:forEach var="i" begin="1" end="${totalSession}" varStatus="loop">
                                                <th>S${i}</th>
                                                </c:forEach>
                                            <th>Absent %</th>
                                            <th>Report</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="entry" items="${attendanceMap}">
                                            <c:set var="absentSessions" value="0" />
                                            <tr class="text-center">
                                                <td style="font-size: 12px; white-space: nowrap;">${entry.key}</td>
                                                <td><img class="toggleImage" style="width: 50px; height: 50px;" src="https://cdn.discordapp.com/attachments/947741416992436235/1171005032691404921/profile.png?ex=655b1a6c&is=6548a56c&hm=428202d73c6b3e95f3b966e3840f79186e79afdc98a879ea0492fa4957d08806&" alt=""/></td>
                                                    <c:forEach var="status" items="${entry.value.attendances}">
                                                    <td style="font-size: 12px; color: ${!status ? 'red' : 'green'};">
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
                                                <c:forEach var="i" begin="${entry.value.attendances.size()+1}" end="${totalSession}">
                                                    <td style="font-size: 12px;">-</td>
                                                </c:forEach>
                                                <c:set var="totalSessions" value="${totalSession}" />
                                                <c:set var="absentPercent" value="${(absentSessions / totalSessions) * 100}" />
                                                <c:if test="${absentPercent < 10}">
                                                    <td style="color: black; font-size: 12px;">${absentPercent}%</td>
                                                </c:if>
                                                <c:if test="${absentPercent >= 10 && absentPercent <= 20}">
                                                    <td style="color: blue; font-size: 12px;">${absentPercent}%</td>
                                                </c:if>
                                                <c:if test="${absentPercent > 20}">
                                                    <td style="color: red; font-size: 12px;">${absentPercent}%</td>
                                                </c:if>
                                                <td style="font-size: 12px;">
                                                    <c:choose>
                                                        <c:when test="${absentPercent >= 10 && absentPercent <= 20}">
                                                            <a href="mailto:${entry.value.email}?subject=Warning: High Absentee Percentage Status&body=Dear ${entry.key},%0D%0A%0D%0AI want to notify you about the attendance percentage for Subject ${entry.value.subject.name}: ${absentPercent}% absent.%0D%0A%0D%0AI should note that it is important to attend school diligently in the coming time to ensure success in the exams (participate in a minimum of 80% of the study). As a rule, the school will not make a call to compensate for students for any reason if students do not attend the lesson, including missed lessons due to late class arrangement. Also, do not forget to check the daily attendance to promptly handle errors in attendance.%0D%0A%0D%0AWish you achieve good results!%0D%0ABest regards,%0D%0A%0D%0A${entry.value.instructor.name}" style="color: yellow;"><i class="fa-regular fa-envelope" style="color: #FFD43B;"></i> Warning</a>
                                                        </c:when>
                                                        <c:when test="${absentPercent > 20}">
                                                            <a style="color: red;">Missed Out</a> 
                                                        </c:when>
                                                        <c:otherwise>-</c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
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

            document.getElementById("groupIdSelect").addEventListener("change", function () {
                var selectedOption = this.options[this.selectedIndex];
                document.getElementById("groupNameInput").value = selectedOption.dataset.groupName;
            });
            const handleView = () => {
                window.location.reload();
            };
        </script>
    </body>
</html>
