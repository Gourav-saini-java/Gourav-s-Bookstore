<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.OrdersTest"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Order</title>
    </head>
    <body>
       <%
    int id = Integer.parseInt(request.getParameter("id"));
    int i = OrdersTest.delete(id);

    if (i == 1) {
        response.sendRedirect("orderHistory");
    } else {
%>
        <h3 style="color:red;">Delete Failed</h3>
        <a href="orderHistory">Back</a>
<%
    }
%>

</body>
</html>
