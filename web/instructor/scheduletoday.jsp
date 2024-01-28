<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule Today</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <style>
            /* Your CSS styles here */
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %>
            <div class="container my-5">
                <h1 class="text-center mb-4">Timetable</h1>
                <div class="form-floating">
                    <form action="${pageContext.request.contextPath}/instructor/scheduletoday" method="get" class="form-inline justify-content-center mb-3 row">
                        <div class="col-6">
                            <label for="day" class="mr-2">Day</label>
                            <input type="date" id="day" name="day" value="${requestScope.day}" class="form-control mr-3"/>
                        </div>
                        <input type="hidden" value="${sessionScope.acc.role_id}" name="id" readonly />
                        <button type="submit" class="btn btn-primary my-2 col-3">View</button>
                    </form>
                </div>
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover">
                            <thead class="thead-light">
                                <tr>
                                    <th>Time Slot</th>
                                    <th class="text-center">
                                        <fmt:formatDate value="${day}" pattern="dd-MM-yyyy" var="formattedDate"/>
                                        ${formattedDate}
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.slots}" var="s"> 
                                    <tr>
                                        <td>${s.description}</td>
                                            <td>
                                                <c:forEach items="${requestScope.sessions}" var="ses">
                                                    <c:if test="${ses.time.id eq s.id and ses.date eq day}">
                                                        <div class="mb-2">
                                                            <a href="${pageContext.request.contextPath}/instructor/sessiondetail?id=${ses.id}" class="font-weight-bold text-dark">
                                                                ${ses.group.name} - ${ses.subject.name}
                                                            </a>
                                                            <br>
                                                            <small><a href="https://${ses.group.link_url}" target="_blank">Link Class</a></small>
                                                            <br>
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
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
