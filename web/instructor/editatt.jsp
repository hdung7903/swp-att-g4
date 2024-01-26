<%-- 
    Document   : takeatt
    Created on : Jan 8, 2024, 8:24:06 PM
    Author     : leduy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
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
            <div class="row">
                <div class="col-md-12">
                    <form action="${pageContext.request.contextPath}/instructor/editatt" method="POST">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th>Student</th>
                                    <th>Image</th>
                                    <th>Status</th>
                                    <th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.atts}" var="a">
                                    <tr class="text-center">
                                        <td>${a.student.name}
                                            <input type="hidden" name="stuid" value="${a.student.id}"/>
                                        </td>
                                        <td>Hello World</td>                                                                                                        
                                        <td>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio"
                                                       <c:if test="${!a.status}">
                                                           checked="checked"
                                                       </c:if>
                                                       name="status${a.student.id}" value="absent"/>
                                                <label class="form-check-label">Absent</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio"
                                                       <c:if test="${a.status}">
                                                           checked="checked"
                                                       </c:if>
                                                       name="status${a.student.id}" value="present"/>
                                                <label class="form-check-label">Present</label>
                                            </div>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" value="${a.description}"
                                                   name="description${a.student.id}"/>
                                        </td>
                                    </tr>   
                                </c:forEach>
                            </tbody>
                        </table>
                        <input type="hidden" value="${requestScope.ses.id}" name="sesid"/>
                        <button type="submit" class="btn btn-primary" >Save Attendance</button>
                    </form>
                </div> 
            </div>
        </div>

    </body>
</html>
