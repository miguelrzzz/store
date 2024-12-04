<%-- 
    Document   : configurarpc
    Created on : 14 nov 2024, 10:56:48 p.m.
    Author     : Miguel
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Almacen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Configurador de PC</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-black: #000000;
                --primary-gray: #333333;
                --secondary-gray: #666666;
                --light-gray: #f5f5f5;
                --white: #ffffff;
            }
            h5 {
                font-size: 20px;
            }
            a, p {
                font-size: 16px;
            }
            .navbar-custom {
                background-color: var(--white);
                color: var(--primary-black);
            }
            .nav-link, .navbar-brand {
                color: var(--primary-black);
                font-size: 14px;
            }
            .nav-link:hover {
                color: var(--secondary-gray);
            }
            .card:hover {
                transform: translateY(-5px);
                transition: transform 0.3s ease;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .hero-section {
                background: linear-gradient(to right, #111827, #000000);
                height: 400px;
            }
            .btn-custom {
                background-color: var(--primary-black);
                color: var(--white);
                border: 1px solid var(--primary-black);
            }
            .btn-custom:hover {
                background-color: var(--primary-gray);
                border-color: var(--primary-gray);
            }
            .badge {
                background-color: var(--secondary-gray);
            }
            .text-custom-purple {
                color: var(--primary-black);
            }
            .card-img-top {
                margin: 20px auto;
                width: 120px;
            }

            @media (max-width: 768px) {
                .hero-section {
                    height: 250px;
                }
                .navbar-nav {
                    flex-direction: column;
                }
                .card-title, .card-text {
                    font-size: 0.9rem;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="#">CompuStore</a>
                <button class="navbar-toggler custom-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="toggler-line"></span>
                    <span class="toggler-line"></span>
                    <span class="toggler-line"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="./../inicio.jsp">Inicio</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                                Productos
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="productos.jsp">Componentes</a></li>
                                <li><a class="dropdown-item" href="productos.jsp">Accesorios</a></li>
                                <li><a class="dropdown-item" href="#">Computadoras</a></li>
                                <li><a class="dropdown-item" href="./configurator/configurarpc.jsp">Audio y Video</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#">Ofertas</a></li>
                        <li class="nav-item"><a class="nav-link" href="./configurator/configurarpc.jsp">Personalizar</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <%
            Almacen tienda = (Almacen) session.getAttribute("tienda");
        %>
        <div class="container d-flex">
            <!-- Menú izquierdo -->
            <div class="menu-izquierdo list-group list-group-flush" style="width: 20%;">
                <a href="#" onclick="showContent('add-procesador-content')" class="list-group-item list-group-item-action">Procesador</a>
                <a href="#" onclick="showContent('add-tarjetaMadre-content')" class="list-group-item list-group-item-action">Tarjeta Madre</a>
                <a href="#" onclick="showContent('add-tarjetaGrafica-content')" class="list-group-item list-group-item-action">Tarjeta de Video</a>
                <a href="#" onclick="showContent('add-ram-content')" class="list-group-item list-group-item-action">Memoria RAM</a>
                <a href="#" onclick="showContent('add-almacenamiento-content')" class="list-group-item list-group-item-action">Almacenamiento</a>
                <a href="#" onclick="showContent('add-gabinete-content')" class="list-group-item list-group-item-action">Gabinete</a>
                <a href="#" onclick="showContent('add-fuentePoder-content')" class="list-group-item list-group-item-action">Fuente de Poder</a>
            </div>

            <div class="contenido-dinamico" style="width: 80%;">
                <div class="card-body content-section" id="add-procesador-content" style="display: none;">
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <!-- Producto 1 -->
                        <%
                            ArrayList<Producto> procesadores = tienda.getStocks().get("procesadores");

                            for (Producto p : procesadores) {
                        %>
                        <div class="col">
                            <div class="card h-100 product-card">
                                <div class="card-body">
                                    <h6 class="card-title"><%=p.getNombre()%></h6>
                                    <p class="card-text text-secondary">
                                        <small><%=p.getDescripcion()%></small>
                                    </p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <del class="text-secondary">$1,927.00</del>
                                            <div class="fs-5 fw-bold text-custom-primary">$1,409.00</div>
                                        </div>
                                        <button class="btn btn-custom-outline btn-sm"  onclick="addToCart('<%= p.getSku()%>')">Agregar</button>
                                    </div>
                                    <small class="text-secondary"><%=p.getCantidadDisponible()%></small>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>

                <div class="card-body content-section" id="add-tarjetaGrafica-content" style="display: none;">
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <!-- Producto 1 -->
                        <%
                            ArrayList<Producto> tarjetasGraficas = tienda.getStocks().get("tarjetasGraficas");

                            for (Producto p : tarjetasGraficas) {
                        %>
                        <div class="col">
                            <div class="card h-100 product-card">
                                <div class="card-body">
                                    <h6 class="card-title"><%=p.getNombre()%></h6>
                                    <p class="card-text text-secondary">
                                        <small><%=p.getDescripcion()%></small>
                                    </p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <del class="text-secondary">$1,927.00</del>
                                            <div class="fs-5 fw-bold text-custom-primary">$1,409.00</div>
                                        </div>
                                        <button class="btn btn-custom-outline btn-sm"  onclick="addToCart('<%= p.getSku()%>')">Agregar</button>
                                    </div>
                                    <small class="text-secondary"><%=p.getCantidadDisponible()%></small>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>

            <div class="card-body content-section" id="add-tarjetaMadre-content" style="display: none;">
                <!-- Contenido de Tarjeta Gráfica -->
                <h5>Tarjetas de Video</h5>
                <p>Aquí se muestran las tarjetas gráficas disponibles.</p>
            </div>

            <!-- Agrega las demás categorías aquí -->
        </div>
    </div>


    <footer class="text-white py-4">
        <div class="container">
            <p>CompuStore - Tu tienda de confianza</p>
        </div>
    </footer>

    <script>
        function showContent(contentId) {
            // Ocultar todos los contenidos
            const contentElements = document.querySelectorAll('.content-section');
            contentElements.forEach(content => {
                content.style.display = 'none';
            });

            // Mostrar el contenido seleccionado
            const selectedContent = document.getElementById(contentId);
            if (selectedContent) {
                selectedContent.style.display = 'block';
            }
        }

        function addToCart(productId) {
            console.log("Enviando solicitud para agregar el producto:", productId);

            fetch('http://localhost:8082/Store/carritoController', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'action=add&productId=' + productId
            })
                    .then(response => {
                        console.log("Respuesta del servidor:", response);
                        return response.text().then(text => {
                            if (response.ok) {
                                alert('Producto añadido al carrito exitosamente');
                            } else {
                                throw new Error(text || 'Error en la solicitud');
                            }
                        });
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('Error: ' + error.message);
                    });
        }
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
