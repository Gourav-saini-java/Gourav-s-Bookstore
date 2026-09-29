<%-- 
    Document   : logout
    Created on : 22 Dec, 2025, 3:36:25 PM
    Author     : INTEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
