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

        <!-- Font Icon -->
        <link rel="stylesheet" href="../css/fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="../css/vendor/jquery-ui/jquery-ui.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <form method="POST" id="signup-form" class="signup-form" action="addStudent">
                            <h2 for="first_name">Create Class</h2>
                            <c:set var="gsmNew" value="${requestScope.gNew}"/>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="first_name">Class Name</label>
                                    <input type="text" class="form-input" name="classname" value="${gNew.class_name}" readonly />
                                </div>
                                <div class="form-group">
                                    <label for="last_name">Link Meet</label>
                                    <input type="text" class="form-input" name="link_url" value="${gNew.link_url}" readonly />
                                </div>
                            </div>  
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="sub">Choose student's class:</label>
                                </div>
                            </div>
                            <div class="form-row">
                                <table style="width: 100%; border-collapse: collapse;">
                                    <tr>
                                        <c:forEach items="${requestScope.listStu}" var="stu" varStatus="status">
                                            <td>
                                                <div style="display: flex; align-items: center;">

                                                    <label style="margin-left: 5px;">${stu.name}</label>
                                                    <input style="width: 20px" type="checkbox" name="stuId" value="${stu.id}" onclick="handleCheckboxClick();"/>
                                                </div>
                                            </td>
                                            <c:if test="${status.index % 3 == 2}">
                                            </tr><tr>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                </table>    
                            </div>    
                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="Add Student"/>
                            </div>
                            <div class="form-group">
                                <a href="home.jsp">Back to Home</a>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>
        <!-- JS -->
        <script>
            var maxClicks = 15; // Số lượt checkbox tối đa được bấm
            var clickCount = 0; // Biến đếm số lượt checkbox đã được bấm

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
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery-ui/jquery-ui.min.js"></script>
        <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>