<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="model.*"%>
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
        <style>
            .strikethrough {
                text-decoration: line-through;
            }
        </style>
    </head>

    <body>
        <div class="container mt-5">
            <div>
                <a href="manageacc" class="d-block text-decoration-none my-3">
                    <div class="d-flex align-items-center text-dark">
                        <i class='bx bx-chevron-left fs-3'></i>
                        <span class="fs-3">Back</span>
                    </div>
                </a>
            </div>
            <div class="d-flex align-items-center justify-content-between">
                <h3>List Account Delete</h3>
            </div>
            <div class="mt-3 d-flex align-items-center justify-content-between">
                <form action="manageacc" method="GET" class="d-flex">
                    <div class="me-3">
                        <input name="action" value="search" hidden />
                        <input name="deleted" value="true" hidden />
                        <input class="form-control" placeholder="Search" name="q" value="${searchTxt}" />
                    </div>
                    <div class="me-3">
                        <select class="form-select" name="role">
                            <option value="0" ${role == '0' ? 'selected' : ''}>All</option>
                            <option value="1" ${role == '1' ? 'selected' : ''}>Staff</option>
                            <option value="2" ${role == '2' ? 'selected' : ''}>Admin</option>
                            <option value="3" ${role == '3' ? 'selected' : ''}>Instructor</option>
                            <option value="4" ${role == '4' ? 'selected' : ''}>Student</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary mx-2">Search</button>
                    <a href="manageacc" class="btn btn-danger mx-2">Reset</a>
                </form>
            </div>
            <div class="mt-5">
                <div class="row border-bottom">
                    <div class="col-1">No.</div>
                    <div class="col-3">Email</div>
                    <div class="col-2">Full Name</div>
                    <div class="col-2">Account Name</div>
                    <div class="col-1">Role</div>
                    <div class="col-3">Action</div>
                </div>
                <c:set var="index" value="1" />
                <c:if test="${not empty listManage}">
                    <c:forEach var="acc" items="${listManage}">
                        <div class="row border-bottom py-3 mt ${acc.isDeleted ? 'strikethrough' : ''}">
                            <div class="col-1">${index}</div>
                            <div class="col-3">${fn:escapeXml(acc.getEmail())}</div>
                            <div class="col-2">${fn:escapeXml(acc.getName())}</div>
                            <div class="col-2">${fn:escapeXml(acc.getUsername())}</div>
                            <div class="col-1">${acc.getRole_id() == 1 ? 'Academic Staff' : 'Admin'}</div>
                            <div class="col-3">
                                <div class="btn-group">
                                    <a href="manageacc?action=restore&username=${acc.getUsername()}"
                                       class="btn btn-info text-white text-decoration-none">Restore</a>
                                    <a href="#" onclick="confirmDelete('${acc.getUsername()}')"
                                       class="bg-danger text-white border px-3 py-2 text-decoration-none">Delete</a>
                                </div>
                            </div>
                        </div>
                        <c:set var="index" value="${index + 1}" />
                    </c:forEach>
                </c:if>

                <c:if test="${not empty listStudent}">
                    <c:forEach var="student" items="${listStudent}">
                        <div class="row border-bottom py-3 mt ${student.isDeleted ? 'strikethrough' : ''}">
                            <div class="col-1">${index}</div>
                            <div class="col-3">${fn:escapeXml(student.getEmail())}</div>
                            <div class="col-2">${fn:escapeXml(student.getName())}</div>
                            <div class="col-2">${fn:escapeXml(student.getUsername())}</div>
                            <div class="col-1">Student</div>
                            <div class="col-3">
                                <div class="btn-group">
                                    <a href="manageacc?action=restore&username=${student.getUsername()}"
                                       class="btn btn-info text-white text-decoration-none">Restore</a>
                                    <a href="#" onclick="confirmDelete('${student.getUsername()}')"
                                       class="bg-danger text-white border px-3 py-2 text-decoration-none">Delete</a>
                                </div>
                            </div>
                        </div>
                        <c:set var="index" value="${index + 1}" />
                    </c:forEach>
                </c:if>

                <c:if test="${not empty listInstructor}">
                    <c:forEach var="instructor" items="${listInstructor}">
                        <div class="row border-bottom py-3 mt ${instructor.isDeleted ? 'strikethrough' : ''}">
                            <div class="col-1">${index}</div>
                            <div class="col-3">${fn:escapeXml(instructor.getEmail())}</div>
                            <div class="col-2">${fn:escapeXml(instructor.getName())}</div>
                            <div class="col-2">${fn:escapeXml(instructor.getUsername())}</div>
                            <div class="col-1">Instructor</div>
                            <div class="col-3">
                                <div class="btn-group">
                                    <a href="manageacc?action=restore&username=${instructor.getUsername()}"
                                       class="btn btn-info text-white text-decoration-none">Restore</a>
                                    <a href="#" onclick="confirmDelete('${instructor.getUsername()}')"
                                       class="bg-danger text-white border px-3 py-2 text-decoration-none">Delete</a>
                                </div>
                            </div>
                        </div>
                        <c:set var="index" value="${index + 1}" />
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <script>
            function confirmDelete(username) {
                var result = confirm("Are you sure you want to delete this account?");
                if (result) {
                    window.location.href = 'manageacc?action=delete&username=' + username;
                }
            }
        </script>  
    </body>
</html>
