<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <style>
        .label_option {
            min-width: 130px;
        }
        .bg-image {
            margin: auto;
            background-size: 100% !important;
            background-image: url('https://phunugioi.com/wp-content/uploads/2022/07/Hinh-nen-powerpoint-hoc-tap.jpg')!important;
            background-repeat: no-repeat !important;
            background-position: center !important;
        }
    </style>
    <body class="bg-image">
        <%@include file="./navbar.jsp" %>
        <div class="mt-5">
            <div class="container">
                <div>
                    <a href="manageacc" class="d-block text-decoration-none my-3">
                        <div class="d-flex align-items-center text-dark">
                            <i class='bx bx-chevron-left fs-3 text-white '></i>
                            <span class="fs-3 text-white ">Back</span>
                        </div>
                    </a>
                </div>
                <c:if test="${not empty studentinfo}">
                    <c:set var="userinfo" value="${studentinfo}" scope="request" />
                    <c:set var="role" value="stu" scope="request" />
                </c:if>
                <c:if test="${not empty instructorinfo}">
                    <c:set var="userinfo" value="${instructorinfo}" scope="request" />
                    <c:set var="role" value="ins" scope="request" />
                </c:if>
                <div class="w-50 bg-white shadow mx-auto p-5" style="height: 600px; border-radius: 15px;">
                    <h2>Edit Account</h2>
                    <div class="mt-5">
                        <form method="post" action="editacc">
                            <div class="row">
                            <div class="mb-4 col-6">
                                <label for="" class="label_option fs-5 fw-blod">Id</label>
                                <input autofocus type="text" name="id" class="w-100 p-2 border-0" 
                                       style="background-color: #f2f2f2; border-radius: 2px;" value="${userinfo.id}" readonly>
                            </div>
                            <div class="mb-4 col-6">
                                <label for="" class="label_option fs-5 fw-blod">Username</label>
                                <input autofocus type="text" name="id" class="w-100 p-2 border-0" 
                                       style="background-color: #f2f2f2; border-radius: 2px;" value="${userinfo.username}" readonly>
                            </div>
                            <div class="mb-4 col-6">
                                <label for="name" class="label_option fs-5 fw-blod">Full Name:</label>
                                <input type="text" id="name" name="name" class="w-100 p-2 border-0 mb-3" 
                                       style="background-color: #f2f2f2; border-radius: 2px;" required value="${userinfo.name}">
                            </div>
                            <div class="mb-4 col-6">
                                <label for="email" class="label_option fs-5 fw-blod">Email:</label>
                                <input type="email" id="email" name="email" class="w-100 p-2 border-0 mb-3" 
                                       style="background-color: #f2f2f2; border-radius: 2px;" required value="${userinfo.email}">
                            </div>
                            <div class="mb-4 col-6">
                                <label for="dob" class="label_option fs-5 fw-blod">Date of Birth:</label>
                                <input type="date" id="dob" name="dob" class="w-100 p-2 border-0 mb-3" 
                                       style="background-color: #f2f2f2; border-radius: 2px;" required value="${userinfo.dob}">
                            </div>
                            <div class="mb-4 col-6">
                                <label for="gender" class="label_option fs-5 fw-blod">Gender:</label>
                                <select id="gender" name="gender" class="form-select" required>
                                    <option value="true" ${userinfo.gender ? 'selected' : ''}>Male</option>
                                    <option value="false" ${!userinfo.gender ? 'selected' : ''}>Female</option>
                                </select>
                            </div>

                            <br>
                            <div class="mt-5 d-flex justify-content-center">
                                <button type="submit" class="px-5 py-2 border-0 bg-success text-white me-3" style="border-radius: 5px;">Save</button>
                                <button type="reset" class="px-5 py-2 border-0 bg-danger text-white" style="border-radius: 5px;">Reset</button>
                            </div>
                        </form>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </body>
</html>
