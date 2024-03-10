<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Create Class</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            body {
                font-size: 13px;
                line-height: 1.8;
                color: #222;
                font-weight: 600;

            }
            .signup-content {
                padding: 10px 0;
            }

            #signup-form.signup-form {
                padding: 58px 50px 0px 50px;
                height: 552px;
                overflow-y: auto;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="signup-content">
                <form method="POST" id="signup-form" class="signup-form" action="${pageContext.request.contextPath}/acad/addInsAndSub">
                    <h2 for="first_name">Create Class</h2>
                    <c:set var="gNew" value="${requestScope.gNew}"/>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="first_name" class="form-label">Class Name</label>
                            <input type="hidden" class="form-control" name="class_id" value="${gNew.id}" readonly />
                            <input type="text" class="form-control" name="classname" value="${gNew.name}" readonly />
                        </div>
                        <div class="col-md-6">
                            <label for="last_name" class="form-label">Link Meet</label>
                            <input type="text" class="form-control" name="link_url" value="${gNew.link_url}" readonly />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="birth_date" class="form-label">Total Slots</label>
                            <input type="number" class="form-control" name="slot" placeholder="Enter slot's number" required />
                        </div>
                    </div>
                    <p style="color: red; font-size: 18px">${requestScope.mess}</p>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="sub" class="form-label">Choose subject's class:</label>
                            <select class="form-select" name="sub">
                                <c:forEach items="${requestScope.listSub}" var="sub">  
                                    <option value="${sub.id}">${sub.name}</option>
                                </c:forEach> 
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <button type="submit" name="submit" id="submit" class="btn btn-primary">
                            <i class="bi bi-person-plus"></i> Create
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
