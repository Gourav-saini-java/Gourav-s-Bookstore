<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Login"%>
<%@page import="Controller.LoginTest"%>

<%
    String admin = (String) session.getAttribute("admin");

    int id = Integer.parseInt(request.getParameter("id"));
    Login log = LoginTest.edit(id);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Login</title>

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
                        <h4 class="mb-0">Edit Login Details</h4>
                    </div>

                    <div class="card-body">
                        <form action="updatelog" method="post" class="row g-3">

                            <input type="hidden" name="id" value="<%= log.getId()%>">

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Username</label>
                                <input type="text" name="username" class="form-control"
                                       value="<%= log.getUsername()%>" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Password</label>
                                <input type="password" name="password" class="form-control"
                                       value="<%= log.getPassword()%>" required>
                            </div>

                            <div class="col-12 text-center mt-4">
                                <button type="submit" class="btn btn-success px-4">
                                    <i class="fa fa-save"></i> Update
                                </button>

                                <a href="loginHistory" class="btn btn-secondary px-4 ms-2">
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
