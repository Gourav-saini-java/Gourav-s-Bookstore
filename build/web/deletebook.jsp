<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.BooksTest"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Book</title>
    </head>
    <body>
       <%
    int id = Integer.parseInt(request.getParameter("id"));
    int i = BooksTest.delete(id);

    if (i == 1) {
        response.sendRedirect("manageBooks");
    } else {
%>
        <h3 style="color:red;">Delete Failed</h3>
        <a href="manageBooks">Back</a>
<%
    }
%>

</body>
</html>
