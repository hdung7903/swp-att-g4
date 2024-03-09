<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }
            #container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #007bff;
                margin-bottom: 20px;
            }
            form {
                margin-top: 20px;
            }
            .btn-primary {
                background-color: #28a745;
                border-color: #28a745;
            }
            .btn-primary:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }
            .form-control {
                border-color: #ced4da;
            }
            .form-control:focus {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
            }
            label {
                color: #6c757d;
            }
        </style>
    </head>
    <body>
        <div id="container">
            <h1>Create New Application</h1>
            <form action="${pageContext.request.contextPath}/student/createApplication" method="post">
                <div class="form-group">
                    <label for="typeId">Type:</label>
                    <select class="form-control" name="typeId" id="typeId" required>
                        <option value="">Chọn loại đơn</option>
                        <c:forEach var="type" items="${types}">
                            <option value="${type.id}">${type.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <input type="hidden" value="${sessionScope.accountId}" name="id">

                <div class="form-group">
                    <label for="content">Content:</label>
                    <textarea class="form-control" name="content" rows="4" cols="50" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>