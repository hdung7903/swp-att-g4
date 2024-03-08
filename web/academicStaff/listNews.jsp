<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>List News</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }

        </style>
    </head>
    <body>
        <h2>List News</h2>
        <a href="${pageContext.request.contextPath}/acad/createNews">Create New</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Date</th>
                    <th>Title</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="news" items="${listNews}">
                    <tr>
                        <td>${news.id}</td>
                        <td>
                            <span class="create-date">
                                <fmt:formatDate value="${news.create_date}" pattern="dd/MM/yyyy"/>
                            </span>
                        </td>

                        <td> ${news.title}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/acad/updateNews?id=${news.id}">Update</a>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/acad/deleteNews" method="post">
                                <input type="hidden" name="id" value="${news.id}">
                                <button type="submit">Delete</button>
                            </form>
                        </td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
