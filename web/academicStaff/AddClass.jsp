<%-- 
    Document   : AddClass
    Created on : Feb 19, 2024, 8:50:17 AM
    Author     : Administrator
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="class" method="post">
            <input name="classname" type="text" placeholder="Enter class name" required>
            <input name="link_url" type="text" placeholder="Enter link Meet" required> <br>
            <label for="cars">Choose instructor's class:</label><br>
            <select>
                <c:forEach items="${requestScope.listIns}" var="ins">  
                <option value="${ins.id}"> ${ins.name} </option>
                </c:forEach> 
            </select>
            <label for="cars">Choose subject's class:</label><br>
            <select>
                <c:forEach items="${requestScope.listSub}" var="sub">  
                  <option value="${sub.id}"> ${sub.name} </option>
                </c:forEach> 
            </select>
            <button type="submit" >Create Class</button>
        </form>       
    </body>
</html>
