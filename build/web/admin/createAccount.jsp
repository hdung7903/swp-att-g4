<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

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
        margin: auto; background-size: 100% !important;
        background-image: url('https://phunugioi.com/wp-content/uploads/2022/07/Hinh-nen-powerpoint-hoc-tap.jpg')!important; 
        background-repeat: no-repeat !important;
        background-position: center !important;
    }
</style>
<body class="bg-image">
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
            <c:if test="${mess!=null}">
                <div class="fs-4 alert ${result==true?"alert-success":"alert-danger"}" role="alert">
                    ${mess}
                </div>
            </c:if>
            <div class="w-50 bg-white shadow mx-auto p-5" style="height: 600px; border-radius: 15px;">
              <h3>Create account</h3>
              <form action="createacc" method="POST" id="addForm" >
                <input type="text" name="action" value="add" hidden required>
                <div class="row">
                 <div class="mt-3 col-6">
                    <label for="" class="label_option fs-5 fw-blod">Id</label>
                    <input autofocus type="text" name="id" class="w-100 p-2 border-0" 
                           style="background-color: #f2f2f2; border-radius: 2px;" required value="${param.id}">
                 </div>
                 <div class="mt-3 col-6">
                    <label for="" class="label_option fs-5 fw-blod">Username</label>
                    <input autofocus type="text" name="username" class="w-100 p-2 border-0"
                           style="background-color: #f2f2f2; border-radius: 2px;" required value="${param.username}">
                    <span id="passwordHint" class="hint-msg" style="color: #808080; font-size: 10px;">* Must be no special chars</span>
                 </div>
                 <div class="mt-3 col-6">
                    <label for="" class="label_option fs-5 fw-blod">Password</label>
                    <input autofocus type="text" name="password" class="w-100 p-2 border-0"
                           style="background-color: #f2f2f2; border-radius: 2px;" required value="${param.password}">
                    <span id="passwordHint" class="hint-msg" style="color: #808080; font-size: 10px;">* Must have 8 chars, 1 num, 1uppercase, 1 special</span>
                 </div>
                 <div class="mt-3 col-6">
                    <div class="">
                        <div class="label_option fs-5 fw-blod">Gender</div>
                        <div class="mt-2">
                        <label for="" class="fs-6">Male</label>
                        <input type="radio" name="gender" value="0" checked>
                        <label for="" class="ms-3 fs-6">Female</label>
                        <input type="radio" name="gender" value="1" required>
                        </div>
                    </div>
                     <span id="passwordHint" class="hint-msg"></span>
                </div>
                 <div class="mt-3 col-6">
                     <label for="" class="label_option fs-5 fw-blod">FullName</label>
                    <input autofocus type="text" name="fullname" class="w-100 p-2 border-0"
                           style="background-color: #f2f2f2; border-radius: 5px;" required value="${param.fullname}">
                    <span id="passwordHint" class="hint-msg"></span>
                 </div>
                 <div class="mt-3 col-6">
                    <label for="" class="label_option fs-5 fw-blod">Email</label>
                    <input autofocus type="text" name="email" class="w-100 p-2 border-0"
                           style="background-color: #f2f2f2; border-radius: 5px;" required value="${param.email}">
                    <span id="passwordHint" class="hint-msg"></span>
                 </div>
                  <div class="mt-3 col-6">
                    <label for="" class="label_option fs-5 fw-blod">Birthdate</label>
                    <input autofocus type="date" name="dob" class="w-100 p-2 border-0"
                           style="background-color: #f2f2f2; border-radius: 5px;" required value="${param.dob}">
                    <span id="passwordHint" class="hint-msg"></span>
                  </div>
                  <div class="mt-3 col-6">
                    <label for="" class="label_option fs-5 fw-blod">Roles</label>
                    <select name="type" class="w-100 p-2 border-0"
                            style="background-color: #f2f2f2; border-radius: 5px;" required>
                        <option value="4">Student</option>
                        <option value="3">Instructor</option>
                    </select>
                    <span id="passwordHint" class="hint-msg"></span>
                </div>
                </div>
                <div class="mt-5">
                    <button type="submit" class="px-5 py-2 border-0 bg-success text-white"
                            style="border-radius: 5px;">Add</button>
                    <button type="reset" class="px-5 ms-3 text-white bg-danger py-2 border-0 "
                            style="border-radius: 5px;">Reset</button>
                </div>
            </form>
            </div>
        </div>
    </div>
</body>

</html>