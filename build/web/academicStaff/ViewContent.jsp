<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application Details</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .container {
                margin-top: 50px;
            }
            .btn {
                margin-right: 10px;
            }
            .textarea-comment {
                width: 100%;
                margin-top: 20px;
            }
        </style>
        <script>
            function showMessage(message) {
                alert(message);
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1 class="mb-4">Application Details</h1>
            <div class="row">
                <div class="col-md-6">
                    <p><strong>ID:</strong> ${application.id}</p>
                    <p><strong>Content:</strong> ${application.content}</p>
                    <p><strong>Create Date:</strong> ${application.create_date}</p>
                    <p><strong>Student Name:</strong> ${application.student.name}</p>
                    <p><strong>Student ID:</strong> ${application.student.id}</p>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/acad/approve" method="post">
                <input type="hidden" name="appId" value="${application.id}">
                <button type="submit" class="btn btn-success" name="approve" onclick="showMessage('Approve successful')">Approve</button>
                <button type="submit" class="btn btn-danger" name="reject" onclick="showMessage('Reject successful')">Reject</button>
                <br>
                <textarea name="comment" class="form-control textarea-comment" rows="4" placeholder="Enter your comment..."></textarea>
            </form>
        </div>
    </body>
</html>