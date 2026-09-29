<%@ page import="java.util.*" %>
<%@ page import="Model.Orders" %>
<%@ page import="Controller.OrdersTest" %>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    ArrayList<HashMap<String, Object>> cart
            = (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }

    String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String state = request.getParameter("state");
    String city = request.getParameter("city");
    String address = request.getParameter("address");

    int total = 0;
    StringBuilder items = new StringBuilder();

    for (HashMap<String, Object> book : cart) {
        int price = (int) book.get("price");
        int qty = (int) book.get("qty");
        total += price * qty;

        items.append(book.get("title")).append(" (Qty ").append(qty).append("), ");
    }

    if (items.length() > 0) {
        items.setLength(items.length() - 2);
    }

    Orders o = new Orders();
    o.setName(name);
    o.setMobile(mobile);
    o.setState(state);
    o.setCity(city);
    o.setAddress(address);
    o.setOrderDate(new Date());
    o.setItems(items.toString());
    o.setTotal(total);

    OrdersTest.insert(o);

    HashMap<String, Object> order = new HashMap<>();
    order.put("name", name);
    order.put("mobile", mobile);
    order.put("state", state);
    order.put("city", city);
    order.put("address", address);
    order.put("orderDate", o.getOrderDate());
    order.put("items", cart);
    order.put("total", total);

    session.setAttribute("order", order);
    session.removeAttribute("cart");

    response.sendRedirect("orderSuccess.jsp");
%>
