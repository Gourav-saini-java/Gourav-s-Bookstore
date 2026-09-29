<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // Simple admin authentication (replace with DB later)
    String adminUser = "gourav";
    String adminPass = "121212";

    String admin = (String) session.getAttribute("admin");

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (adminUser.equals(username) && adminPass.equals(password)) {
            session.setAttribute("admin", "true");
            response.sendRedirect("admin.jsp");
            return;
        } else {
            request.setAttribute("error", "Invalid Admin Credentials");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin Panel | Gourav's Bookstore</title>

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
        <jsp:include page="adminNavbar.jsp"/>

        <!-- ================= ADMIN LOGIN ================= -->
        <% if (admin == null) { %>

        <div class="container d-flex justify-content-center align-items-center my-5">
            <div class="admin-card" style="max-width:420px;width:100%;">
                <h3 class="text-center mb-4">Admin Login</h3>

                <% if (request.getAttribute("error") != null) {%>
                <div class="alert alert-danger text-center">
                    <%= request.getAttribute("error")%>
                </div>
                <% } %>

                <form method="post">
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

                    <button class="btn admin-btn w-100">
                        <i class="fa fa-lock"></i> Login
                    </button>
                </form>
            </div>
        </div>

        <!-- ================= ADMIN DASHBOARD ================= -->
        <% } else { %>

        <div class="container my-5">
            <h3 class="text-center mb-4">Admin Dashboard</h3>

            <div class="row g-4">
                <div class="col-md-3">
                    <a href="uploadBook" class="btn admin-btn w-100">
                        <i class="fa fa-upload fa-2x mb-2"></i><br>
                        Upload Book
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="manageBooks" class="btn admin-btn w-100">
                        <i class="fa fa-book-open fa-2x mb-2"></i><br>
                        Manage Books
                    </a>
                </div>


                <div class="col-md-3">
                    <a href="orderHistory" class="btn admin-btn w-100">
                        <i class="fa fa-shopping-cart fa-2x mb-2"></i><br>
                        Book Purchase History
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="salesReport" class="btn admin-btn w-100">
                        <i class="fa fa-chart-line fa-2x mb-2"></i><br>
                        Reports
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="loginHistory" class="btn admin-btn w-100">
                        <i class="fa fa-clock fa-2x mb-2"></i><br>
                        Login History
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="allUsers" class="btn admin-btn w-100">
                        <i class="fa fa-users fa-2x mb-2"></i><br>
                        Registered Users
                    </a>
                </div>

            </div>
        </div>

        <% }%>

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

