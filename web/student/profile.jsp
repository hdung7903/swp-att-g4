<%-- 
    Document   : profile
    Created on : 25 Jan, 2024, 11:59:24 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="dal.*" %>
<%@page import="entity.*" %>
<%@page import="constant.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <style>
            li {
                list-style: none;
                font-size: 15px;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <%@include file="./navbar.jsp" %> 
        <c:set var="ins" value="${requestScope.currentAcc}"/>
        <div class="container">
            <div class="text-center">
                <ul class="d-flex py-4 border-top border-bottom text-center w-75">
                    <c:forEach var="info" items="${IConstant.PROFILE_OPTION}">
                        <li class="me-5">
                            <a href="profile?Service=${info}" class="text-decoration-none
                               ${info.equals(requestScope.currentChoice)?'text-danger':'text-black'}">
                                ${info}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <c:if test="${isSuccess!=null}">
                <div class="fs-4 alert ${isSuccess==true?"alert-success":"alert-danger"}" role="alert">
                    ${mess}
                </div>
            </c:if>

            <c:if test="${requestScope.currentChoice==IConstant.PROFILE_OPTION[0]}">
                <div class="mb-5">
                    <h2 class="text-center">Account Information</h2>
                    <form>
                        <div class="">
                            <div class="">
                                <!-- Inside the Account Information Section -->
                                <div class="row">
                                    <div class="col-lg-12 text-center mb-4">
                                        <img src="https://cdn.discordapp.com/attachments/947741416992436235/1171005032691404921/profile.png?ex=655b1a6c&is=6548a56c&hm=428202d73c6b3e95f3b966e3840f79186e79afdc98a879ea0492fa4957d08806&" 
                                             alt="avatar" class="img-fluid rounded-circle" style="max-width: 150px;">
                                    </div>
                                </div>
                                <div class="col-lg-8 mx-auto">
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <p class="mb-0">Full Name</p>
                                                </div>
                                                <div class="col-sm-8">
                                                    <input type="text-muted mb-0" class="form-control px-4 py-2 fs-5 rounded-xl"
                                                           placeholder="Username"
                                                           value="${ins.getName()}" hidden>
                                                    <span>${ins.getName()}</span>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <p class="mb-0">Instructor ID</p>
                                                </div>
                                                <div class="col-sm-8">
                                                    <input type="text-muted mb-0" class="form-control px-4 py-2 fs-5 rounded-xl"
                                                           placeholder="Username"
                                                           value="${ins.getId()}" hidden>
                                                    <span>${ins.getId()}</span>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <p class="mb-0">Email</p>
                                                </div>
                                                <div class="col-sm-8">
                                                    <input type="text-muted mb-0" class="form-control px-4 py-2 fs-5 rounded-xl"
                                                           value="${ins.getEmail()}"
                                                           placeholder="Username" hidden>
                                                    <span>${ins.getEmail()}</span>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <p class="mb-0">Date of birth</p>
                                                </div>
                                                <div class="col-sm-8">
                                                    <input type="date"
                                                           value="${ins.getDob()}"
                                                           class="form-control px-4 py-2 fs-5 rounded-xl" 
                                                           value="28/12/2003" hidden>
                                                    <span>${ins.getDob()}</span>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <p class="mb-0">Gender</p>
                                                </div>
                                                <div class="col-sm-8">
                                                    <input type="text-muted mb-0" class="form-control px-4 py-2 fs-5 rounded-xl"
                                                           value="${ins.isGender() ? 'Nam' : 'Nữ'}"
                                                           placeholder="Username" hidden>
                                                    <span>${ins.isGender() ? 'Nam' : 'Nữ'}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                    </form>

                </div>
            </c:if>
            <c:if test="${requestScope.currentChoice==IConstant.PROFILE_OPTION[1]}">
                <form method="POST" action="profile">
                    <div class="mx-auto" style="max-width: 800px;">
                        <h2 class="text-center">Change password</h2>
                        <div class="mx-auto">
                            <div class="">
                                <div class="px-5">
                                    <div class="mt-5 form-group">
                                        <h4 class="fw-medium">Current password</h4>
                                        <div class="input-group flex-nowrap">
                                            <input type="password"
                                                   name="oldPas"
                                                   class="form-control px-4 py-2 fs-5 rounded-xl"
                                                   placeholder="Current password"
                                                   required>
                                            <button class="btn btn-outline-secondary" type="button" id="togglePassword1">
                                                <span id="eyeIcon"><i class="bi bi-eye-slash-fill"></i></span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="mt-5 form-group">
                                        <h4 class="fw-medium">New password</h4>
                                        <div class="input-group flex-nowrap">
                                            <input type="password" 
                                                   name="newPas"
                                                   class="form-control px-4 py-2 fs-5 rounded-xl"
                                                   placeholder="New password"required>
                                            <button class="btn btn-outline-secondary" type="button" id="togglePassword2">
                                                <span id="eyeIcon"><i class="bi bi-eye-slash-fill"></i></span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="mt-5 form-group">
                                        <h4 class="fw-medium">Confirm password</h4>
                                        <div class="input-group flex-nowrap">
                                            <input type="password" 
                                                   name="confirmPas"
                                                   class="form-control px-4 py-2 fs-5 rounded-xl"
                                                   placeholder="Confirm password">
                                            <button class="btn btn-outline-secondary" type="button" id="togglePassword3">
                                                <span id="eyeIcon"><i class="bi bi-eye-slash-fill"></i></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="text-center mt-4">
                            <button type="submit" class="ms-5 mt-5 px-5 fs-5 border-0 bg-success text-white rounded">Change</button>
                        </div>
                    </div>
                </form>
                <script>
                    document.getElementById("togglePassword1").addEventListener("click", function () {
                        var passwordInput = document.getElementsByName("oldPas")[0];
                        var eyeIcon = document.getElementById("eyeIcon");

                        if (passwordInput.type === "password") {
                            passwordInput.type = "text";
                            eyeIcon.innerHTML = '<i class="bi bi-eye-fill"></i>';
                        } else {
                            passwordInput.type = "password";
                            eyeIcon.innerHTML = '<i class="bi bi-eye-slash-fill"></i>';
                        }
                    });
                    document.getElementById("togglePassword2").addEventListener("click", function () {
                        var passwordInput = document.getElementsByName("newPas")[0];
                        var eyeIcon = document.getElementById("eyeIcon");

                        if (passwordInput.type === "password") {
                            passwordInput.type = "text";
                            eyeIcon.innerHTML = '<i class="bi bi-eye-fill"></i>';
                        } else {
                            passwordInput.type = "password";
                            eyeIcon.innerHTML = '<i class="bi bi-eye-slash-fill"></i>';
                        }
                    });
                    document.getElementById("togglePassword3").addEventListener("click", function () {
                        var passwordInput = document.getElementsByName("confirmPas")[0];
                        var eyeIcon = document.getElementById("eyeIcon");

                        if (passwordInput.type === "password") {
                            passwordInput.type = "text";
                            eyeIcon.innerHTML = '<i class="bi bi-eye-fill"></i>';
                        } else {
                            passwordInput.type = "password";
                            eyeIcon.innerHTML = '<i class="bi bi-eye-slash-fill"></i>';
                        }
                    });
                </script>
            </c:if>
        </div>
    </body>
</html>