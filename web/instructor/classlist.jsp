<%-- 
    Document   : classlist
    Created on : Jan 8, 2024, 8:37:49 PM
    Author     : leduy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %>
            <div class="row">
                        <div class="col-md-12">
                            <form action="${pageContext.request.contextPath}/instructor/viewclass" method="get">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr class="text-center">
                                            <th style="font-size: 12px;
                                                white-space: nowrap;"></th>
                                            <th style="font-size: 12px;
                                                white-space: nowrap;">Class</th>
                                            <th style="font-size: 12px;
                                                white-space: nowrap;">Subject</th>
                                            <th style="font-size: 12px;
                                                white-space: nowrap;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.gsm}" var="g" varStatus="index">
                                            <tr class="text-center">
                                                <td>
                                                    ${index.index + 1}
                                                </td>
                                                <td style="font-size: 12px;
                                                    white-space: nowrap;">${g.class.name}</td> 
                                                <td style="font-size: 12px;
                                                    white-space: nowrap;">${g.subject.name}</td> 
                                                <td style="font-size: 12px;
                                                    white-space: nowrap;">
                                                    <a class="nav-link" href="attstatistic"><i class="bi bi-clipboard-data"></i> Attendance Report</a>
                                                    </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </form> 
                        </div> 
                    </div>
        </div>
    </body>
</html>
