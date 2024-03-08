<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule Today</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <style>
            body {
                background: #f1f1f1;
            }
            .container-fluid{
                margin: 0!important;
                padding: 0!important;
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
                    <form action="${pageContext.request.contextPath}/student/slottoday" method="get" class="mb-3">
                        <div class="row align-items-center">
                            <div class="col-md-6 mb-3">
                                <label for="date" class="form-label">Date</label>
                                <div class="input-group">
                                    <input type="date" id="date" name="date" value="${requestScope.date}" class="form-control"/>
                                    <div class="input-group-append mx-2">
                                        <button type="submit" class="btn btn-primary" onclick="handleView()"><i class="fas fa-eye"></i> View</button>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="${sessionScope.acc.role_id}" name="id" readonly />
                        </div>
                    </form>
                </div>                
                <c:if test="${not empty sessions}">
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
                                    <c:forEach var="ses" items="${sessions}">
                                        <tr>
                                            <td><fmt:formatDate value="${ses.date}" pattern="dd-MM-yyyy"/></td>
                                            <td>${ses.time.description}</td>
                                            <td>${ses.group.name}</td>
                                            <td>${ses.subject.name}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${ses.attendance.status}">
                                                        <span class="text-success"><i class="fas fa-check-circle"></i> Attended</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-danger"><i class="fas fa-times-circle"></i> Absent</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                        <c:if test="${empty sessions}">
                            <div class="alert alert-danger d-flex align-items-center" role="alert">
                                <i class="fas fa-exclamation-triangle me-2"></i>
                                <div>
                                    No sessions found
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        const handleView = () => {
            window.location.reload();
        };
    </script>
</html>
