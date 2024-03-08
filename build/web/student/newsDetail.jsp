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
        <form action="newsDetail" method="post">
            <ul>
                <c:forEach var="details" items="${detail}">

                    <li>
                        <h2>${details.title}</h2>
                        <span class="create-date">
                            <fmt:formatDate value="${details.create_date}" pattern="dd/MM/yyyy"/>
                        </span> 
                        <p>${details.content}</p>

                        <br>
                    </li>

                </c:forEach>
            </ul>
        </form>
    </body>
</html>
