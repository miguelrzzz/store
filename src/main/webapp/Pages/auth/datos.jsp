<%-- 
    Document   : datos
    Created on : 25 nov 2024, 1:02:56 p.m.
    Author     : Miguel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Producto"%>
<%@page import="model.usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Datos del Usuario</title>
        <style>
            img[src=""] {
                display: none;
            }

            img{
                font-size: 12px;
                align-content: space-between;
            }
            body {
                background-color: #fff;
                color: #000;
                font-family: Arial, sans-serif;
            }
            a {
                color: black;
                text-decoration: none;
            }
            .card {
                max-width: 900px;
                margin: 20px auto;
                border: none;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }
            .card-header {
                background-color: #f5f5f5;
                padding: 20px;
                font-size: 18px;
                font-weight: bold;
                text-align: center;
            }
            .card-body {
                padding: 20px;
            }
            .account-option {
                font-size: 14px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 12px 0;
                border-bottom: 1px solid #e5e5e5;
            }
            .account-option i {
                font-size: 15px;
                margin-right: 12px;
            }
            .account-option .right-arrow {
                font-size: 14px;
                color: #999;
            }
            .profile-pic {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                background-color: #e0e0e0;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 2em;
                color: #777;
                margin: 10px auto;
            }
        </style>
    </head>
    <body>
        <%
            usuarios cuenta = (usuarios) session.getAttribute("loggedUser");
            if (cuenta == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            String nombre = cuenta.getNombre();
        %>
        <div class="card">
            <div class="card-header">
                Información del Usuario
            </div>
            <!-- Información básica -->
            <div class="account-option">
                <span>Pedios</span>
                
                <% ArrayList<Producto> comprados = cuenta.getCarritoPersonal().getProductosComprados();
                        for(Producto p :  comprados){%>
                <span>
                </span>
                <% %>
            </div>
            <div class="account-option">
                <span>Primer Apellido </span>
                <span>
                    <%= cuenta.getApellido1() == null ? "------------" : cuenta.getApellido1()%>
                </span>
            </div>
            <div class="account-option">
                <span>Segundo Apellido </span>
                <span>
                    <%= cuenta.getApellido2() == null ? "------------" : cuenta.getApellido2()%>
                </span>
            </div>

            <div class="account-option">
                <span>Género</span>
                <span>
                    <%= cuenta.getGenero() == null ? "No especificado" : cuenta.getGenero()%>
                </span>
            </div>

            <!-- Información de contacto -->
            <div class="account-option">
                <span>Correo principal</span>
                <span>
                    <%=cuenta.getCorreo()%>
                </span>
            </div>
            <div class="account-option">
                <span>Correo secundario</span>
                <span>
                    <%=cuenta.getCorreo2() == null ? "sin vincular " : cuenta.getCorreo2()%>
                </span>
            </div>

            <div class="account-option">
                <span>Telefono</span>
                <span>
                    <%=cuenta.getNumero_celular() == null ? "sin vincular " : cuenta.getNumero_celular()%>
                </span>
            </div>

        </div>
    </b/html>
