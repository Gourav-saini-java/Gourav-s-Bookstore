<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="Controller.BooksTest" %>
<%@ page import="Model.Books" %>
<%@ page import="java.util.List" %>
<%
    BooksTest book = new BooksTest();
    List<Books> books = book.getAllBooks();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Books | Gourav's Bookstore</title>

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
                font-size: 38px;
                font-weight: 700;
            }

            /* Book Cards */
            .book-card {
                background: #ffffff;
                border-radius: 15px;
                transition: all 0.3s ease;
                box-shadow: 0 8px 20px rgba(0,0,0,0.08);
                height: 100%;
            }
            .book-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 15px 30px rgba(0,0,0,0.15);
            }

            .book-img {
                width: 100%;
                height: 240px;     
                object-fit: contain;   
                background-color: #faf6f4;  
                padding: 10px;             
                border-radius: 12px;
                margin-bottom: 12px;
                transition: transform 0.3s ease;
            }


            .book-card:hover .book-img {
                transform: scale(1.05);
            }


            .book-title {
                font-weight: 600;
                color: #3a0ca3;
            }

            .price {
                font-size: 18px;
                font-weight: bold;
                color: #198754;
            }

            .qty-btn {
                border: none;
                width: 35px;
                height: 35px;
                background: #dee2ff;
                font-weight: bold;
                border-radius: 5px;
            }

            .qty-input {
                width: 40px;
                text-align: center;
                border: none;
                background: transparent;
                font-weight: bold;
            }

            .add-cart {
                background: #4ea8de;
                color: white;
                border-radius: 25px;
            }

            .add-cart:hover {
                background: #0077b6;
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
                <h1>Explore Our Books Collection 📖</h1>
                <p>Find your next favorite read</p>
            </div>
        </div>

        <!-- Books Section -->
         <div class="container my-5">
            <div class="row g-4" id="bookContainer">

                <%
                    for (Books b : books) {
                %>

                <div class="col-md-3 book-item">
                    <div class="card book-card p-3">

                        <img src="images/<%= b.getImage()%>" class="book-img">
                        <h5 class="book-title"><%= b.getTitle()%></h5>
                        <p><small><b>Author:</b> <%= b.getAuthor()%></small></p>
                        <p><small><b>Genre:</b> <%= b.getGenre()%></small></p>
                        <p class="text-muted small"><%= b.getDescription()%></p>
                        <div class="price mb-2">₹ <%= b.getPrice()%></div>

                        <form action="addToCart.jsp" method="post">

                            <div class="d-flex align-items-center mb-3">
                                <button type="button" class="qty-btn" onclick="changeQty(this, - 1)">−</button>
                                <input class="qty-input" name="qty" value="1" readonly>
                                <button type="button" class="qty-btn" onclick="changeQty(this, 1)">+</button>
                            </div>

                            <input type="hidden" name="id" value="<%= b.getId()%>">
                            <input type="hidden" name="author" value="<%= b.getAuthor()%>">
                            <input type="hidden" name="title" value="<%= b.getTitle()%>">
                            <input type="hidden" name="price" value="<%= b.getPrice()%>">
                            <input type="hidden" name="image" value="<%= b.getImage()%>">

                            <button type="submit" class="btn add-cart w-100">
                                <i class="fa fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>


                    </div>
                </div>

                <%
                    }
                %>

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

                                document.getElementById("searchInput").addEventListener("keyup", function () {
                                let filter = this.value.toLowerCase();
                                document.querySelectorAll(".book-item").forEach(book => {
                                book.style.display = book.innerText.toLowerCase().includes(filter) ? "block" : "none";
                                });
                                });
        </script>

    </body>
</html>
