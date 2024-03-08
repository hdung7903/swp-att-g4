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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            .spinner-overlay {
                position: fixed;
                top: 90px;
                left: 0;
                width: 100%;
                height: calc(100% - 90px);
                background: rgba(255, 255, 255, 0.8);
                display: none;
                justify-content: center;
                align-items: center;
                z-index: 1050;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %> 
            <div class="container my-5">
                <div>
                    <h1 class="text-center mb-4 text-primary">Timetable</h1>
                    <div class="alert alert-info">
                        <strong>Notes:</strong><br>
                        + Every slot learning in Morning will start at 8:00AM and end at 11:00PM<br>
                        + Every slot learning in Afternoon will start at 2:00PM and end at 5:00PM
                    </div>
                    <form action="${pageContext.request.contextPath}/student/schedule" method="get" class="row g-3 justify-content-center" onsubmit="showSpinner()">
                        <div class="col-md-5">
                            <label for="from" class="form-label">From</label>
                            <input type="date" id="from" name="from" value="${requestScope.from}" class="form-control"/>
                        </div>
                        <div class="col-md-5">
                            <label for="to" class="form-label">To</label>
                            <input type="date" id="to" name="to" value="${requestScope.to}" class="form-control"/>
                        </div>
                        <input type="hidden" value="${sessionScope.accountId}" name="id" readonly />
                        <div class="col-md-2 d-grid">
                            <button type="submit" class="btn btn-primary" onclick="handleView()"><i class="fas fa-eye"></i> View</button>
                        </div>
                    </form>
                    <div class="table-container rounded">  
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
                                                                                    <a href="${pageContext.request.contextPath}/student/sessiondetail?id=${ses.id}" class="font-weight-bold text-dark">
                                                                                        ${ses.group.name} - ${ses.subject.name}
                                                                                    </a>
                                                                                    <p class="mb-2">
                                                                                        <a href="https://${ses.group.link_url}" target="_blank">Link Class</a>
                                                                                    </p>
                                                                                    <c:choose>
                                                                                        <c:when test="${ses.attendance.status}">
                                                                                            <span class="badge bg-success">Present</span>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <span class="badge bg-danger">Absent</span>
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
                                                                                <a href="${pageContext.request.contextPath}/student/sessiondetail?id=${ses.id}" class="font-weight-bold text-dark">
                                                                                    ${ses.group.name} - ${ses.subject.name}
                                                                                </a>
                                                                                <p class="mb-2">
                                                                                    <a href="https://${ses.group.link_url}" target="_blank">Link Class</a>
                                                                                </p>
                                                                                <c:choose>
                                                                                    <c:when test="${ses.attendance.status}">
                                                                                        <span class="badge bg-success">Present</span>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <span class="badge bg-danger">Absent</span>
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
                </div>
            </div>
        </div>
        <script>
            const handleView = () => {
                window.location.reload();
            };
        </script>
    </body>
</html>
