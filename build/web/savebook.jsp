<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.BooksTest"%>
<%@page import="Model.Books"%>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("admin.jsp");
        return;
    }

    String title = request.getParameter("bookName");
    String author = request.getParameter("authorName");
    String genre = request.getParameter("genre");
    String description = request.getParameter("description");
    int price = Integer.parseInt(request.getParameter("price"));
    String image = request.getParameter("bookImage");

    Books book = new Books();
    book.setTitle(title);
    book.setAuthor(author);
    book.setGenre(genre);
    book.setDescription(description);
    book.setPrice(price);
    book.setImage(image);

    int id = BooksTest.insert(book);

    if (id > 0) {
        response.sendRedirect("uploadBook.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Save Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center" style="height:100vh">
    <div class="card p-4 shadow" style="width:400px">
        <div class="alert alert-danger text-center">
            <h5>Book Not Saved</h5>
        </div>
        <a href="uploadBook.jsp" class="btn btn-primary w-100">Try Again</a>
    </div>
</div>
</body>
</html>
