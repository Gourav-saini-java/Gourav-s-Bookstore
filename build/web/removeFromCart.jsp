<%@ page import="java.util.*" %>

<%
    String id = request.getParameter("id");

    ArrayList<HashMap<String, Object>> cart =
        (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");

    if (cart != null) {
        Iterator<HashMap<String, Object>> itr = cart.iterator();
        while (itr.hasNext()) {
            HashMap<String, Object> item = itr.next();
            if (item.get("id").toString().equals(id)) {
                itr.remove();
                break;
            }
        }
    }

    session.setAttribute("cart", cart);
    response.sendRedirect("cart.jsp");
%>
