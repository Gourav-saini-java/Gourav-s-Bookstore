<%@ page import="java.util.*" %>

<%
    // Login check
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String price = request.getParameter("price");
    String image = request.getParameter("image");

    ArrayList<HashMap<String, Object>> cart
            = (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");

    if (cart == null) {
        cart = new ArrayList<>();
    }

    int qtyFromPage = Integer.parseInt(request.getParameter("qty"));

    boolean found = false;

    for (HashMap<String, Object> item : cart) {
        if (item.get("id").toString().equals(id)) {
            int qty = (int) item.get("qty");
            item.put("qty", qty + qtyFromPage);
            found = true;
            break;
        }
    }

    if (!found) {
        HashMap<String, Object> book = new HashMap<>();
        book.put("id", id);
        book.put("title", title);
        book.put("author", author);
        book.put("price", Integer.parseInt(price));
        book.put("image", image);
        book.put("qty", qtyFromPage);

        cart.add(book);
    }

    session.setAttribute("cart", cart);
    response.sendRedirect("cart.jsp");
%>
