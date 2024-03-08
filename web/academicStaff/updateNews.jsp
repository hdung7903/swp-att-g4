<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update News</title>
    <style>
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            padding: 8px 15px;
            background-color: #4CAF50;
            border: none;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Update News</h2>
    <form action="${pageContext.request.contextPath}/acad/updateNews" method="post">
        <input type="hidden" name="id" value="${news.id}">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="${news.title}" required>
        <label for="content">Content:</label>
        <textarea id="content" name="content" rows="5" required>${news.content}</textarea>
        <input type="submit" value="Update">
    </form>
</body>
</html>
