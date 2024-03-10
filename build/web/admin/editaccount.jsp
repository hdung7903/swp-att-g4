<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account</title>
    </head>
    <body>
        <h1>Edit Account</h1>

        <c:if test="${not empty studentinfo}">
            <c:set var="userinfo" value="${studentinfo}" scope="request" />
            <c:set var="role" value="stu" scope="request" />
        </c:if>
        <c:if test="${not empty instructorinfo}">
            <c:set var="userinfo" value="${instructorinfo}" scope="request" />
            <c:set var="role" value="ins" scope="request" />
        </c:if>

        <form method="post" action="editacc">
            <input type="hidden" name="username" value="${userinfo.username}" />
            <input type="hidden" name="role" value="${role}" />
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" value="${userinfo.name}" required>
            <br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${userinfo.email}" required>
            <br>
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" value="${userinfo.dob}" required>
            <br>
            <label for="gender">Gender:</label>
            <input type="radio" id="gender" name="gender" value="true" ${userinfo.gender ? 'checked' : ''}> Male
            <input type="radio" id="gender" name="gender" value="false" ${!userinfo.gender ? 'checked' : ''}> Female
            <br>
            <input type="submit" value="Update">
        </form>
    </body>
</html>