<%-- 
    Document   : viewatt
    Created on : Jan 8, 2024, 8:24:06 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Attendance</title>
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
                    <h5 class="card-title d-inline-block">Time Slot:${requestScope.ses.time.description}</h5>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/instructor/viewatt" method="get" class="form-inline justify-content-center mb-3 row">
                <div class="row">
                    <c:forEach items="${requestScope.sessions}" var="ses">
                        <c:if test="${ses.time.id eq s.id and ses.date eq d}">
                            <div class="mb-2">
                                <a href="${pageContext.request.contextPath}/instructor/sessiondetail?id=${ses.id}" class="font-weight-bold text-dark">
                                    ${ses.group.name} - ${ses.subject.name}
                                </a>
                                <br>
                                <small><a href="https://${ses.group.link_url}" target="_blank">Link Class</a></small>
                                <br>
                                <c:choose>
                                    <c:when test="${ses.isAtt}">
                                        <a href="${pageContext.request.contextPath}/instructor/editatt?id=${ses.id}" class="text-success font-weight-bold">Edit Attendance</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/instructor/editatt?id=${ses.id}" class="text-success font-weight-bold">Edit Attendance</a>
                                        <a href="${pageContext.request.contextPath}/instructor/takeatt?id=${ses.id}" class="text-danger font-weight-bold">Take Attendance</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </form>
        </div>
    </body>
</html>
