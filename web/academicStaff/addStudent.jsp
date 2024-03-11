<%-- 
    Document   : insertClass
    Created on : Feb 19, 2024, 10:16:49 AM
    Author     : Administrator
--%>
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
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                font-size: 13px;
                line-height: 1.8;
                color: #222;
                font-weight: 600;

            }
            .form-group {
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <div class="container my-4">
            <div class="mb-3">
                <a href="listclass" class="text-decoration-none text-black"><i class="fas fa-arrow-left me-2"></i> Go back</a>
            </div>
            <form method="POST" id="signup-form" action="addStudent">
                <h2 class="mb-4">Create Class</h2>
                <c:set var="gsmNew" value="${requestScope.gNew}"/>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="first_name" class="form-label">Class Name</label>
                            <input type="hidden" class="form-control" name="class_id" value="${gNew.id}" readonly />
                            <input type="text" class="form-control" name="classname" value="${gNew.name}" readonly />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="last_name" class="form-label">Link Meet</label>
                            <input type="text" class="form-control" name="link_url" value="${gNew.link_url}" readonly />
                        </div>
                    </div>
                </div>  
                <div class="mb-3">
                    <label for="sub" class="form-label">Choose student's class:</label>
                </div>
                <div class="mb-3">
                    <table class="table" style="border-collapse: collapse;">
                        <tr>
                            <c:forEach items="${requestScope.listStu}" var="stu" varStatus="status">
                                <td>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="stuId" value="${stu.id}" onclick="handleCheckboxClick();"/>
                                        <label class="form-check-label">${stu.name}</label>
                                    </div>
                                </td>
                                <c:if test="${status.index % 3 == 2}">
                                </tr><tr>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </table>    
                </div>    
                <div class="mb-3">
                    <button type="submit" name="submit" id="submit" class="btn btn-primary">
                        <i class="far fa-plus"></i> Add Student
                    </button>
                </div>

            </form>
        </div>
    </body>
    <script>
        var maxClicks = 15; 
        var clickCount = 0; 

        function handleCheckboxClick() {
            var checkbox = event.target;

            if (checkbox.checked) {
                if (clickCount >= maxClicks) {
                    checkbox.checked = false;
                    alert("You have reached the maximum number of clicks.");
                } else {
                    clickCount++;
                }
            } else {
                clickCount--;
            }
        }
    </script>
</html>
