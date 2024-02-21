<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .container-fluid{
                margin: 0!important;
                padding: 0!important;
            }
            .navbar-brand {
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                margin-right: 10px;
                color: orange;
            }
            .image-container img {
                width: 100%;
                border-radius: 8px;
                display: block;
                height: 650px;
            }

            .image-text {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-size: 24px;
            }
            .navbar-brand:hover {
                background-color: white;
                color: orange;
            }
            a.text-reset {
                text-decoration: none;
            }
        </style>
    </head>


    <body>

        <header class="text-center text-lg-start bg-primary text-white">
            <div class="container">
                <section class="d-flex justify-content-center justify-content-lg-between p-3 border-bottom">
                    <div class="me-5 d-none d-lg-block">
                        <span class="mx-3"><i class="fa fa-phone mx-2"></i> 0945712105</span>
                        <span><i class="fa fa-calendar mx-1"></i> Mon-Fri: 07:30-17:40</span>
                        <span><i class="fa fa-envelope mx-2"></i> <a href="mailto:#" class="text-white">thainhhe172393@fpt.edu.vn</a></span>
                    </div>
                    <div>
                        <a href="https://www.facebook.com/DaihocFPTHaNoi" class="me-4 text-reset" target="_blank">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fa fa-twitter"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fa fa-google"></i>
                        </a>
                        <a href="" class="me-4 text-reset">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </div>
                </section>
            </div>
        </header>
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
                <div class="container">
                    <a class="navbar-brand fw-bold text-orange" >FPT UNIVERSITY</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                        <ul class="navbar-nav">                    
                            <li class="nav-item">
                                <a class="btn btn-primary" href="login-page"><i class="bi bi-box-arrow-in-left"></i> Log in</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <main class="container-fluid">
            <div class="text-center">
                <div class="image-container">
                    <img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t39.30808-6/414981424_753677770123822_6814149231170888051_n.png?stp=dst-png_p600x600&_nc_cat=108&ccb=1-7&_nc_sid=783fdb&_nc_ohc=1tyfIfM_zqcAX8bMxvu&_nc_ht=scontent.fhan14-2.fna&oh=00_AfBTww5LpdAo-r91OokWE4-eAp3uUMV5jEi-wrcW9M5Ftw&oe=65B60A65" alt="Your Image">
                </div>

            </div>
        </main>
    </body>
</html>