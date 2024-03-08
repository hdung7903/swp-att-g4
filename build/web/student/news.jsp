<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>News List</title>
        <style>
            ul {
                list-style-type: none;
                padding: 0;
            }
            li {
                margin-bottom: 10px;
            }
            .news-title {
                font-weight: bold;
                color: #80bdff;
            }
            .create-date  {
                color: #76b7e9;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <h2>List News</h2>
        <ul>
            <c:forEach var="news" items="${newsList}">
                <li>
                    <span class="create-date">
                            <fmt:formatDate value="${news.create_date}" pattern="dd/MM/yyyy"/>
                        </span> :
                    <a href="${pageContext.request.contextPath}/student/newsDetail?id=${news.id}">
                        <span class="news-title">${news.title}</span>
                    </a>
                    <br>
                </li>
            </c:forEach>
        </ul>
    </body>
</html>
