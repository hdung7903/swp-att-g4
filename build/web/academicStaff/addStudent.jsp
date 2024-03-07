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
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <form method="POST" id="signup-form" class="card p-4" action="${pageContext.request.contextPath}/acad/addStudent">
                        <h2 class="text-center mb-4">Create Class <i class="fas fa-chalkboard"></i></h2>
                            <c:set var="gNew" value="${requestScope.gNew}" />
                        <div class="mb-3">
                            <label for="classname" class="form-label">Class Name</label>
                            <input type="text" class="form-control" name="classname" value="${gNew.name}" readonly />
                        </div>

                        <div class="mb-3">
                            <label for="instructor" class="form-label">Meet Link</label>
                            <input type="text" class="form-control" name="instructor" value="${gNew.link_url}" readonly />
                        </div>                     

                        <div class="mb-3">
                            <label for="sub" class="form-label">Choose student's class:</label>
                        </div>

                        <div class="mb-3">
                            <div class="row">
                                <c:forEach items="${requestScope.listStu}" var="stu" varStatus="status">
                                    <div class="col-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="stuId" value="${stu.id}" id="stu${status.index + 1}" onclick="handleCheckboxClick();" />
                                            <label class="form-check-label" for="stu${status.index + 1}">${stu.name}</label>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="mb-3">
                            <button type="submit" name="submit" class="btn btn-primary"><i class="fas fa-user-plus me-2"></i>Add Student</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
        <script>
                                                var maxClicks = 15;
                                                var clickCount = 0;

                                                function handleCheckboxClick() {
                                                    var checkbox = event.target;

                                                    if (checkbox.checked) {
                                                        if (clickCount >= maxClicks) {
                                                            checkbox.checked = false; // Không cho phép bấm thêm checkbox nếu đã đạt giới hạn
                                                            alert("You have reached the maximum number of clicks.");
                                                        } else {
                                                            clickCount++;
                                                        }
                                                    } else {
                                                        clickCount--;
                                                    }
                                                }
        </script>
    </body>
</html>
