<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Create Class</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    </head>

    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form method="POST" id="signup-form" class="card p-4" action="${pageContext.request.contextPath}/acad/createClass">
                        <h2 class="text-center mb-4">Create Class <i class="fas fa-chalkboard-teacher"></i></h2>
                        <p style="color: green; font-size: 18px" >${requestScope.mess}</p>
                        
                        <div class="mb-3">
                            <label for="classname" class="form-label">Class Name</label>
                            <input type="text" class="form-control" name="classname" placeholder="Enter class name" required />
                        </div>
                        <div class="mb-3">
                            <label for="gr" class="form-label">Class Exist:</label>
                            <select class="form-control" name="gr">
                                <c:forEach items="${requestScope.listG}" var="gr">
                                    <option value="${gr.id}">${gr.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="link_url" class="form-label">Link Meet</label>
                            <input type="text" class="form-control" name="link_url" placeholder="Enter link Meet" required />
                        </div>

                        <div class="mb-3">
                            <button type="submit" name="submit" class="btn btn-primary"><i class="fas fa-plus-circle me-2"></i>Create</button>
                        </div>
                        
                        <div class="mb-3 text-center">
                            <a href="home.jsp" class="text-decoration-none"><i class="fas fa-home me-2"></i>Back to Home</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
