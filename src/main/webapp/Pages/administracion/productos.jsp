<%-- 
    Document   : productos
    Created on : 2 dic 2024, 11:41:28 p.m.
    Author     : Miguel
--%>

<%@page import="model.usuarios"%>
<%@page import="java.util.Map"%>
<%@page import="model.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Almacen"%>
<%-- 
    Document   : dash
    Created on : 2 dic 2024, 11:22:05 p.m.
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admin Dashboard | Korsat X Parmaga</title>
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" href="./style.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .navbar-custom {
                background-color: white;
                color: black; /* Letras negras */
            }

            .navbar-custom .nav-link {
                color: black; 
            }

            .navbar-custom .nav-link:hover {
                color: gray;
            }
        </style>
    </head>

    <body>
        <!-- =============== Navigation ================ -->
        <%
            usuarios cuenta = (usuarios) session.getAttribute("loggedUser");
            if (cuenta != null) {
                if (cuenta.getCorreo().equals("admin@gmail.com")) {
        %>
        <div class="container-custom">
            <div class="navigation">
                <ul>
                    <li>
                        <a href="#">
                            <span class="icon">
                                <ion-icon name="hardware-chip-outline"></ion-icon>
                            </span>
                            <span class="title">CompuStore-Admin</span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <span class="icon">
                                <ion-icon name="home-outline"></ion-icon>
                            </span>
                            <span class="title">Dashboard</span>
                        </a>
                    </li>

                    <li>
                        <a href="./usuarios.jsp">
                            <span class="icon">
                                <ion-icon name="people-outline"></ion-icon>
                            </span>
                            <span class="title">Usuarios</span>
                        </a>
                    </li>

                    <li>
                        <a href="./productos.jsp">
                            <span class="icon">
                                <ion-icon name="bag-handle-outline"></ion-icon>
                            </span>
                            <span class="title">Productos</span>
                        </a>
                    </li>

                    <li>
                        <a href="./help.jsp">
                            <span class="icon">
                                <ion-icon name="help-outline"></ion-icon>
                            </span>
                            <span class="title">Help</span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <span class="icon">
                                <ion-icon name="settings-outline"></ion-icon>
                            </span>
                            <span class="title">Settings</span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <span class="icon">
                                <ion-icon name="lock-closed-outline"></ion-icon>
                            </span>
                            <span class="title">Password</span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <span class="icon">
                                <ion-icon name="log-out-outline"></ion-icon>
                            </span>
                            <span class="title">Sign Out</span>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- ========================= Main ==================== -->
            <div class="main">
                <div class="topbar d-flex align-items-center">
                    <div class="toggle me-2">
                        <ion-icon name="menu-outline"></ion-icon>
                    </div>
                    <nav class="navbar navbar-expand-lg navbar-light navbar-custom">
                        <a class="navbar-brand" href="#">Gestión de Productos</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item"><a class="nav-link" href="#" onclick="showContent('list-products-content')">Consulta</a></li>
                                <li class="nav-item"><a class="nav-link" href="#" onclick="showContent('delete-product-content')">Eliminar</a></li>
                                <li class="nav-item"><a class="nav-link" href="#" onclick="showContent('edit-product-content')">Editar</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>

                <!-- ================ Detalles de los productos ================= -->
                <div class="details">
                    <div class="content-section" id="list-products-content" style="display: none;">
                        <div class="details">
                            <div class="recentOrders">
                                <div class="cardHeader">
                                    <h2>Almacén</h2>
                                    <a href="#" class="btn">Ver todos</a>
                                </div>

                                <table>
                                    <thead>
                                        <tr>
                                            <td>SKU</td>
                                            <td>Nombre</td>
                                            <td>Marca</td>
                                            <td>Stock</td>
                                            <td>Precio</td>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                            Almacen tienda = (Almacen) session.getAttribute("tienda");
                                            for (Map.Entry<String, ArrayList<Producto>> entry : tienda.getStocks().entrySet()) {
                                                String categoria = entry.getKey();
                                                ArrayList<Producto> productos = entry.getValue();

                                                for (Producto p : productos) {
                                        %>
                                        <tr>
                                            <td><%=p.getSku()%></td>
                                            <td><%=p.getNombre()%></td>
                                            <td><%=p.getMarca()%></td>
                                            <td><%=p.getCantidadDisponible()%></td>
                                            <td><%=p.getPrecioOriginal()%></td>
                                        </tr>
                                        <% }
                                            }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="content-section" id="add-product-content" style="display: none;">
                        <p>Productos</p>
                        <ul>
                            <li>PERA</li>
                            <li>MANZANA</li>
                        </ul>
                    </div>
                    <div class="content-section" id="edit-product-content" style="display: none;">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <h2>Modificar Datos</h2>
                                        </div>
                                        <div class="card-body">
                                            <form action="productController" method="post" id="modificar">
                                                <div class="form-group">
                                                    <label for="nombre">sku:</label>
                                                    <input type="text" class="form-control" id="newnombre" name="newnombre">
                                                </div>
                                                <div class="form-group">
                                                    <label for="nombre">nombre:</label>
                                                    <input type="text" class="form-control" id="newnombre" name="newnombre">
                                                </div>
                                                <div class="form-group">
                                                    <label for="nombre">marca:</label>
                                                    <input type="text" class="form-control" id="newnombre" name="newnombre">
                                                </div>
                                                <div class="form-group">
                                                    <label for="nombre">precio:</label>
                                                    <input type="text" class="form-control" id="newnombre" name="newnombre">
                                                </div>

                                                <div class="form-group">
                                                    <label for="email">cantidad disponible:</label>
                                                    <input type="email" class="form-control" id="newemail" name="newemail" >
                                                </div>
                                                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <% }
                }%>

            <!-- =========== Scripts =========  -->
            <script src="./main.js"></script>

            <!-- ====== ionicons ======= -->
            <script>
                function showContent(contentId) {
                    // Ocultar todos los contenidos
                    const contentElements = document.querySelectorAll('.content-section');
                    contentElements.forEach(content => {
                        content.style.display = 'none';
                    });

                    // Mostrar el contenido seleccionado
                    const selectedContent = document.getElementById(contentId);
                    selectedContent.style.display = 'block';
                }
            </script>
            <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>