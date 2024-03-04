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

        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>

        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <form method="POST" id="signup-form" class="signup-form" action="${pageContext.request.contextPath}/acad/addInsAndSub">
                            <h2 for="first_name">Create Class</h2>
                            <c:set var="gNew" value="${requestScope.gNew}"/>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="first_name">Class Name</label>
                                    <input type="text" class="form-input" name="classname" value="${gNew.name}" readonly />
                                </div>
                                <div class="form-group">
                                    <label for="last_name">Link Meet</label>
                                    <input type="text" class="form-input" name="link_url" value="${gNew.link_url}" readonly />
                                </div>
                            </div>  
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="birth_date">Total Slots</label>
                                    <input type="number" class="form-input" name="slot" placeholder="Enter slot's number" required/>
                                </div>
                            </div>
                                <p style="color: red; font-size: 18px" >${requestScope.mess}</p>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="sub">Choose subject's class:</label><br>
                                    <select class="form-group" style="width: 275px;
                                            padding: 14px;
                                            border: 1px solid #ccc;
                                            border-radius: 4px;
                                            font-size: 16px;
                                            color: #333;
                                            bottom: 22px;
                                            background-color: #fff;"name="sub">
                                        <c:forEach items="${requestScope.listSub}" var="sub">  
                                            <option value="${sub.id}">${sub.name} </option>
                                        </c:forEach> 
                                    </select><br>
                                </div>
                                <div class="form-group">
                                    <label for="ins">Choose instructor's class:</label><br>
                                    <select class="form-group" style="width: 275px;
                                            padding: 14px;
                                            border: 1px solid #ccc;
                                            border-radius: 4px;
                                            font-size: 16px;
                                            color: #333;
                                            bottom: 22px;
                                            background-color: #fff;" name="ins">
                                        <c:forEach items="${requestScope.listIns}" var="ins">  
                                            <option value="${ins.id}"> ${ins.name} </option>
                                        </c:forEach> 
                                    </select><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="Create"/>
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
