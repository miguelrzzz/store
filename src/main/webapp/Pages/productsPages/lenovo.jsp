<%-- 
    Document   : lenovo
    Created on : 2 dic 2024, 1:18:25 a.m.
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.carrito, model.Producto, model.usuarios" %>
<!DOCTYPE html>
<html>
<head>
    <title>Carrito de Compras</title>
    <!-- Include your existing CSS and Bootstrap links -->
</head>
<body>
    <div class="container">
        <h2>Carrito de Compras</h2>
        
        <%
            usuarios usuario = (usuarios) session.getAttribute("usuario");
            carrito cart = usuario != null ? usuario.getCarritoPersonal() : null;
            
            if (cart == null || cart.getProductos().isEmpty()) {
        %>
            <p>Tu carrito está vacío.</p>
        <% 
            } else { 
        %>
            <table class="table">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Subtotal</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    for (Producto producto : cart.getProductos()) { 
                    %>
                        <tr>
                            <td><%= producto.getNombre() %></td>
                            <td>$<%= String.format("%.2f", producto.getPrecioOriginal()) %></td>
                            <td>
                                <form action="CarritoServlet" method="post">
                                    <input type="hidden" name="sku" value="<%= producto.getSku() %>">
                                    <input type="hidden" name="action" value="actualizar">
                                    <input type="number" name="cantidad" value="<%= producto.getCantidadComprada() %>" min="1">
                                    <button type="submit" class="btn btn-sm btn-primary">Actualizar</button>
                                </form>
                            </td>
                            <td>$<%= String.format("%.2f", producto.getPrecioOriginal() * producto.getCantidadComprada()) %></td>
                            <td>
                                <form action="CarritoServlet" method="post">
                                    <input type="hidden" name="sku" value="<%= producto.getSku() %>">
                                    <input type="hidden" name="action" value="eliminar">
                                    <button type="submit" class="btn btn-sm btn-danger">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                    <tr>
                        <td colspan="3">Total:</td>
                        <td>$<%= String.format("%.2f", cart.calcularTotal()) %></td>
                        <td>
                            <a href="#" class="btn btn-success">Proceder al Pago</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        <% } %>
    </div>
</body>
</html>