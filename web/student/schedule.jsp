<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <style>
            body {
                background: #f1f1f1;
            }

            .container {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                padding: 30px;
            }

            h1 {
                color: #007bff;
            }

            .btn-primary {
                background: #007bff;
                border: none;
            }

            .btn-primary:hover {
                background: #0062cc;
            }

            .table {
                background: #fff;
                box-shadow: 0 0 5px rgba(0,0,0,0.05);
            }

        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %> 
            <div class="container my-5">
                <h1 class="text-center mb-4">Timetable</h1>
                <div class="form-floating">
                    <form action="${pageContext.request.contextPath}/instructor/schedule" method="get" class="form-inline justify-content-center mb-3 row">
                        <div class="col-6">
                            <label for="from" class="mr-2">From</label>
                            <input type="date" id="from" name="from" value="${requestScope.from}" class="form-control mr-3"/>
                        </div>
                        <div class="col-6">
                            <label for="to" class="mr-2">To</label>
                            <input type="date" id="to" name="to" value="${requestScope.to}" class="form-control mr-3"/>
                        </div>                       
                        <input type="hidden" value="${sessionScope.acc.role_id}" name="id" readonly />
                        <button type="submit" class="btn btn-primary my-2 col-3">View</button>
                    </form>
                </div>
                <c:choose>
                    <c:when test="${dates.size() > 0}">
                        <c:set var="tableIndex" value="1" />
                        <c:set var="remainingDays" value="${dates.size()}" />
                        <c:forEach var="date" items="${dates}">
                            <c:if test="${remainingDays >= 7}">
                                <div class="table-container">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped table-hover">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th></th>
                                                        <c:forEach var="d" begin="${(tableIndex - 1) * 7}" end="${tableIndex * 7 - 1}" items="${dates}">
                                                        <th class="text-center">
                                                            <fmt:formatDate value="${d}" pattern="dd-MM-yyyy" var="formattedDate" />
                                                            ${formattedDate}
                                                        </th>
                                                    </c:forEach>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.slots}" var="s">
                                                    <tr>
                                                        <td class="align-middle">${s.description}</td>
                                                        <c:forEach var="d" begin="${(tableIndex - 1) * 7}" end="${tableIndex * 7 - 1}" items="${dates}">
                                                            <td>
                                                                <c:forEach items="${requestScope.sessions}" var="ses">
                                                                    <c:if test="${ses.time.id eq s.id and ses.date eq d}">
                                                                        <div class="mb-2">
                                                                            <a href="${pageContext.request.contextPath}/lecture/sessiondetail?id=${ses.id}" class="font-weight-bold text-dark">
                                                                                ${ses.group.name} - ${ses.subject.name}
                                                                            </a>
                                                                            <br>
                                                                            <small><a href="https://${ses.group.link_url}" target="_blank">Link Class</a></small>
                                                                            <br>
                                                                            <c:choose>
                                                                                <c:when test="${ses.attendance.status}">
                                                                                    <a href="${pageContext.request.contextPath}/lecture/viewatt?id=${ses.id}" class="text-success font-weight-bold">Attended</a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <a href="${pageContext.request.contextPath}/lecture/takeatt?id=${ses.id}" class="text-danger font-weight-bold">Not Attended</a>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </div>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                        </c:forEach>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <c:set var="tableIndex" value="${tableIndex + 1}" />
                                <c:set var="remainingDays" value="${remainingDays - 7}" />
                            </c:if>
                        </c:forEach>
                        <c:if test="${remainingDays > 0}">
                            <div class="table-container">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped table-hover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th></th>
                                                    <c:forEach var="d" begin="${(tableIndex - 1) * 7}" end="${tableIndex * 7 - 1}" items="${dates}">
                                                    <th class="text-center">
                                                        <fmt:formatDate value="${d}" pattern="dd-MM-yyyy" var="formattedDate" />
                                                        ${formattedDate}
                                                    </th>
                                                </c:forEach>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.slots}" var="s">
                                                <tr>
                                                    <td class="align-middle">${s.description}</td>
                                                    <c:forEach var="d" begin="${(tableIndex - 1) * 7}" end="${tableIndex * 7 - 1}" items="${dates}">
                                                        <td>
                                                            <c:forEach items="${requestScope.sessions}" var="ses">
                                                                <c:if test="${ses.time.id eq s.id and ses.date eq d}">
                                                                    <div class="mb-2">
                                                                        <a href="${pageContext.request.contextPath}/lecture/sessiondetail?id=${ses.id}" class="font-weight-bold text-dark">
                                                                            ${ses.group.name} - ${ses.subject.name}
                                                                        </a>
                                                                        <br>
                                                                        <small><a href="https://${ses.group.link_url}" target="_blank">Link Class</a></small>
                                                                        <br>
                                                                        <c:choose>
                                                                            <c:when test="${ses.isAtt}">
                                                                                <a href="${pageContext.request.contextPath}/lecture/viewatt?id=${ses.id}" class="text-success font-weight-bold">View Attendance</a>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <a href="${pageContext.request.contextPath}/lecture/takeatt?id=${ses.id}" class="text-danger font-weight-bold">Take Attendance</a>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>
                                                    </c:forEach>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <span class="text-danger d-block text-center">Invalid From-To Range</span>
                    </c:otherwise>
                </c:choose>           
            </div>
        </div>
    </body>
</html>
