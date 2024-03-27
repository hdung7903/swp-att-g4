<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Attendance Statistics</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .container-fluid {
                margin: 0!important;
                padding: 0!important;
            }
            body{
                overflow-x:hidden;
            }
            .form-group {
                margin-bottom: 1rem;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            .table-light td {
                background-color: #f8f9fa;
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
                <h1 class="display-4 text-center">Attendance Statistics</h1>
            </div>
            <div class="row">
                <div class="my-3 container">
                    <form method="get" action="${pageContext.request.contextPath}/student/attreport" id="attendanceForm">
                        <div class="row">
                            <div class="col-md-6 ms-5">
                                <div class="form-group">
                                    <label for="csmIdSelect" class="form-label">Choose a class from the list:</label>
                                    <div class="input-group">
                                        <select class="form-select" aria-label="Default select example" name="csmId" id="csmIdSelect">
                                            <option selected disabled>Select a Group</option>
                                            <c:forEach items="${requestScope.groupList}" var="group">
                                                <option value="${group.gsm.id}" data-group-name="${group.name}">
                                                    ${group.name}-${group.subject.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <input type="hidden" value="${sessionScope.accountId}" name="id" readonly />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 align-self-end me-4">
                                <div class="form-group">
                                    <label class="form-label" style="visibility: hidden;">Hidden label</label>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-search"></i> View
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" integrity="sha384-Vouz2tnzHSTBr4dIkS6IvIe8J7c0JqZKKq2U3vGn1sP4FF1OrQyrJNTlS/Qw5es1" crossorigin="anonymous"></script>

    <script>
        document.getElementById("csmIdSelect").addEventListener("change", function () {
            var selectedOption = this.options[this.selectedIndex];
            document.getElementById("groupNameInput").value = selectedOption.dataset.groupName;
        });

        const handleView = () => {
            window.location.reload();
        };
    </script>

</html>
