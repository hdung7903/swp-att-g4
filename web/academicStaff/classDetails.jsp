    <%-- 
    Document   : listClass
    Created on : Mar 4, 2024, 10:57:28 AM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Class list</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
            }
            .container {
                padding: 20px;
            }
            .card {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                padding: 20px;
                margin-bottom: 20px;
            }
            .card-title {
                color: #007bff;
                font-size: 24px;
                margin-bottom: 20px;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
                transition: background-color 0.3s;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .table {
                background-color: #fff;
                box-shadow: 0 0 5px rgba(0,0,0,0.05);
            }
            .table thead th {
                font-size: 14px;
                background-color: #f8f9fa;
                border-bottom: none;
            }
            .table tbody td {
                font-size: 14px;
            }
            .table tbody tr:hover {
                background-color: #f0f0f0;
            }
        </style>
        <script>
            function submitForm() {
                document.getElementById("classForm").submit();
            }

            function submitSearch() {
                document.getElementById("searchForm").submit();
            }

            document.getElementById("searchInput").addEventListener("keyup", function (event) {
                if (event.key === "Enter") {
                    submitSearch();
                }
            });
        </script>
    </head>
    <body>
        <%@include file="./navbar.jsp" %>
        <div class="card">
            <h2 class="card-title">Class List</h2>
            <c:set value="${requestScope.class_id}"  var="class_id"/>
            <button><a  class="nav-link" href="addStudent?id=${class_id}"><i class="bi bi-calendar2-event"></i>Create Class</a></button>
            <div class="table-responsive">
                <form id="" action="" method="POST">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr class="text-center">
                                <th>Class Name</th>
                                <th>Subject</th>
                                <th>Instructor</th>
                                <th>Slots</th>
                                <th>Do something you want bro ❤️</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listGSM}" var="listGSM" varStatus="loop">
                                <tr class="text-center">
                                    <td>${listGSM.group.class_name}</td>
                                    <td>${listGSM.subject.name}</td>
                                    <td>${empty listGSM.instructor.name ? 'Unknown' : listGSM.instructor.name}</td>
                                    <td>${listGSM.total_slots}</td>
                                    <td>
<!--                                        <a class="me-3" href="#" onclick="event.preventDefault(); document.getElementById('classDetails').submit();">UPDATE</a>-->
                                        <a class="me-3" href="updateclass?csm_id=${listGSM.id}&subject_id=${listGSM.subject.id}" >UPDATE</a>
                                        <a class="ms-3" href="#" onclick="doDelete('${listGSM.id}', '${listGSM.group.id}', '${listGSM.group.class_name}', '${listGSM.subject.name}')">DELETE</a>
                                    </td>
                                </tr>
                            <script type="text/javascript">
                                function doDelete(csm_id, class_id, class_name, subject_name) {
                                    if (confirm("Are you sure you want to delete class " + class_name + "-" + subject_name + "?")) {
                                        window.location = "deleteclass?csm_id=" + csm_id + "&class_id=" + class_id;
                                    }
                                }
                            </script>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
            <a href="listclass">BACK TO HOME</a>
        </div>
    </body>




</html>
