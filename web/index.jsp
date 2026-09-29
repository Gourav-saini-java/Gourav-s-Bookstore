<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Gourav's Bookstore</title>

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
                color: #faf6f4;
                margin-bottom: 40px;
            }

            .banner h1 {
                font-size: 42px;
                font-weight: 700;
                text-shadow: 0 4px 10px rgba(0,0,0,0.35);
            }

            .banner p {
                font-size: 18px;
                opacity: 0.95;
            }

            /* Best Seller Cards */
            .bestseller-card {
                background: #ffffff;
                border-radius: 18px;
                box-shadow: 0 8px 20px rgba(0,0,0,0.08);
                transition: all 0.3s ease;
            }

            .bestseller-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 35px rgba(0,0,0,0.15);
            }

            .bestseller-img {
                width: 100%;
                height: 240px;
                object-fit: contain;
                background: #faf6f4;
                padding: 15px;
                border-radius: 15px;
            }

            .genre-badge {
                background: #dee2ff;
                color: #3a0ca3;
                font-size: 12px;
                padding: 6px 12px;
                border-radius: 20px;
            }

            .card-title {
                font-weight: 600;
                color: #3a0ca3;
            }

            .price {
                font-size: 18px;
                font-weight: bold;
                color: #198754;
            }

        </style>
    </head>

    <body class="d-flex flex-column min-vh-100">

        <!-- Navbar -->
        <jsp:include page="navbar.jsp"/>
        <main class="flex-fill">
            <!-- Banner -->
            <div class="banner">
                <div>
                    <h1>Welcome to Gourav's Bookstore! 📚</h1>
                    <p>Discover stories, knowledge & inspiration.</p>
                </div>
            </div>

            <!-- Best Selling Books -->
            <div class="container my-5">
                <h2 class="text-center fw-bold mb-4" style="color:#3a0ca3;">
                    🌟 Best Selling Books
                </h2>

                <div class="row g-4">
                    <%
                        String[][] bestBooks = {
                            {"Harry Potter", "J.K. Rowling", "Fantasy",
                                "A magical journey of a young wizard discovering friendship, courage, and destiny at Hogwarts School of Witchcraft and Wizardry.",
                                "499", "best1.jpg"},
                            {"Ikigai", "Héctor García", "Lifestyle",
                                "An inspiring guide that reveals the Japanese secret to a long, meaningful, and happy life.",
                                "279", "best2.jpg"},
                            {"IT", "Stephen King", "Horror",
                                "A chilling horror novel that explores fear, friendship, and an ancient evil haunting the town of Derry.",
                                "416", "best3.jpg"},
                            {"It Ends With Us", "Colleen Hoover", "Romance",
                                "An emotional love story dealing with relationships, resilience, and the courage to break painful cycles.",
                                "318", "best4.jpg"}
                        };

                        for (int i = 0; i < bestBooks.length; i++) {
                    %>

                    <div class="col-md-6 col-lg-3">
                        <div class="card bestseller-card h-100 p-3">

                            <img src="images/<%=bestBooks[i][5]%>" 
                                 class="bestseller-img" 
                                 alt="<%=bestBooks[i][0]%>">

                            <div class="card-body text-center">
                                <span class="badge genre-badge mb-2"><%=bestBooks[i][2]%></span>

                                <h5 class="card-title mt-2"><%=bestBooks[i][0]%></h5>

                                <p class="text-muted small mb-2">
                                    by <strong><%=bestBooks[i][1]%></strong>
                                </p>

                                <p class="card-text small text-muted">
                                    <%=bestBooks[i][3]%>
                                </p>

                                <div class="price mt-2">₹ <%=bestBooks[i][4]%></div>
                            </div>
                        </div>
                    </div>

                    <% }%>
                </div>
            </div>
        </main>
        <!-- Footer -->
        <jsp:include page="footer.jsp"/>

        <!-- JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            function changeQty(btn, value) {
            let input = btn.parentElement.querySelector(".qty-input");
            let qty = parseInt(input.value) + value;
            if (qty < 0) qty = 0;
            input.value = qty;
            }

            // Live Search
            document.getElementById("searchInput").addEventListener("keyup", function () {
            let filter = this.value.toLowerCase();
            let books = document.querySelectorAll(".book-item");
            books.forEach(book => {
            let text = book.innerText.toLowerCase();
            book.style.display = text.includes(filter) ? "block" : "none";
            });
            });
        </script>

    </body>
</html>
