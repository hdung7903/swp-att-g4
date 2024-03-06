<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Create Class</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="../css/style.css">
    </head>

    <body>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form method="POST" id="signup-form" class="card p-4" action="${pageContext.request.contextPath}/acad/addInsAndSub">
                        <h2 class="text-center mb-4">Create Class <i class="fas fa-chalkboard"></i></h2>
                            <c:set var="gNew" value="${requestScope.gNew}" />
                        <div class="mb-3">
                            <label for="classname" class="form-label">Class Name</label>
                            <input type="text" class="form-control" name="classname" value="${gNew.name}" readonly />
                        </div>

                        <div class="mb-3">
                            <label for="link_url" class="form-label">Link Meet</label>
                            <input type="text" class="form-control" name="link_url" value="${gNew.link_url}" readonly />
                        </div>

                        <div class="mb-3">
                            <label for="slot" class="form-label">Total Slots</label>
                            <input type="number" class="form-control" name="slot" placeholder="Enter slot's number" required />
                        </div>

                        <p class="text-danger fs-5">${requestScope.mess}</p>

                        <div class="mb-3">
                            <label for="sub" class="form-label">Choose subject's class:</label>
                            <select class="form-select" name="sub">
                                <c:forEach items="${requestScope.listSub}" var="sub">
                                    <option value="${sub.id}">${sub.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="ins" class="form-label">Choose instructor's class:</label>
                            <select class="form-select" name="ins">
                                <c:forEach items="${requestScope.listIns}" var="ins">
                                    <option value="${ins.id}">${ins.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <button type="submit" name="submit" class="btn btn-primary"><i class="fas fa-plus me-2"></i>Create</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
