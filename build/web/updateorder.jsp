<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.OrdersTest"%>

<jsp:useBean id="o" class="Model.Orders" scope="request"/>
<%
    o.setId(Integer.parseInt(request.getParameter("id")));
    o.setName(request.getParameter("name"));
    o.setMobile(request.getParameter("mobile"));
    o.setState(request.getParameter("state"));
    o.setCity(request.getParameter("city"));
    o.setAddress(request.getParameter("address"));
    o.setItems(request.getParameter("items"));
    o.setTotal(Integer.parseInt(request.getParameter("total")));
    String dateStr = request.getParameter("orderDate");
    java.util.Date date = java.sql.Date.valueOf(dateStr);
    o.setOrderDate(date);

    int result = OrdersTest.update(o);
%>

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
           if (result == 1) {
        %>

        <div class="card success-card p-4">
            <div class="success-box">
                <div class="success-title">Data Updated Successful!</div>
                <p class="success-text">Your data is updated in your database</p>
            </div>

            <div class="text-center mt-4">
                <a href="orderHistory" class="btn btn-primary px-4">
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
