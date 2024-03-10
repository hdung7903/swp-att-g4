<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Update Class</title>
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
                        <form method="POST" id="signup-form" class="signup-form" action="${pageContext.request.contextPath}/acad/updateclass">
                            <h2 for="first_name">Update Class</h2>
                            <h6 style="color: red"  for="warning">You just can change the instructor and total slots of class</h6>
                            <c:set var="gsm" value="${requestScope.gsm}"/>
                            <div class="form-row">
                                <div class="form-group">
                                    <input type="hidden" class="form-input" name="csm_id" value="${gsm.id}" readonly />
                                    <label for="first_name">Class Name</label>
                                    <input type="text" class="form-input" name="classname" value="${gsm.group.name}" readonly />
                                </div>
                                <div class="form-group">
                                    <label for="first_name">Subject Name</label>
                                    <input type="text" class="form-input" name="subjectname" value="${gsm.subject.name}" readonly />
                                </div>
                                <div class="form-group">
                                    <label for="last_name">Instructor</label>
                                    
                                    <input type="text" class="form-input" name="#" value="${empty gsm.instructor.name ? 'Unknown' : gsm.instructor.name}" readonly />
                                    <br>
                                    <label for="instructor_name">Choose another Instructor:</label><br>
                                    <select id="" class="form-group" style="width: 275px;
                                            padding: 14px;
                                            border: 1px solid #ccc;
                                            border-radius: 4px;
                                            font-size: 16px;
                                            color: #333;
                                            bottom: 22px;
                                            background-color: #fff;"name="ins">
                                        <c:forEach items="${requestScope.listSim}" var="sim">  
                                            <option value="${sim.instructor.id}">${sim.instructor.name} </option>
                                        </c:forEach> 
                                    </select>
                                </div>
                            </div>  
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="slots">Total Slots</label>
                                    <input type="text" class="form-input" name="total_slots" value="${gsm.total_slots}"  />
                                </div>
                            </div>
                            <p style="color: red; font-size: 18px" >${requestScope.mess}</p>
                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="Update"/>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>

        <script>
            function sendRequest() {
                var selectedOption = document.getElementById("selectSub").value;

                if (selectedOption) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.open("POST", classDetails?subjectId = " + selectedOption, true);
                            xhttp.send();
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