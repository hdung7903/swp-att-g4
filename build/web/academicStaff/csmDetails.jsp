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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                padding: 115px 0;
                align-items: center;
            }
            .container {
                max-width: 680px;
                margin: 0 auto;
                box-shadow: 0px 10px 9.9px 0.1px rgba(0, 0, 0, 0.1);
                background: #fff;
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
        <div class="main">            
            <section class="signup">                
                <div class="container">
                    <a href="details?id=${requestScope.gsm.group.id}" style="text-decoration:none;" class="text-black"><i class="fas fa-arrow-left me-2"></i>Back to Home</a>
                    <div class="signup-content">
                        <form method="POST" id="signup-form" class="signup-form" action="${pageContext.request.contextPath}/acad/updateclass">
                            <h2>Update Class</h2>
                            <h6 class="text-danger">You can only change the instructor and total slots of the class</h6>
                            <c:set var="gsm" value="${requestScope.gsm}"/>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <input type="hidden" class="form-control" name="csm_id" value="${gsm.id}" readonly />
                                    <label for="first_name">Class Name</label>
                                    <input type="text" class="form-control" name="classname" value="${gsm.group.name}" readonly />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="first_name">Subject Name</label>
                                    <input type="text" class="form-control" name="subjectname" value="${gsm.subject.name}" readonly />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="last_name">Instructor</label>
                                    <input type="text" class="form-control" name="#" value="${empty gsm.instructor.name ? 'Unknown' : gsm.instructor.name}" readonly />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="instructor_name">Choose another Instructor:</label>
                                    <select class="form-select" name="ins">
                                        <c:forEach items="${requestScope.listSim}" var="sim">  
                                            <option value="${sim.instructor.id}">${sim.instructor.name}</option>
                                        </c:forEach> 
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="slots">Total Slots</label>
                                    <input type="text" class="form-control" name="total_slots" value="${gsm.total_slots}" />
                                </div>
                            </div>
                            <p class="text-danger">${requestScope.mess}</p>
                            <div class="mb-3">
                                <button type="submit" name="submit" class="btn btn-primary"><i class="fas fa-save me-2"></i>Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
