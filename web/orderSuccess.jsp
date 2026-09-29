<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    HashMap<String, Object> order
            = (HashMap<String, Object>) session.getAttribute("order");

    if (order == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    ArrayList<HashMap<String, Object>> items
            = (ArrayList<HashMap<String, Object>>) order.get("items");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Order Success | Gourav's Bookstore</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

        <style>
            body { background: #faf6f4; font-family: Poppins, sans-serif; }
            .success-card {
                background: #fff;
                border-radius: 15px;
                padding: 30px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            }
        </style>
    </head>

    <body class="d-flex flex-column min-vh-100">

        <jsp:include page="navbar.jsp"/>

        <main class="flex-fill">
            <div class="container my-5">
                <div class="success-card text-center">
                    <h2 class="text-success">✅ Order Placed Successfully!</h2>
                    <p class="mt-2">Thank you for shopping with Gourav's Bookstore</p>

                    <hr>

                    <h5>📦 Order Details</h5>
                    <p><b>Name:</b> <%= order.get("name")%></p>
                    <p><b>Mobile:</b> <%= order.get("mobile")%></p>
                    <p><b>State:</b> <%= order.get("state")%></p>
                    <p><b>City:</b> <%= order.get("city")%></p>
                    <p><b>Address:</b> <%= order.get("address")%></p>
                    <p><b>Order Date:</b> <%= new java.text.SimpleDateFormat("dd-MM-yyyy").format(order.get("orderDate")) %></p>
                    <p><b>Payment:</b> Cash on Delivery</p>

                    <hr>

                    <h5>📚 Items</h5>
                    <%
                        for (HashMap<String, Object> book : items) {
                    %>
                    <p>
                        <%= book.get("title")%> (Qty: <%= book.get("qty")%>)
                    </p>
                    <% }%>

                    <hr>

                    <h4>Total Amount: ₹ <%= order.get("total")%></h4>

                    <a href="index.jsp" class="btn btn-success mt-3">
                        Continue Shopping
                    </a>
                </div>
            </div>
        </main>

        <jsp:include page="footer.jsp"/>

    </body>
</html>
