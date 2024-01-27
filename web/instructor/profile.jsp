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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <style>
            li {
                list-style: none;
                font-size: 15px;
                font-weight: bold;
            }
            custom-checkbox {
                width: 20px;
                height: 20px;
                border: 1px solid #000;
                cursor: pointer;
                position: relative;
            }

            custom-checkbox::before {
                content: '\2713'; /* Unicode character for checkmark */
                font-size: 16px;
                display: none;
                text-align: center;
                line-height: 20px;
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
            }

            custom-checkbox[data-checked="true"]::before {
                display: block;
                color: #fff; /* Màu văn bản của dấu tích */
                background-color: #007bff; /* Màu nền của ô được tích (màu xanh đậm) */
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
                                <div class="mt-5 ">
                                    <h4 class="fw-medium">Image</h4>
                                    <img src="C:\Users\ADMIN\Documents\SWP\SWP_Nhom\swp-att-g4\web\avatar-trang-4.jpg" class="img-fluid mb-3" style="max-width: 50px;">

                                </div>

                                <div class="mt-5 ">
                                    <h4 class="fw-medium">Full name</h4>
                                    <div class="input-group flex-nowrap">
                                        <input type="text" class="form-control px-4 py-2 fs-5 rounded-xl"
                                               placeholder="Username"
                                               value="${ins.getName()}"readonly
                                               >
                                    </div>
                                </div>
                                <div class="mt-5">
                                    <h4 class="fw-medium">Email</h4>
                                    <div class="input-group flex-nowrap">
                                        <input type="text" class="form-control px-4 py-2 fs-5 rounded-xl"
                                               value="${ins.getEmail()}"
                                               placeholder="Username" readonly>
                                    </div>
                                </div>
                                <div class="mt-5">
                                    <h4 class="fw-medium">Date of birth</h4>
                                    <div class="input-group flex-nowrap">
                                        <input type="date"
                                               value="${ins.getDob()}"
                                               class="form-control px-4 py-2 fs-5 rounded-xl" value="28/12/2003"readonly>
                                    </div>
                                </div>
                                <div class="mt-5">
                                    <h4 class="fw-medium">Gender</h4>
                                    <div class="d-flex">
                                        <div class="w-25">
                                            <label for="" class="d-flex align-items-center me-3 fs-5">Nam</label>
                                            <input type="checkbox" class="custom-checkbox" name="gender"
                                                   ${ins.isGender()==true?'checked':''}
                                                   class=""disabled>
                                        </div>
                                        <div class="w-25">
                                            <label for="" class="d-flex align-items-center me-3 fs-5">Nữ</label>
                                            <input type="checkbox" class="custom-checkbox"
                                                   ${ins.isGender()==false?'checked':''}
                                                   name="gender"disabled>
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
            <div class="">
                <h2 class="text-center">Change password</h2>
                <div class="mx-auto">
                    <div class="">
                        <div class="px-5">
                            <div class="mt-5">
                                <h4 class="fw-medium">Current password</h4>
                                <div class="input-group flex-nowrap">
                                    <input type="password"
                                           name="oldPas"
                                           class="form-control px-4 py-2 fs-5 rounded-xl"
                                           placeholder="Current password">
                                </div>
                            </div>
                            <div class="mt-5">
                                <h4 class="fw-medium">New password</h4>
                                <div class="input-group flex-nowrap">
                                    <input type="password" 
                                           name="newPas"
                                           class="form-control px-4 py-2 fs-5 rounded-xl"
                                           placeholder="New password">
                                </div>
                            </div>
                            <div class="mt-5">
                                <h4 class="fw-medium">Confirm password</h4>
                                <div class="input-group flex-nowrap">
                                    <input type="password" 
                                           name="confirmPas"
                                           class="form-control px-4 py-2 fs-5 rounded-xl"
                                           placeholder="Confirm password">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="ms-5 mt-5 px-5 fs-5 border-0 bg-success text-white rounded">Change</button>
        </form>
    </c:if>
</div>
</body>
</html>