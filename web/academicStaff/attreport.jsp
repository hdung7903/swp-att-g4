<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Statistic</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            .container-fluid {
                margin: 0!important;
                padding: 0!important;
                overflow-x: hidden;
            }

            .ms-3 {
                margin-left: 1rem!important;
            }

            .custom-width-th {
                /* Define individual widths for each th */
            }

            /* Example individual widths for each th */
            .custom-width-th:nth-child(1) {
                width: 100px;
            }

            .custom-width-th:nth-child(2) {
                width: 150px;
            }
            .badge-success {
                background-color: #28a745;
            }
            .badge-danger {
                background-color: #dc3545;
            }
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %>
            <div class="container my-5">
                <h1 class="display-4 text-center mb-4">Attendance Statistics</h1>
                <h3 class="display-6 text-center mb-4">From student: ${requestScope.groupList[0].student.name}</h3>
            </div>
            <div class="row my-3 container">
                <form method="get" action="${pageContext.request.contextPath}/acad/attreport" id="attendanceForm">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="csmIdSelect" class="form-label">Choose a class from the list:</label>
                            <select class="form-select" aria-label="Default select example" name="csmId" id="csmIdSelect">
                                <option selected disabled>Select a Group</option>
                                <c:forEach items="${requestScope.groupList}" var="group">
                                    <option value="${group.gsm.id}" data-group-name="${group.name}">
                                        ${group.name}-${group.subject.name}
                                    </option>
                                </c:forEach>
                            </select>
                            <input type="hidden" value="${requestScope.groupList[0].student.id}" name="student_id" id="studentId" readonly />
                        </div>
                        <div class="col-md-6 mt-4">
                            <button type="submit" class="btn btn-primary">View</button>
                        </div>
                    </div>
                </form>
            </div>
            <table class="table table-striped table-bordered mx-2">
                <tbody class="table-dark text-center">
                    <tr></tr>
                </tbody>
                <thead class="text-center">
                    <tr>
                        <th>Date</th>
                        <th>Slot</th>
                        <th>Lecturer</th>
                        <th>Group Name</th>
                        <th>Attendance Status</th>
                        <th>Lecturer's Comment</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <c:set var="absentSessions" value="0" />
                    <c:forEach items="${requestScope.statusRecord}" var="record">
                        <tr>
                            <td>
                                <fmt:formatDate value="${record.session.date}" pattern="dd-MM-yyyy" />
                            </td>
                            <td>${record.timeslot.description}</td>
                            <td>${record.instructor.name}</td>
                            <td>${record.group.name}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${record.session.isAtt}">
                                        <c:choose>
                                            <c:when test="${record.status}">
                                                <span class="badge badge-success"><i class="fas fa-check"></i> Present</span>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="absentSessions" value="${absentSessions + 1}" />
                                                <span class="badge badge-danger"><i class="fas fa-times"></i> Absent</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        -
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${record.description}</td>
                        </tr>
                    </c:forEach>
                </tbody>
                <c:set var="totalSessions" value="${requestScope.totalSession}" />
                <c:choose>
                    <c:when test="${not empty totalSessions}">
                        <c:set var="absentPercent" value="${(absentSessions / totalSessions) * 100}" />
                        <c:choose>
                            <c:when test="${not empty absentPercent}">
                                <tfoot class="table-light">
                                    <tr>
                                        <td colspan="6" class="ms-3">
                                            <b>Absent</b>: ${absentPercent}% absent so far.
                                        </td>
                                    </tr>
                                </tfoot>
                            </c:when>
                            <c:otherwise>
                                <tfoot class="table-light">
                                    <tr>
                                        <td colspan="6" class="ms-3">
                                            <b>Absent</b>: 0% absent so far.
                                        </td>
                                    </tr>
                                </tfoot>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <tfoot class="table-light">
                            <tr>
                                <td colspan="6" class="ms-3">
                                    <b>Absent</b>: 0% absent so far.
                                </td>
                            </tr>
                        </tfoot>
                    </c:otherwise>
                </c:choose>
            </table>
        </div>
    </body>
</html>