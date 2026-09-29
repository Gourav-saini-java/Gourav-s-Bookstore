<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.RegistrationTest"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Registration</title>
</head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    int i = RegistrationTest.delete(id);

    if (i == 1) {
        response.sendRedirect("allUsers");
    } else {
%>
        <h3 style="color:red;">Delete Failed</h3>
        <a href="allUsers">Back</a>
<%
    }
%>

</body>
</html>
