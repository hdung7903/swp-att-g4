<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %> 
            <div class="container my-5">
                <h1 class="text-center mb-4">Timetable</h1>
                <div class="form-floating">
                    <form class="form-inline justify-content-center mb-3 row">
                        <div class="col-6">
                            <label for="from" class="mr-2">From</label>
                            <input type="date" id="from" name="from" value="" class="form-control mr-3"/>
                        </div>
                        <div class="col-6">
                            <label for="to" class="mr-2">To</label>
                            <input type="date" id="to" name="to" value="" class="form-control mr-3"/>
                        </div>
                        <div class="my-2">
                            <label for="semester" class="mr-2">Semester</label>
                            <select name="semester">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                        </div>
                        <input type="hidden" value="" name="id" readonly />
                        <button type="submit" class="btn btn-primary">View</button>
                    </form>
                </div>
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover">
                            <thead class="thead-light">
                            <th></th>
                            <th>01-01-2023</th>
                            <th>02-01-2023</th>
                            <th>03-01-2023</th>
                            <th>04-01-2023</th>
                            <th>05-01-2023</th>
                            <th>06-01-2023</th>
                            <th>07-01-2023</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="align-middle">8:00 AM - 9:00 AM</td>
                                    <td>Event 1</td>
                                    <td>Event 2</td>
                                    <td>Event 3</td>
                                    <td>Event 4</td>
                                    <td>Event 5</td>
                                    <td>Event 6</td>
                                    <td>Event 7</td>
                                </tr>
                                <tr>
                                    <td class="align-middle">9:00 AM - 10:00 AM</td>
                                    <td>Event 8</td>
                                    <td>Event 9</td>
                                    <td>Event 10</td>
                                    <td>Event 11</td>
                                    <td>Event 12</td>
                                    <td>Event 13</td>
                                    <td>Event 14</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
