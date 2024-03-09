<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <style>
            .carousel-item {
                background-color: #f8f9fa;
                padding: 2rem;
            }
            .carousel-img {
                width: 100%;
                border-radius: 0.5rem;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .carousel-content {
                padding-left: 1rem;
            }
            .carousel-caption {
                bottom: 0;
                background: none;
            }
            .carousel-control-prev-icon,
            .carousel-control-next-icon {
                color: black;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <img src="https://cdn.discordapp.com/attachments/1207588646270541874/1211577496445648926/thumb.png?ex=65f7eef9&is=65e579f9&hm=4de56d21832247548b6925197d3b5befef6f74cf707f7bf24a0df815d921b610&" alt="Image 1" class="carousel-img">
                            </div>
                            <div class="col-md-6">
                                <div class="carousel-content">
                                    <h3>THÔNG BÁO</h3>
                                    <p>Lịch nghỉ Tết Nguyên Đán năm 2024: Từ ngày 02/02 - 18/02/2024</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <img src="https://cdn.discordapp.com/attachments/1207588646270541874/1211577496445648926/thumb.png?ex=65f7eef9&is=65e579f9&hm=4de56d21832247548b6925197d3b5befef6f74cf707f7bf24a0df815d921b610&" alt="Image 2" class="carousel-img">
                                </div>
                                <div class="col-md-6">
                                    <div class="carousel-content">
                                        <h3>Lịch thi Final Exam kỳ 1 năm 2024</h3>
                                        <p>Item 2 Content</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                                   
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </body>
</html>