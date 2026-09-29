<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Upload Book</title>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    </head>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #faf6f4;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background: linear-gradient(90deg, #e6b7c6, #c98b9b);
        }

        .navbar-brand {
            color: #4a2c2a !important;
            font-weight: 600;
        }

        .nav-link {
            color: #4a2c2a !important;
            font-weight: 500;
            position: relative;
        }

        .nav-link::after {
            content: "";
            position: absolute;
            width: 0;
            height: 2px;
            background: #9b5f6f;
            left: 0;
            bottom: -4px;
            transition: width 0.3s ease;
        }

        .nav-link:hover::after {
            width: 100%;
        }

        .nav-link:hover {
            color: #7a3e4b !important;
        }

        .admin-card {
            background: #fff;
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 12px 28px rgba(0,0,0,0.12);
        }

        .admin-btn {
            background: #5aaee0;
            color: #fff;
            border-radius: 15px;
            padding: 20px;
            font-size: 16px;
        }

        .admin-btn:hover {
            background: #3d9bd3;
            color: #fff;
        }

        footer {
            background: #cdb4db;
            color: #2d2d2d;
            margin-top: auto;
        }
    </style>
    <body class="bg-light">

        <!-- Navbar -->
        <jsp:include page="adminNavbar.jsp"/>
        <main class="flex-fill">
            <div class="container mt-5 mb-4">
                <div class="card shadow mb-4">
                    <div class="card-header bg-primary text-white text-center">
                        <h4 class="mb-0">Upload New Book</h4>
                    </div>

                    <div class="card-body">
                        <form action="savebook" method="post">

                            <!-- Book Name -->
                            <div class="mb-3">
                                <label class="form-label">Book Name</label>
                                <input type="text" name="bookName" class="form-control" required>
                            </div>

                            <!-- Author Name -->
                            <div class="mb-3">
                                <label class="form-label">Author Name</label>
                                <input type="text" name="authorName" class="form-control" required>
                            </div>

                            <!-- Genre -->
                            <div class="mb-3">
                                <label class="form-label">Genre</label>
                                <input type="text" name="genre" class="form-control" placeholder="e.g. Fiction, Programming" required>
                            </div>

                            <!-- Description -->
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <textarea name="description" class="form-control" rows="4" required></textarea>
                            </div>

                            <!-- Price -->
                            <div class="mb-3">
                                <label class="form-label">Price (₹)</label>
                                <input type="number" name="price" class="form-control" min="1" required>
                            </div>

                            <!-- Image -->
                            <div class="mb-3">
                                <label class="form-label">Book Image</label>
                                <input type="file" name="bookImage" class="form-control" accept="image/*" required>
                            </div>

                            <button type="submit" class="btn btn-success w-100">
                                Upload Book
                            </button>

                        </form>
                    </div>
                </div>
            </div>
        </main>
    </body>
    <!-- Footer -->
    <jsp:include page="footer.jsp"/>
</html>
