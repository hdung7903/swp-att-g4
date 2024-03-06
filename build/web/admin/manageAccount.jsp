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
        <title>List Account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            .label_option {
                min-width: 130px;
            }

            .container-fluid {
                margin: 0!important;
                padding: 0!important;
            }
        </style>
    </head>

    <body>
        <%@include file="./navbar.jsp" %>
        <div class="">
            <c:if test="${mess!=null}">
                <div class="fs-4 alert ${result==true?"alert-success":"alert-danger"}" role="alert">
                    ${mess}
                </div>
            </c:if>
        </div>
        <div class="container mt-5">
            <div class="d-flex align-items-center justify-content-between">
                <h3>List Account</h3>
                <div class="d-flex">
                    <a class="btn btn-success mx-2 rounded text-decoration-none py-2 text-white" href="createacc?action=add"><i class="fas fa-plus"></i> Add</a>
                    <a class="btn btn-success mx-2 rounded text-decoration-none py-2 text-white bg-danger" href=""><i class="fas fa-file-import"></i> Import</a>
                    <a href="manageacc?action=exprortExcel" class="btn btn-success mx-2 rounded text-decoration-none py-2 text-white bg-warning" href="">Export <i class='bx bx-export'></i></a>
                </div>
                <div>
                    <a class="btn btn-success d-block rounded text-decoration-none py-2 text-black bg-white border" href="manageacc?action=deletedList">
                        <span>Inactive List</span>
                        <i class='bx bx-trash ms-3'></i>
                    </a>
                </div>
            </div>
            <div class="mt-3 d-flex align-items-center justify-content-between">
                <form action="manageacc" method="GET">
                    <div class="d-flex align-items-center">
                        <input name="action" method="search" value="search" hidden/>
                        <input name="deleted" value="false" hidden/>
                        <input class="form-control" placeholder="Search" name="q" value="${searchTxt}"/>
                        <div class="mx-2">
                            <select class="form-select" name="role" style="min-width: 150px;">
                                <option value="0" ${role=='0'?'selected':''}>All</option>
                                <option value="1" ${role=='1'?'selected':''}>Staff</option>
                                <option value="2" ${role=='2'?'selected':''}>Admin</option>
                                <option value="3" ${role=='3'?'selected':''}>Instructor</option>
                                <option value="4" ${role=='4'?'selected':''}>Student</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary mx-2">Search</button>
                        <a href="manageacc" class="btn btn-danger text-white px-4 py-1 text-decoration-none rounded">Reset</a>
                    </div>
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
                <c:set var="index" value="1"/>
                <c:if test="${not empty listManage}">
                    <c:forEach var="acc" items="${listManage}">
                        <div class="row border-bottom py-3 mt">
                            <div class="col-1">${index}</div>
                            <div class="col-3"></div>
                            <div class="col-2"></div>
                            <div class="col-2">${acc.getUsername()}</div>
                            <div class="col-1">${acc.getRole_id()==1?'Academic Staff':'Admin'}</div>
                            <div class="col-3">
                                <div class="d-flex">
                                    <a href="" class="btn btn-info text-white border px-3 py-2 text-decoration-none mx-2">Update</a>
                                    <a href="manageacc?action=deletedRule&username=${acc.getUsername()}" class="btn btn-danger text-white border px-3 py-2 text-decoration-none">Delete</a>
                                </div>
                            </div>
                        </div>
                        <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                </c:if>

                <c:if test="${not empty listStudent}">
                    <c:forEach var="student" items="${listStudent}">
                        <div class="row border-bottom py-3 mt">
                            <div class="col-1">${index}</div>
                            <div class="col-3">${student.getEmail()}</div>
                            <div class="col-2">${student.getName()}</div>
                            <div class="col-2">${student.getUsername()}</div>
                            <div class="col-1">Student</div>
                            <div class="col-3">
                                <div class="d-flex">
                                    <a href="" class="btn btn-info text-white border px-3 py-2 text-decoration-none mx-2">Update</a>
                                    <a href="manageacc?action=deletedRule&username=${student.getUsername()}" class="btn btn-danger text-white border px-3 py-2 text-decoration-none">Delete</a>
                                </div>
                            </div>
                        </div>
                        <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                </c:if>

                <c:if test="${not empty listInstructor}">
                    <c:forEach var="instructor" items="${listInstructor}">
                        <div class="row border-bottom py-3 mt">
                            <div class="col-1">${index}</div>
                            <div class="col-3">${instructor.getEmail()}</div>
                            <div class="col-2">${instructor.getName()}</div>
                            <div class="col-2">${instructor.getUsername()}</div>
                            <div class="col-1">Instructor</div>
                            <div class="col-3">
                                <div class="d-flex">
                                    <a href="" class="btn btn-info text-white border px-3 py-2 text-decoration-none mx-2">Update</a>
                                    <a href="manageacc?action=deletedRule&username=${instructor.getUsername()}" class="btn btn-danger text-white border px-3 py-2 text-decoration-none">Delete</a>
                                </div>
                            </div>
                        </div>
                        <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                </c:if>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
