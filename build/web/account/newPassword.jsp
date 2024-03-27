<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Reset Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #f7f7f7;
            padding-top: 5%;
        }
        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #fff;
            border-bottom: none;
            color: #333;
            font-weight: 700;
        }
        .card-body {
            padding: 2rem;
        }
        .form-control {
            border-radius: 0.5rem;
            height: calc(3.25rem + 2px);
        }
        .btn-info {
            border-radius: 0.5rem;
            padding: 0.75rem 1.25rem;
            font-weight: 600;
        }
        .icon {
            color: #17a2b8;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center py-4">
                        <i class="fa-solid fa-key fa-2x icon"></i>
                        <h2>Reset Password</h2>
                    </div>
                    <div class="card-body">
                        <form class="form-horizontal" action="newPassword" method="POST">
                            <div class="mb-3">
                                <input type="password" name="password" placeholder="New Password" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <input type="password" name="confPassword" placeholder="Confirm New Password" class="form-control" required>
                            </div>
                            <div class="d-grid">
                                <input type="submit" value="Reset" class="btn btn-info">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>