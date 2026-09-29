<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Contact Us | Gourav's Bookstore</title>

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

            /* Banner */
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

            /* Contact Cards */
            .contact-card {
                background: #ffffff;
                border-radius: 20px;
                padding: 30px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            }

            .contact-card h4 {
                font-weight: 600;
                margin-bottom: 20px;
            }

            .form-control {
                border-radius: 10px;
            }

            .send-btn {
                background: #0d6efd;
                color: #fff;
                border-radius: 25px;
                padding: 10px;
                font-weight: 500;
            }

            .send-btn:hover {
                background: #084298;
            }

            .info p {
                margin-bottom: 10px;
                font-weight: 500;
            }

            .info i {
                color: #e63946;
                margin-right: 8px;
            }

            iframe {
                border-radius: 15px;
                border: none;
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
                <h1>Contact Us</h1>
                <p>We’d love to hear from you 💬</p>
            </div>
        </div>

        <!-- Contact Section -->
        <div class="container mb-5">
            <div class="row g-4">

                <!-- Send Message -->
                <div class="col-md-6">
                    <div class="contact-card">
                        <h4>Send a Message</h4>

                        <form>
                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" class="form-control" placeholder="Your name">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" placeholder="Your email">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Message</label>
                                <textarea class="form-control" rows="5" placeholder="Your message..."></textarea>
                            </div>

                            <button type="submit" class="btn send-btn w-100">
                                Send Message
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Get in Touch -->
                <div class="col-md-6">
                    <div class="contact-card info">
                        <h4>Get in Touch</h4>

                        <p><i class="fa-solid fa-location-dot"></i> Address: Ujjain (M.P.), India</p>
                        <p>
                            <i class="fa-solid fa-envelope"></i>
                            Email:
                            <a href="mailto:saingourav2121@gmail.com">saingourav2121@gmail.com</a>
                        </p>
                        <p>
                            <i class="fa-solid fa-phone"></i>
                            Phone:
                            <a href="tel:+919238562121">+91 92385 62121</a>
                        </p>

                        <iframe
                            src="https://www.google.com/maps?q=Ujjain%20Madhya%20Pradesh&output=embed"
                            width="100%"
                            height="260"
                            loading="lazy">
                        </iframe>
                    </div>
                </div>

            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="footer.jsp"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
