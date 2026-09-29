<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Register | Gourav's Bookstore</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

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

            /* Navbar (same as your code) */
            .navbar {
                background: linear-gradient(90deg, #e6b7c6, #c98b9b);
            }

            .navbar-brand,
            .nav-link {
                color: #4a2c2a !important;
                font-weight: 500;
            }

            /* Card UI (same style as login image) */
            .auth-card {
                background: #ffffff;
                border-radius: 18px;
                padding: 35px;
                max-width: 520px;
                width: 100%;
                box-shadow: 0 12px 30px rgba(0,0,0,0.12);
            }

            .auth-card h2 {
                font-weight: 600;
                margin-bottom: 25px;
            }

            .form-control {
                border-radius: 10px;
                padding: 10px;
            }

            .btn-auth {
                background: #5aaee0;
                color: #fff;
                border-radius: 25px;
                padding: 10px;
                font-weight: 500;
            }

            .btn-auth:hover {
                background: #3d9bd3;
            }
            
            .input-group-text:hover {
                background-color: #f1f1f1;
            }

            footer {
                background: #cdb4db;
                color: #2d2d2d;
                margin-top: auto;
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
                            <li><a class="dropdown-item active" href="register.jsp">Register</a></li>
                            <li><a class="dropdown-item" href="admin.jsp">Admin</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Register Card -->
        <div class="container d-flex justify-content-center align-items-center my-5">
            <div class="auth-card">
                <h2 class="text-center">Create Account</h2>

                <form action="saveregistration" method="post">

                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email Address</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Number</label>
                        <input type="text" name="number" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label d-block">Gender</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" value="Male" required>
                            <label class="form-check-label">Male</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" value="Female">
                            <label class="form-check-label">Female</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" value="Other">
                            <label class="form-check-label">Other</label>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Date of Birth</label>
                        <input type="date" name="dob" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" required>
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

                    <button type="submit" class="btn btn-auth w-100">
                        Register
                    </button>

                    <p class="text-center mt-3 mb-0">
                        Already have an account?
                        <a href="login.jsp">Login here</a>
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
