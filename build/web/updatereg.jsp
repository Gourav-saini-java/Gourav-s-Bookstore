<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.RegistrationTest"%>

<jsp:useBean id="reg" class="Model.Registration" scope="request"/>
<jsp:setProperty name="reg" property="*"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Successful</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                background: #f5f5f5;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: 'Poppins', sans-serif;
            }

            .success-card {
                max-width: 500px;
                width: 100%;
                border-radius: 15px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            }

            .success-box {
                background: #dff1e7;
                border: 1px solid #9fd5b9;
                border-radius: 10px;
                padding: 25px;
                text-align: center;
            }

            .success-title {
                font-size: 24px;
                font-weight: 600;
                color: #0f5132;
            }

            .success-text {
                color: #2d6a4f;
                margin-top: 10px;
            }
        </style>
    </head>

    <body>

        <%
            int i = RegistrationTest.update(reg);
            if (i == 1) {
        %>

        <div class="card success-card p-4">
            <div class="success-box">
                <div class="success-title">Data Updated Successful!</div>
                <p class="success-text">Your data is updated in your database</p>
            </div>

            <div class="text-center mt-4">
                <a href="allUsers" class="btn btn-primary px-4">
                    Return to Table
                </a>
            </div>
        </div>

        <%
            }
        %>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
