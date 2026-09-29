<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>About Us | Gourav's Bookstore</title>

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
            }

            .banner {
                width: 100%;
                height: 260px;
                background:
                    linear-gradient(
                    rgba(201, 139, 155, 0.55),
                    rgba(155, 95, 111, 0.55)
                    ),
                    url("images/banner.jpg") center/cover no-repeat;
                border-radius: 0 0 30px 30px;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                color: #fff;
                margin-bottom: 40px;
            }

            .banner h1 {
                font-size: 40px;
                font-weight: 700;
            }

            /* About Section */
            .about-card {
                background: #ffffff;
                border-radius: 20px;
                padding: 35px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            }

            .about-card h3 {
                color: #3a0ca3;
                font-weight: 600;
            }

            .about-card p {
                color: #555;
                line-height: 1.8;
            }

            footer {
                background: #cdb4db;
                color: #2d2d2d;
            }
        </style>
    </head>

    <body>

        <!-- Navbar -->
        <jsp:include page="navbar.jsp"/>

        <!-- Banner -->
        <div class="banner">
            <div>
                <h1>About Gourav's Bookstore</h1>
                <p>Where stories come alive 📖</p>
            </div>
        </div>

        <!-- About Content -->
        <div class="container mb-5">
            <div class="about-card">
                <h3>Who We Are</h3>
                <p>
                    Gourav's Bookstore is an online destination for book lovers who enjoy exploring
                    stories, knowledge, and inspiration. From fiction to finance, romance to self-help,
                    we aim to bring the best books at affordable prices.
                </p>

                <h3 class="mt-4">Our Mission</h3>
                <p>
                    Our mission is to promote reading habits and make books accessible to everyone.
                    We believe books have the power to inspire, educate, and transform lives.
                </p>

                <h3 class="mt-4">Why Choose Us?</h3>
                <ul>
                    <li>Wide variety of genres</li>
                    <li>Affordable pricing</li>
                    <li>User-friendly shopping experience</li>
                    <li>Passion for books & readers</li>
                </ul>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="footer.jsp"/>

        <!-- JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
