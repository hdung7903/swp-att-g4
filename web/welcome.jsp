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
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .navbar-height {
                padding: 1rem 0;
            }
            .navbar-brand {
                font-weight: bold;
                color: #f36d21;
            }
            .image-container img {
                width: 100%;
                object-fit: cover;
                border-radius: 6px;
                max-height: 60vh; /* Control the maximum height of the image */
            }
            .footer-custom {
                background-color: #343a40;
                padding: 2rem;
                color: white;
            }
            .footer-links a {
                color: #dcdcdc;
                transition: color 0.3s;
            }
            .footer-links a:hover {
                color: #ffffff;
                text-decoration: none;
            }
            /* Medium Devices, Desktops */
            @media only screen and (max-width: 768px) {
                .image-container {
                    margin-top: 56px; /* To account for the fixed navbar */
                }
                .footer-custom {
                    text-align: center;
                }
            }
        </style>
    </head>
    <body class="d-flex flex-column h-100 text-bg-white">
        <nav class="navbar navbar-expand-md navbar-dark bg-dark navbar-height fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand mb-0 h1 ms-4">FPT UNIVERSITY</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end me-4" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="btn btn-primary" href="login-page"><i class="bi bi-box-arrow-in-left"></i> Log in</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="flex-grow-1">
            <main class="mt-5">
                <div class="image-container">
                    <img src="https://cdn.discordapp.com/attachments/1207588646270541874/1211569259994550272/414981424_753677770123822_6814149231170888051_n.png?ex=661396cd&is=660121cd&hm=4e9f53065c9db71a1bb2f106ebd28e36ed4f37a93f736dbe8ef30d1923145e09&" alt="FPT University" alt="FPT University">
                </div>
                <div class="container my-4">
                    <h1>Welcome to FPT University</h1>
                    <p class="lead">Your journey to excellence starts here. Explore, learn, and become part of our vibrant academic community.</p>
                </div>
            </main>
        </div>
        <footer class="footer-custom text-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <h5>About</h5>
                        <p>FPT University is dedicated to providing world-class education and an inclusive learning environment for all students.</p>
                    </div>
                    <div class="col-md-4 mb-3">
                        <h5>Contact</h5>
                        <ul class="list-unstyled footer-links">
                            <li><i class="bi bi-telephone-fill"></i> 0945712105</li>
                            <li><i class="bi bi-calendar3"></i> Mon-Fri: 07:30-17:40</li>
                            <li><i class="bi bi-envelope-fill"></i> <a href="mailto:thainhhe172393@fpt.edu.vn" class="text-reset">thainhhe172393@fpt.edu.vn</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 mb-3">
                        <h5>Follow Us</h5>
                        <ul class="list-unstyled footer-links">
                            <li><a href="https://www.facebook.com/DaihocFPTHaNoi" target="_blank"><i class="bi bi-facebook"></i> Facebook</a></li>
                            <li><a href="https://twitter.com/" target="_blank"><i class="bi bi-twitter"></i> Twitter</a></li>
                            <li><a href="https://www.google.com/" target="_blank"><i class="bi bi-google"></i> Google</a></li>
                            <li><a href="https://www.instagram.com/" target="_blank"><i class="bi bi-instagram"></i> Instagram</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>