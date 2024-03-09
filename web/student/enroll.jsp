<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Enroll Class</title>
    </head>
    <body>
        <h2>Enroll in a Class</h2>


        <h3>Available Classes</h3>
        <form action="${pageContext.request.contextPath}/student/enroll" method="get">
            <label for="search">Search:</label>
            <input type="text" id="search" name="search" value="${searchTxt}">
            <input type="submit" value="Search">
        </form>

        <form action="${pageContext.request.contextPath}/student/enroll" method="post">
            <table border="1">
                <thead>
                    <tr>
                        <th>Class Name</th>
                        <th>Subject</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.gsm}" var="gsm">
                        <tr>
                            <td>${gsm.group.name}</td>
                            <td>${gsm.subject.name}</td>
                            <td><input type="hiden" id="class_id" name="class_id" required><br><br>
                                <input type="submit" value="Enroll"></td>
                        </tr>
                    </c:forEach>
                </tbody>
                <c:if test="${not empty mess}">
                    <p>${mess}</p>
                </c:if>
            </table>
        </form>
    </body>
</html>
