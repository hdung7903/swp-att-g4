<%-- 
    Document   : insertClass
    Created on : Feb 19, 2024, 10:16:49 AM
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
        <select>
                <option>
                    <c:forEach items="${requestScope.listIns}" var="ins">  
                        <c:out value="${ins.name}"/><p>  
                    </c:forEach> 
                </option>
            </select>
    </body>
</html>
