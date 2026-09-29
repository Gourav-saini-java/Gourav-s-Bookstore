<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.LoginTest"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete</title>
</head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    int i = LoginTest.delete(id);

    if (i == 1) {
        response.sendRedirect("loginHistory");
    } else {
%>
        <h3 style="color:red;">Delete Failed</h3>
        <a href="loginHistory">Back</a>
<%
    }
%>

</body>
</html>
