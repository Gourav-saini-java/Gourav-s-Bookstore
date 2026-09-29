<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Orders"%>
<%@page import="Controller.OrdersTest"%>
<%@page import="java.util.List"%>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Orders History</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome (optional, for icons) -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

        <style>

            @media print {
                body * {
                    visibility: hidden;
                }
                #printArea, #printArea * {
                    visibility: visible;
                }
                #printArea {
                    position: absolute;
                    left: 0;
                    top: 0;
                    width: 100%;
                }
                .no-print {
                    display: none !important;
                }
            }
            body {
                font-family: 'Poppins', sans-serif;
                background: #faf6f4;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            footer {
                background: #cdb4db;
                color: #2d2d2d;
                margin-top: auto;
            }
        </style>
    </head>

    <body class="d-flex flex-column min-vh-100">

        <!-- Navbar -->
        <jsp:include page="adminNavbar.jsp"/>

        <main class="flex-fill">

            <div class="container mt-5 mb-4">
                <div class="card shadow mb-4" id="printArea">
                    <div class="card-header bg-primary text-white text-center">
                        <h4 class="mb-0">Order History</h4>
                    </div>

                    <div class="card-body no-print">
                        <form method="get" action="">
                            <div class="row justify-content-center mb-3">
                                <div class="col-md-6">
                                    <input type="text" name="search" class="form-control"
                                           placeholder="Search by name, city, state, mobile"
                                           value="<%= request.getParameter("search") != null ? request.getParameter("search") : ""%>">
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary w-100">
                                        <i class="fa fa-search"></i> Search
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="card-body">
                        <table class="table table-bordered table-striped table-hover text-center align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Mobile</th>
                                    <th>State</th>
                                    <th>City</th>
                                    <th>Address</th>
                                    <th>Payment Mode</th>
                                    <th>Order Date</th>
                                    <th>Items</th>
                                    <th>Total</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    String search = request.getParameter("search");
                                    List<Orders> li;

                                    if (search != null && !search.trim().isEmpty()) {
                                        li = OrdersTest.searchOrders(search);
                                    } else {
                                        li = OrdersTest.read();
                                    }

                                    if (li != null && !li.isEmpty()) {
                                        for (Orders l : li) {
                                %>
                                <tr>
                                    <td><%= l.getId()%></td>
                                    <td><%= l.getName()%></td>
                                    <td><%= l.getMobile()%></td>
                                    <td><%= l.getState()%></td>
                                    <td><%= l.getCity()%></td>
                                    <td><%= l.getAddress()%></td>
                                    <td>Cash On Delivery</td>
                                        <td><%= new java.text.SimpleDateFormat("dd-MM-yyyy")
                                                .format(l.getOrderDate())%></td>
                                    <td><%= l.getItems()%></td>
                                    <td>₹ <%= l.getTotal()%></td>

                                    <td>
                                        <a class="btn btn-warning btn-sm"
                                           href="updateformorder?id=<%= l.getId()%>">
                                            Edit
                                        </a>
                                    </td>

                                    <td>
                                        <a class="btn btn-danger btn-sm"
                                           href="deleteorder?id=<%= l.getId()%>"
                                           onclick="return confirm('Delete this order?');">
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="d-flex justify-content-center gap-3 mt-1 no-print">
                    <a href="admin.jsp" class="btn btn-secondary">
                        <i class="fa fa-arrow-left"></i> Back to Admin
                    </a>

                    <button onclick="window.print()" class="btn btn-success">
                        <i class="fa fa-print"></i> Print
                    </button>
                </div>
        </main>
    </body>
    <!-- Footer -->
    <div class="mb-5"></div>
    <jsp:include page="footer.jsp"/>
    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</html>
