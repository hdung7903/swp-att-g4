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
                        <form method="POST" id="signup-form" class="signup-form" action="createClass">
                            <h2 for="first_name">Create Class</h2>
                            <p style="color: red; font-size: 18px" >${requestScope.mess}</p>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="first_name">Class Name</label>
                                    <input type="text" class="form-input" name="classname" placeholder="Enter class name" required />
                                </div>
                                <div class="form-group">
                                    <label for="gr">Class Exist:</label><br>
                                    <select class="form-group" style="width: 275px;
                                            padding: 14px;
                                            border: 1px solid #ccc;
                                            border-radius: 4px;
                                            font-size: 16px;
                                            color: #333;
                                            bottom: 24px;
                                            background-color: #fff;" name="gr">
                                        <c:forEach items="${requestScope.listG}" var="gr">  
                                            <option value="${gr.id}"> ${gr.class_name} </option>
                                        </c:forEach> 
                                    </select><br>
                                </div>  
                            </div>  
                                <div class="form-group">
                                    <label for="last_name">Link Meet</label>
                                    <input type="text" class="form-input" name="link_url" placeholder="Enter link Meet" required />
                                </div>
                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="Create"/>
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
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery-ui/jquery-ui.min.js"></script>
        <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>