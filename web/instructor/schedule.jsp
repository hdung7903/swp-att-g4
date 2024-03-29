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
            .container-fluid{
                margin: 0!important;
                padding: 0!important;
            }
            .table-container {
                overflow-x: auto;
            }
            .table-responsive {
                margin-bottom: 1.5rem;
            }
            .table .thead-light th {
                background-color: #e3f2fd;
            }
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, .05);
            }
            .table-hover tbody tr:hover {
                background-color: rgba(0, 0, 0, .075);
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %>             
            <div class="container my-5">
                <h1 class="text-center mb-4 text-primary">Timetable</h1>
                <div class="alert alert-info">
                    <strong>Notes:</strong><br>
                    + Every slot learning in Morning will start at 8:00AM and end at 11:00PM<br>
                    + Every slot learning in Afternoon will start at 2:00PM and end at 5:00PM
                </div>
                <form action="${pageContext.request.contextPath}/instructor/schedule" method="get" class="row g-3 justify-content-center">
                    <div class="col-md-4">
                        <label for="from" class="form-label">From</label>
                        <input type="date" id="from" name="from" value="${requestScope.from}" class="form-control"/>
                    </div>
                    <div class="col-md-4">
                        <label for="to" class="form-label">To</label>
                        <input type="date" id="to" name="to" value="${requestScope.to}" class="form-control"/>
                    </div>
                    <div class="col-md-2 d-flex align-items-end">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-eye"></i> View</button>
                    </div>
                    <input type="hidden" value="${sessionScope.accountId}" name="id" readonly />
                </form>
            </div> 
            <c:choose>
                <c:when test="${dates.size() > 0}">
                    <c:set var="tableIndex" value="1" />
                    <c:set var="remainingDays" value="${dates.size()}" />
                    <c:forEach var="date" items="${dates}">
                        <c:if test="${remainingDays >= 7}">
                            <div class="table-container container">
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
                                                                        <a href="${pageContext.request.contextPath}/instructor/sessiondetail?id=${ses.id}" class="font-weight-bold text-dark">
                                                                            ${ses.group.name} - ${ses.subject.name}
                                                                        </a>
                                                                        <p>
                                                                            <a href="https://${ses.group.link_url}" target="_blank">Link Class</a>
                                                                        </p>                                                                              
                                                                        <c:choose>
                                                                            <c:when test="${ses.isAtt}">
                                                                                <a href="${pageContext.request.contextPath}/instructor/viewatt?id=${ses.id}" class="text-success font-weight-bold">View Attendance</a>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <a href="${pageContext.request.contextPath}/instructor/takeatt?id=${ses.id}" class="text-danger font-weight-bold">Take Attendance</a>
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
                                                                    <a href="${pageContext.request.contextPath}/instructor/sessiondetail?id=${ses.id}" class="font-weight-bold text-dark">
                                                                        ${ses.group.name} - ${ses.subject.name}
                                                                    </a>
                                                                    <p>
                                                                        <a href="https://${ses.group.link_url}" target="_blank">Link Class</a>
                                                                    </p>
                                                                    <c:choose>
                                                                        <c:when test="${ses.isAtt}">
                                                                            <a href="${pageContext.request.contextPath}/instructor/viewatt?id=${ses.id}" class="text-success font-weight-bold">View Attendance</a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <a href="${pageContext.request.contextPath}/instructor/takeatt?id=${ses.id}" class="text-danger font-weight-bold">Take Attendance</a>
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
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        <div>
                            Invalid from-to range
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>           
        </div>
        <script>
            const handleView = () => {
                window.location.reload();
            };
        </script>
    </body>
</html>