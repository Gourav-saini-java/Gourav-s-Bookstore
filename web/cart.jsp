<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    ArrayList<HashMap<String, Object>> cart
            = (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");
%>


<!DOCTYPE html>
<html>
    <head>
        <title>My Cart | Gourav's Bookstore</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

        <style>
            body { background: #faf6f4; font-family: Poppins, sans-serif; }
            .cart-card {
                background: #fff;
                border-radius: 15px;
                padding: 20px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            }
            img {
                height: 120px;
                object-fit: contain;
            }
            .navbar {
                background: linear-gradient(90deg, #e6b7c6, #c98b9b);
            }

            .navbar-brand {
                color: #4a2c2a !important;
                font-weight: 600;
            }

            .nav-link {
                color: #4a2c2a !important;
                font-weight: 500;
                position: relative;
            }

            .nav-link::after {
                content: "";
                position: absolute;
                width: 0;
                height: 2px;
                background: #9b5f6f;
                left: 0;
                bottom: -4px;
                transition: width 0.3s ease;
            }

            .nav-link:hover::after {
                width: 100%;
            }

            .nav-link:hover {
                color: #7a3e4b !important;
            }
        </style>
    </head>

    <body class="d-flex flex-column min-vh-100">
        <!-- Navbar -->
        <jsp:include page="navbar.jsp"/>
        <main class="flex-fill">

            <div class="container my-5">
                <h2 class="mb-4 text-center">🛒 My Cart</h2>

                <% if (cart == null || cart.size() == 0) { %>
                <div class="alert alert-warning text-center">
                    Your cart is empty
                </div>
                <% } else { %>

                <% int total = 0; %>

                <% for (HashMap<String, Object> book : cart) {
                        int price = (int) book.get("price");
                        int qty = (int) book.get("qty");
                        int subtotal = price * qty;
                        total += subtotal;
                %>

                <div class="cart-card mb-3 d-flex align-items-center">
                    <img src="images/<%= book.get("image")%>" class="me-3">

                    <div class="flex-grow-1">
                        <h5><%= book.get("title")%></h5>
                        <p>Author: <%= book.get("author")%></p>
                        <p>Price: ₹ <%= price%></p>
                        <p>Quantity: <b><%= qty%></b></p>
                        <p class="fw-bold text-success">
                            Subtotal: ₹ <%= subtotal%>
                        </p>
                    </div>

                    <a href="removeFromCart.jsp?id=<%= book.get("id")%>"
                       class="btn btn-danger btn-sm">
                        Remove
                    </a>
                </div>

                <% }%>


                <h4 class="text-end mt-4">
                    Total: ₹ <%= total%>
                </h4>

                <div class="text-end">
                     <a href="books.jsp" class="btn btn-secondary">
            <i class="fa fa-arrow-left"></i> Continue Shopping
                     </a>
                    <a href="checkout.jsp" class="btn btn-success">
                        Proceed to Checkout
                    </a>
                </div>

                <% }%>
            </div>
        </main>

    </body>
    <!-- Footer -->
    <jsp:include page="footer.jsp"/>
</html>
