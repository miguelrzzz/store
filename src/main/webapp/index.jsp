<%-- 
    Document   : index
    Created on : 13 nov 2024, 10:35:47 p.m.
    Author     : Miguel
--%>

<%@page import="model.carrito"%>
<%@page import="model.usuarios"%>
<%@page import="model.Almacen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            // Inicializar el mapa desde Almacen
            Almacen tienda = (Almacen) session.getAttribute("tienda");
            if (tienda == null) {
                // Redirigir al servlet de inicialización
                response.sendRedirect("/Store/almacenController");
                return;
            }

            usuarios cuenta = new usuarios();

            if (session.getAttribute("loggedUser")!= null) {
                cuenta = (usuarios) session.getAttribute("loggedUser");
                cuenta.setCarritoPersonal(new carrito());
            } else {
                 cuenta = new usuarios("Usuario temporal",true );
                 session.setAttribute("userTemp", cuenta);
//                 cuenta = (usuarios) session.getAttribute("userTemp");
            }
        %>
        <meta http-equiv="refresh" content="0; URL=Pages/inicio.jsp" />
    </head>
    <body>
    </body>
</html>