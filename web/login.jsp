<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String savedUser = "";

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("username")) {
                savedUser = c.getValue();
            }
        }
    }

    request.setAttribute("savedUser", savedUser);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login | Gourav's Bookstore</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: #faf6f4;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            /* Navbar */
            .navbar {
                background: linear-gradient(90deg, #e6b7c6, #c98b9b);
            }

            .navbar-brand, .nav-link {
                color: #4a2c2a !important;
                font-weight: 500;
            }

            /* Login Card */
            .login-card {
                max-width: 420px;
                background: #fff;
                border-radius: 15px;
                padding: 30px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.12);
            }

            .btn-login {
                background: #4ea8de;
                color: #fff;
                border-radius: 25px;
            }

            .btn-login:hover {
                background: #0077b6;
            }

            footer {
                background: #cdb4db;
                color: #2d2d2d;
                margin-top: auto;
            }

            .input-group-text:hover {
                background-color: #f1f1f1;
            }
        </style>
    </head>

    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg shadow-sm">
            <div class="container">
                <a class="navbar-brand fw-bold" href="index.jsp">📚 Gourav's Bookstore</a>

                <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navMenu">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navMenu">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="books.jsp">Books</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                    </ul>

                    <!-- More Button -->
                    <div class="dropdown">
                        <button class="btn btn-outline-dark dropdown-toggle" data-bs-toggle="dropdown">
                            More
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="login.jsp">Login</a></li>
                            <li><a class="dropdown-item " href="register.jsp">Register</a></li>
                            <li><a class="dropdown-item" href="admin.jsp">Admin</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>


        <!-- Login Form -->
        <div class="container d-flex justify-content-center align-items-center my-5">
            <div class="login-card">
                <h3 class="text-center fw-bold mb-4">Login</h3>

                <form action="savelogin" method="post">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control"
                               value="<%= request.getAttribute("savedUser") != null ? request.getAttribute("savedUser") : ""%>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>

                        <div class="input-group">
                            <input type="password" name="password" id="password" class="form-control" required>

                            <span class="input-group-text" onclick="togglePassword()" style="cursor:pointer;">
                                <i class="fa fa-eye" id="eyeIcon"></i>
                            </span>
                        </div>
                    </div>
                    <%
                        if ("notexist".equals(request.getParameter("error"))) {
                    %>
                    <div class="alert alert-danger text-center">
                        Account doesn’t exist. Please register first.
                    </div>
                    <%
                        }
                    %>

                    <!-- Remember Me -->
                    <div class="mb-3 form-check">
                        <input type="checkbox" name="remember" class="form-check-input">
                        <label class="form-check-label">Remember Me</label>
                    </div>

                    <button type="submit" class="btn btn-login w-100">
                        <i class="fa fa-sign-in-alt"></i> Login
                    </button>

                    <p class="text-center mt-3">
                        Don’t have an account?
                        <a href="register.jsp">Register here</a>
                    </p>
                </form>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="footer.jsp"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                function togglePassword() {
                                    var passwordField = document.getElementById("password");
                                    var eyeIcon = document.getElementById("eyeIcon");

                                    if (passwordField.type === "password") {
                                        passwordField.type = "text";
                                        eyeIcon.classList.remove("fa-eye");
                                        eyeIcon.classList.add("fa-eye-slash");
                                    } else {
                                        passwordField.type = "password";
                                        eyeIcon.classList.remove("fa-eye-slash");
                                        eyeIcon.classList.add("fa-eye");
                                    }
                                }
    </script>
    </body>
</html>
