<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.RegistrationTest"%>
<%@page import="Controller.LoginTest"%>
<%@page import="Model.Registration"%>
<%@page import="Model.Login"%>

<jsp:useBean id="reg" class="Model.Registration"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Registration</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="bg-light">
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String number = request.getParameter("number");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            int i = 0;

            reg.setName(name);
            reg.setEmail(email);
            reg.setNumber(number);
            reg.setGender(gender);
            reg.setDob(dob);
            reg.setUsername(username);
            reg.setPassword(password);
            i = RegistrationTest.insert(reg);

            if (i > 0) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
       <div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="card shadow p-4" style="max-width: 500px; width: 100%; border-radius: 15px;">

        <div class="alert alert-danger text-center">
            <h4 class="alert-heading">Register Failed!</h4>
            <p>Your data is Not Registered in your database.</p>
        </div>

        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary px-4">Go Back to Home</a>
            <a href="register.jsp" class="btn btn-primary px-4 ms-2">Try Again!</a>
        </div>

    </div>
</div>
    </body>
</html>
