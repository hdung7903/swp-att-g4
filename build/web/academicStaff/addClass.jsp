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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            body {
                font-size: 13px;
                line-height: 1.8;
                color: #222;
                font-weight: 600;
                font-family: 'Montserrat';
                background: #c5e9ff;
                padding: 115px 0;
                align-items: center;
            }
            .container{
                width: 680px;
                position: relative;
                margin: 0 auto;
                box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
                -moz-box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
                -webkit-box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
                -o-box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
                -ms-box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
                background: #fff;
            }
            .signup-content{
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
                                    <input type="hidden" class="form-input" name="class_id" value="${gNew.id}" readonly />
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