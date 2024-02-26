
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .carousel-inner .carousel-item{
                width: 100%;
                height: 100vh;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
            }
            .carousel-inner .carousel-item::before{
                content: '';
                background-color: rgba(12, 11, 10, 0.5);
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
            }
            .carousel-inner .carousel-caption{
                display: flex;
                justify-content: center;
                align-items: center;
                position: absolute;
                bottom: 0;
                top: 40%;
                left: 0;
                right: 0;
            }
            .carousel-inner .carousel-caption h5{
                color: #fff;
                margin-bottom: 5px;
                font-size: 42px;
                width: 80%;
                margin: 0px auto 30px auto;
            }

            .container-fluid{
                margin: 0!important;
                padding: 0!important;
            }
            .carousel-inner .carousel-caption p{
                font-size: 20px;
                width: 80%;
                margin: 0px auto 20px auto;
            }
            a.text-reset {
                text-decoration: none;
            }
            body {
                max-width: 100%;
                overflow-x: hidden;
            }
        </style>
    </head>
    <body>
        <header class="text-center text-lg-start bg-primary text-white">
            <div class="container">
                <!-- Section: Social media -->
                <section class="d-flex justify-content-center justify-content-lg-between p-3">

                    <!-- Left -->
                    <div class="me-5 d-none d-lg-block">
                        <span class="mx-3"><i class="fa fa-phone mx-2"></i> 0945712105</span>
                        <span><i class="fa fa-calendar mx-1"></i> Mon-Fri: 07:30-17:40</span>
                    </div>
                    <!-- Left -->

                    <!-- Right -->
                    <div>
                        <a href="https://www.facebook.com/DaihocFPTHaNoi" class="me-4 text-reset" target="_blank">
                            <i class="bi bi-facebook"></i> Fanpage
                        </a>
                        <a href="mailto:dichvusinhvien@fe.edu.vn" class="me-4 text-reset" target="_blank">
                            <i class="bi bi-google"></i> dichvusinhvien@fe.edu.vn
                        </a>
                    </div>
                </section>
            </div>
        </header>
        <div class="container-fluid ">
            <%@include file="./navbar.jsp" %>
        </div>
        <div id="carouselExampleCaptions" class="carousel slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://scontent.fhan14-3.fna.fbcdn.net/v/t1.15752-9/395552079_6819782658115889_3201581416699991953_n.png?_nc_cat=110&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=2owmGNDd5AwAX-6vaQ_&_nc_ht=scontent.fhan14-3.fna&oh=03_AdRyq8cFxnPJO0uM-5J2ELqiGCgwqWNwTXEcMT3ZUaL_uA&oe=65D32D6B" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-block">
                        <h5>THÔNG BÁO</h5>
                        <p>Lịch nghỉ Tết Nguyên Đán năm 2024: Từ ngày 02/02 - 18/02/2024 </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://scontent.fhan14-3.fna.fbcdn.net/v/t1.15752-9/395552079_6819782658115889_3201581416699991953_n.png?_nc_cat=110&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=2owmGNDd5AwAX-6vaQ_&_nc_ht=scontent.fhan14-3.fna&oh=03_AdRyq8cFxnPJO0uM-5J2ELqiGCgwqWNwTXEcMT3ZUaL_uA&oe=65D32D6B" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-block">
                        <h5>Second slide label</h5>
                        <p>Some representative placeholder content for the second slide.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://scontent.fhan14-3.fna.fbcdn.net/v/t1.15752-9/395552079_6819782658115889_3201581416699991953_n.png?_nc_cat=110&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=2owmGNDd5AwAX-6vaQ_&_nc_ht=scontent.fhan14-3.fna&oh=03_AdRyq8cFxnPJO0uM-5J2ELqiGCgwqWNwTXEcMT3ZUaL_uA&oe=65D32D6B" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-block">
                        <h5>Third slide label</h5>
                        <p>Some representative placeholder content for the third slide.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title text-center text-orange">Academic Information</h3>
                            <div class="listBoxWrapper">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <td colspan="2">
                                                                <span></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                                <h4>Information Access (Tra cứu thông tin)</h4>
                                                                <ul>
                                                                    <li><a href="#">Weekly timetable</a> (Thời khóa biểu từng tuần)</li>
                                                                    <li><a href="#">Take attendance</a> (Thực hiện điểm danh)</li>
                                                                    <li><a href="#">View Schedule</a> (Xem thông tin điểm danh)</li>
                                                                    <li><a href="#">Edit Schedule</a> (Sửa thông tin điểm danh)</li>
                                                                    <li><a href="#">Attendance Statistic</a> (Thống kê điểm danh)</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
