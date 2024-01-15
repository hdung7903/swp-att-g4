<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark" aria-label="Fourth navbar example">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarsExample04">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Schedule</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Attendance</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Attendance Report</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">                    
                        <li class="nav-link px-2 text-secondary">
                            <a class="nav-link">Hi,${sessionScope.acc.username}</a>
                        </li>                                      
                        <li class="nav-link px-2 text-secondary">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#logoutModal">
                                Log out
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
            <%@include file="../modal/logoutModal.jsp" %>
        </nav>      
    </body>
</html>
