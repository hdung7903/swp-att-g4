<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Create News</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <a href="${pageContext.request.contextPath}/acad/listNews" class="text-black"><i class="fas fa-arrow-left"></i> Go back</a>
            <h2>Create News</h2>
            <form action="createNews" method="post">
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">Content</label>
                    <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Create</button>
            </form>
        </div>
    </body>
</html>