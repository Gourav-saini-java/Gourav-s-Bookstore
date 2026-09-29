<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Controller.RegistrationTest"%>
<%@page import="Controller.LoginTest"%>
<%@page import="Model.Registration"%>
<%@page import="Model.Login"%>

<jsp:useBean id="log" class="Model.Login"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SaveLogin</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body class="bg-light">

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");

            int i = 0;

            if (username != null && password != null
                    && !username.trim().equals("") && !password.trim().equals("")) {

                // Authenticate from REGISTRATION table
                Registration user = RegistrationTest.authenticate(username, password);

                if (user != null) {

                    // Create session
                    session.setAttribute("loggedUser", user);
                    session.setAttribute("username", user.getUsername());

                    // insert into LOGIN table
                    log.setUsername(username);
                    log.setPassword(password);
                    i = LoginTest.insert(log);

                    if (remember != null) {
                        Cookie cookie = new Cookie("username", username);
                        cookie.setMaxAge(60 * 60 * 24); // 1 day
                        response.addCookie(cookie);
                    } else {
                        Cookie cookie = new Cookie("username", "");
                        cookie.setMaxAge(0); // delete cookie
                        response.addCookie(cookie);
                    }

                    // Redirect on success
                    if (i > 0) {
                        response.sendRedirect("index.jsp");
                        return;
                    }
                }
            }
        %>

        <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
            <div class="card shadow p-4" style="max-width: 500px; width: 100%; border-radius: 15px;">

                <!---FAILURE--->
                <div class="alert alert-danger text-center">
                    <h4 class="alert-heading">Login Failed!</h4>
                    <p>Account doesn’t exist. Please register first.</p>
                </div>

                <div class="text-center">
                    <a href="login.jsp" class="btn btn-secondary px-4">Go Back to Login</a>
                    <a href="register.jsp" class="btn btn-primary px-4 ms-2">Register</a>
                </div>

            </div>
        </div>

    </body>
</html>
