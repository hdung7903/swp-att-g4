<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            .container-fluid{
                margin: 0!important;
                padding: 0!important;
            }
            .navbar-brand {
                background-color: black;
                padding: 30px;
                border-radius: 5px;
                margin-right: 10px;
                margin-left: 20px;
                color: orange;
            }
            .navbar-toggler{
                outline: none!important;
                padding: none!important;
            }
            .nav-item{
                padding-top: 15px;
                padding-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" " style="color: orange;" href="#">FPT UNIVERSITY</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav m-auto mb-2 mb-md-0">
                        <li class="nav-item mx-3">
                            <a class="nav-link active" aria-current="page" href="#"><i class="bi bi-house"></i> Home</a>
                        </li>
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="#"><i class="bi bi-calendar2-event"></i> Schedule</a>
                        </li>
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="#"><i class="bi bi-card-checklist"></i> Attendance</a>
                        </li>
                        <li class="nav-item mx-3">
                            <a class="nav-link" href="#"><i class="bi bi-clipboard-data"></i> Attendance Report</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">                    
                        <li class="nav-link px-2 text-secondary">
                            <button type="button" class="btn btn-dark">
                                <i class="bi bi-person-circle"></i> ${sessionScope.acc.username}
                            </button>
                        </li>                                      
                        <li class="nav-link px-2 text-secondary">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#logoutModal">
                                <i class="bi bi-box-arrow-right"></i> Log out
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
            <%@include file="../modal/logoutModal.jsp" %>
        </nav>      
    </body>
</html>