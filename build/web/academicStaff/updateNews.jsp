<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Update News</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <style>
        a{
            text-decoration: none;
        }
    </style>
    <body>
        <div class="container mt-4">
            <a href="${pageContext.request.contextPath}/acad/listNews" class="text-black mb-3">
                <i class="fas fa-chevron-left"></i> Go Back
            </a>
            <h2 class="my-3">Update News</h2>            
            <form action="${pageContext.request.contextPath}/acad/updateNews" method="post">
                <input type="hidden" name="id" value="${news.id}">
                <div class="mb-3">
                    <label for="title" class="form-label">Title:</label>
                    <input type="text" class="form-control" id="title" name="title" value="${news.title}" required>
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">Content:</label>
                    <textarea class="form-control" id="content" name="content" rows="5" required>${news.content}</textarea>
                </div>
                <button type="submit" class="btn btn-primary"><i class="fas fa-edit"></i> Update</button>
            </form>
        </div>
    </body>
</html>