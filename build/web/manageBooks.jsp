<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Controller.BooksTest" %>
<%@ page import="Model.Books" %>
<%@ page import="java.util.List" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin.jsp");
        return;
    }
%>
<%
    BooksTest book = new BooksTest();
    String search = request.getParameter("search");
    List<Books> books;

    if (search != null && !search.trim().isEmpty()) {
        books = book.searchBooks(search);
    } else {
        books = book.getAllBooks();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Books</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome (optional, for icons) -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

        <style>

            @media print {
                body * {
                    visibility: hidden;
                }
                #printArea, #printArea * {
                    visibility: visible;
                }
                #printArea {
                    position: absolute;
                    left: 0;
                    top: 0;
                    width: 100%;
                }
                .no-print {
                    display: none !important;
                }
            }
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

        <main class="flex-fill">

            <div class="container mt-5 mb-4">
                <div class="card shadow mb-4" id="printArea">
                    <div class="card-header bg-primary text-white text-center">
                        <h4 class="mb-0">Manage Books</h4>
                    </div>

                    <div class="card-body no-print">
                        <form method="get" action="">
                            <div class="row justify-content-center mb-3">
                                <div class="col-md-6">
                                    <input type="text" name="search" class="form-control" 
                                           placeholder="Search by title, author, or genre"
                                           value="<%= request.getParameter("search") != null ? request.getParameter("search") : ""%>">
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary w-100">
                                        <i class="fa fa-search"></i> Search
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="card-body">
                        <table class="table table-bordered table-striped table-hover text-center align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Author</th>
                                    <th>Genre</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Image</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    for (Books b : books) {
                                %>
                                <tr>
                                    <td><%= b.getId()%></td>
                                    <td><%= b.getTitle()%></td>
                                    <td><%= b.getAuthor()%></td>
                                    <td><%= b.getGenre()%></td>
                                    <td><%= b.getDescription()%></td>
                                    <td><%= b.getPrice()%></td>
                                    <td><img src="images/<%= b.getImage()%>" width="60" height="80" style="object-fit:cover;"></td>
                                    <td><a class="btn btn-warning btn-sm" href="updateformbook?id=<%= b.getId()%>">Edit</a></td>
                                    <td><a class="btn btn-danger btn-sm"  href="deletebook?id=<%= b.getId()%>" onclick="return confirm('Delete this Book?');">Delete</a></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="d-flex justify-content-center gap-3 mt-3 no-print">
                    <a href="admin.jsp" class="btn btn-secondary">
                        <i class="fa fa-arrow-left"></i> Back to Admin
                    </a>

                    <button onclick="window.print()" class="btn btn-success">
                        <i class="fa fa-print"></i> Print
                    </button>
                </div>
        </main>
    </body>
    <!-- Footer -->
    <div class="mb-5"></div>
    <jsp:include page="footer.jsp"/>
    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</html>
