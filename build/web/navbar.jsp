<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String user = (String) session.getAttribute("username");

    ArrayList<HashMap<String, String>> cart
            = (ArrayList<HashMap<String, String>>) session.getAttribute("cart");

    int cartCount = (cart == null) ? 0 : cart.size();
%>
<style>
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
<nav class="navbar navbar-expand-lg shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">📚 Gourav's Bookstore</a>

        <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navMenu">

            <!-- LEFT MENU -->
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="books.jsp">Books</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
            </ul>

            <!-- SEARCH -->
            <input class="form-control me-3 w-25" id="searchInput" type="search" placeholder="Search books...">

            <!-- RIGHT MENU -->
            <ul class="navbar-nav align-items-center">

                <% if (user != null) {%>

                <!-- Welcome -->
                <li class="nav-item">
                    <span class="nav-link fw-semibold">
                        👋 Welcome, <%= user%>
                    </span>
                </li>

                <!-- Cart with Badge -->
                <li class="nav-item">
                    <a class="btn btn-outline-dark position-relative" href="cart.jsp">
                        <i class="fa fa-shopping-cart"></i> Cart
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                            <%= cartCount%>
                        </span>
                    </a>

                </li>

                <!-- Logout -->
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">
                        <i class="fa fa-sign-out-alt"></i> Logout
                    </a>
                </li>

                <% } else { %>

                <!-- Guest: More Menu -->
                <li class="nav-item dropdown">
                    <button class="btn btn-outline-dark dropdown-toggle" data-bs-toggle="dropdown">
                        More
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="login.jsp">Login</a></li>
                        <li><a class="dropdown-item" href="register.jsp">Register</a></li>
                        <li><a class="dropdown-item" href="admin.jsp">Admin</a></li>
                    </ul>
                </li>

                <% }%>

            </ul>
        </div>
    </div>
</nav>
