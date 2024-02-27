<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule Today</title>
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
            <%@ include file="./navbar.jsp" %>
            <div class="container my-5">
                <h1 class="text-center mb-4">Timetable</h1>
                <div class="form-floating">
                    <form action="${pageContext.request.contextPath}/student/slottoday" method="get" class="justify-content-center mb-3">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="date" class="mr-2">Date</label>
                                <input type="date" id="date" name="date" value="${requestScope.date}" class="form-control"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <input type="hidden" value="${sessionScope.accountId}" name="id" readonly />
                                <button type="submit" class="btn btn-primary">View</button>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover">
                            <thead class="thead-light">
                                <tr>
                                    <th>Date</th>
                                    <th>Time Slot</th>
                                    <th>Group</th>
                                    <th>Subject</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty sessions}">
                                    <c:forEach var="ses" items="${sessions}">
                                        <tr>
                                            <td><fmt:formatDate value="${ses.date}" pattern="dd-MM-yyyy"/></td>
                                            <td>${ses.time.description}</td>
                                            <td>${ses.group.name}</td> 
                                            <td>${ses.subject.name}</td>
                                            <td><c:choose>
                                                    <c:when test="${ses.isAtt}">
                                                        <c:choose>
                                                            <c:when test="${ses.attendance.status}">
                                                                <span style="color: green;">(Attended)</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span style="color: red;">(Absent)</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color: red;">(Absent)</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty sessions}">
                                    <tr>
                                        <td colspan="5" style="text-align: center; color: red;">No sessions found</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </body>
</html>