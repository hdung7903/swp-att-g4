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
        <title>Insert Subject</title>
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
    </head>
    <body>
        <%@include file="./navbar.jsp" %>
        <div class="card">
            <h2 class="card-title">Class List</h2>
            <c:set value="${requestScope.class_id}"  var="class_id"/>
            <button><a  class="nav-link" href=""><i class="bi bi-calendar2-event"></i>Assigned Subject</a></button>
            <button><a  class="nav-link" href=""><i class="bi bi-calendar2-event"></i>Remove Subject</a></button>
            <div class="table-responsive">
                <form id="" action="subject" method="POST">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr class="text-center">
                                <th>Subject ID</th>
                                <th>Subject Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listSub}" var="listSub" varStatus="loop">
                                <tr class="text-center">
                                    <td>${listSub.id}</td>
                                    <td>${listSub.name}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <p style="color: red; font-size: 18px" >${requestScope.mess}</p>
                    <label for="id">Subject ID</label>
                    <input type="text" name="id" required>
                    <br>
                    <label for="name">Subject Name</label>
                    <input type="text" name="name" required>
                    <br>
                    <input type="submit" name="submit" id="submit" class="form-submit" value="Insert"/>
                </form>
            </div>
        </div>
    </body>




</html>
