<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Access Denied</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <style>
            body {
                background-color: #E4E5E7;
                color: #4B506D;
            }
            .card {
                border: none;
                border-radius: 1rem;
                padding: 2rem;
            }
            .error-code {
                color: #4B506D;
                font-weight: 600;
            }
            .error-description {
                color: #6E7191;
            }
            .btn-home {
                background-color: #4B506D;
                color: #fff;
                padding: 0.75rem 1.5rem;
                border-radius: 0.5rem;
                text-decoration: none;
                transition: background-color 0.2s;
            }
            .btn-home:hover {
                background-color: #32354A;
            }
            .fa-shield-alt {
                color: #FFB4A9;
            }
        </style>
    </head>
    <body class="d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow">
            <div class="card-body text-center">
                <i class="fas fa-shield-alt fa-5x mb-4"></i>
                <h1 class="error-code mb-2">401</h1>
                <h2 class="h3 error-description mb-4">Access Denied</h2>
                <p class="error-description mb-4">You do not have the necessary permissions to access this page.</p>
                <a href="<%=request.getContextPath()%>" class="btn-home">Go Home</a>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/your-kit-id.js" crossorigin="anonymous"></script>
    </body>
</html>