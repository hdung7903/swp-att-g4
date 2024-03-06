<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Application</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
            }

            #container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #0d6efd;
                margin-bottom: 30px;
            }

            form {
                margin-top: 20px;
            }

            .btn-primary {
                background-color: #198754;
                border-color: #198754;
                width: 100%;
            }

            .btn-primary:hover {
                background-color: #157347;
                border-color: #157347;
            }

            .form-control {
                border-color: #ced4da;
                margin-bottom: 20px;
            }

            .form-control:focus {
                border-color: #198754;
                box-shadow: 0 0 0 0.2rem rgba(25, 135, 84, 0.25);
            }

            label {
                color: #6c757d;
                font-weight: bold;
            }

            .input-group-text {
                background-color: #198754;
                border-color: #198754;
                color: #ffffff;
            }

            .input-group-text i {
                font-size: 18px;
            }
        </style>
    </head>

    <body>
        <div id="container">
            <h1>Create New Application <i class="fas fa-pencil-alt"></i></h1>
            <form action="${pageContext.request.contextPath}/student/createApplication" method="post">
                <div class="mb-3">
                    <label for="typeId" class="form-label">Type</label>
                    <div class="input-group">
                        <select class="form-select" name="typeId" id="typeId" required>
                            <option value="" selected disabled>Select Type</option>
                            <c:forEach var="type" items="${types}">
                                <option value="${type.id}">${type.name}</option>
                            </c:forEach>
                        </select>
                        <label class="input-group-text" for="typeId"><i class="fas fa-list-alt"></i></label>
                    </div>
                </div>

                <input type="hidden" value="${sessionScope.accountId}" name="id">

                <div class="mb-3">
                    <label for="content" class="form-label">Content</label>
                    <div class="input-group">
                        <textarea class="form-control" name="content" rows="4" cols="50" required></textarea>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary"><i class="fas fa-paper-plane"></i> Submit</button>
                <div class="mb-3 text-center">
                    <a href="home.jsp" class="text-decoration-none"><i class="fas fa-home me-2"></i>Back to Home</a>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    </body>

</html>
