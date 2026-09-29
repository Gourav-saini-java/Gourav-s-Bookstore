<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Books"%>
<%@page import="Controller.BooksTest"%>

<%
    String admin = (String) session.getAttribute("admin");

    int id = Integer.parseInt(request.getParameter("id"));
    Books book = BooksTest.edit(id);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Books</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: #faf6f4;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            footer {
                background: #cdb4db;
                color: #2d2d2d;
                margin-top: auto;
            }
        </style>
    </head>

    <body class="d-flex flex-column min-vh-100">

        <!-- Navbar -->
        <jsp:include page="adminNavbar.jsp"/>

        <!-- MAIN CONTENT -->
        <main class="flex-fill">
            <div class="container mt-5 mb-5">
                <div class="card shadow">

                    <div class="card-header bg-primary text-white text-center">
                        <h4 class="mb-0">Edit Book Details</h4>
                    </div>

                    <div class="card-body">
                        <form action="updatebook" method="post" class="row g-3">

                            <input type="hidden" name="id" value="<%= book.getId()%>">

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Title</label>
                                <input type="text" name="title" class="form-control"
                                       value="<%= book.getTitle()%>" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Author</label>
                                <input type="text" name="author" class="form-control"
                                       value="<%= book.getAuthor()%>" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Genre</label>
                                <input type="text" name="genre" class="form-control"
                                       value="<%= book.getGenre()%>" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Description</label>
                                <input type="text" name="description" class="form-control"
                                       value="<%= book.getDescription()%>" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Price</label>
                                <input type="number" name="price" class="form-control"
                                          value="<%= book.getPrice()%>" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Image</label>
                                <input type="text" name="image" class="form-control"
                                       value="<%= book.getImage()%>" required>
                            </div>

                            <div class="col-12 text-center mt-4">
                                <button type="submit" class="btn btn-success px-4">
                                    <i class="fa fa-save"></i> Update
                                </button>

                                <a href="manageBooks" class="btn btn-secondary px-4 ms-2">
                                    Cancel
                                </a>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </main>

        <!-- FOOTER -->
        <div class="mb-5"></div>
        <jsp:include page="footer.jsp"/>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
