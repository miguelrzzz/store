<%-- 
    Document   : asus
    Created on : 2 dic 2024, 12:46:56 a.m.
    Author     : Miguel
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Producto"%>
<%@page import="model.Almacen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Productos Destacados</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-black: #black;
                --primary-gray: #333333;
                --secondary-gray: #666666;
                --light-gray: #f5f5f5;
                --white: #ffffff;
            }

            .navbar-custom {
                background-color: var(--white);
                color:black;

            }

            .nav-link, .navbar-brand {
                color: black;
                font-size: 14px;
            }

            .nav-link:hover {
                color: var(--secondary-gray);
            }

            #navbarDropdown{
                background-color: transparent;
            }
            .dropdown-menu {
                background-color: #fff;
                border: 0.1rem solid #fff;
                border-radius: 0px;
                box-shadow: none;
                padding: 0px;
            }

            .dropdown-item {
                color: #333;
                padding: 10px 20px;
            }

            .dropdown-item:hover {
                background-color: #f0f0f0;
            }
            .badge {
                background-color: var(--secondary-gray)
            }

            .custom-toggler {
                border: none;
                padding: 0.25rem;
                background: transparent;
                width: 30px;
                height: 30px;
                position: relative;
                display: flex;
                flex-direction: column;
                justify-content: space-around;
            }

            .custom-toggler:focus {
                outline: none;
                box-shadow: none;
            }

            .toggler-line {
                width: 100%;
                height: 2px;
                background-color:#000;
                transition: all 0.3s;
            }


            body {
                background-color: #f8f9fa;
                color: #212529;
            }

            .card {
                transition: transform 0.3s ease;
            }
            .card:hover {
                transform: scale(1.05);
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            }
            .card-img-top{
                margin-left: 100px;
                margin-top: 20px;
                width: 120px;
                height:max;
            }

            .btn-custom {
                background-color: #000;
                color: #fff;
                border: 1px solid #000;
                transition: all 0.3s ease;
            }
            .btn-custom:hover {
                background-color: #fff;
                color: #000;
            }
            .filter-section {
                margin-bottom: 20px;
            }
            /* Sección de filtrado */
            .filter-section h2 {
                font-size: 1.5rem;
                font-weight: bold;
                color: #000; /* Texto negro */
            }

            /* Botones de filtro */
            .btn-filter {
                background-color: #fff; /* Fondo blanco */
                color: #000; /* Texto negro */
                border: 1px solid #000; /* Borde negro */
                padding: 10px 20px;
                font-size: 0.9rem;
                font-weight: 600;
                border-radius: 20px; /* Bordes redondeados */
                transition: all 0.3s ease;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra ligera */
            }

            .btn-filter:hover {
                background-color: #000; /* Fondo negro al hacer hover */
                color: #fff; /* Texto blanco en hover */
                transform: scale(1.05); /* Aumenta ligeramente el tamaño */
            }

            .btn-filter.active {
                background-color: #000; /* Fondo negro para el botón activo */
                color: #fff; /* Texto blanco */
                border: 2px solid #fff; /* Resalta el borde */
            }

            /* Ajuste para botones responsivos */
            .filter-section .d-flex {
                gap: 10px;
                flex-wrap: wrap; /* Permite que los botones se ajusten en pantallas pequeñas */
            }

            .add-to-cart {
                display: none; /* Ocultar el botón por defecto */
                transition: opacity 0.3s ease; /* Añadir una transición suave */
                opacity: 0; /* Comenzar con opacidad 0 */
            }

            .product-card:hover .add-to-cart {
                display: block; /* Mostrar el botón cuando se pasa el mouse sobre el contenedor */
                opacity: 1; /* Cambiar a opacidad 1 */
            }

            @media (max-width: 768px) {
                .hero-section {
                    height: 250px;
                }

                .hero-section h1 {
                    font-size: 1.5rem;
                }

                .hero-section p {
                    font-size: 1rem;
                }

                .navbar-nav {
                    flex-direction: column;
                    align-items:flex-end;
                    gap: 0.5rem;
                }

                .navbar-nav .nav-link {
                    font-size: 0.9rem;
                }
                .card {
                    margin: 0 auto;
                }

                .card-title {
                    font-size: 1rem;
                }

                .card-text {
                    font-size: 0.9rem;
                    height: 3rem;
                }

                .footer .row div {
                    text-align: center;
                    margin-bottom: 1rem;
                }
                .bg-light p,h4 {
                    font-size: 16px;
                }

                .bg-light .row {
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: space-around;
                    height:auto;
                }

                .bg-light .row div {
                    flex: 1;
                    text-align: center;
                    margin-bottom: 1rem;
                }

                .bg-light .row div i{
                    font-size: 20px;
                }
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="#">CompuStore</a>
                <button class="navbar-toggler custom-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="toggler-line"></span>
                    <span class="toggler-line"></span>
                    <span class="toggler-line"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="./../inicio.jsp">Inicio</a>
                        </li>
                        <li class="nav-item dropdown" >
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" >
                                Productos
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="productos.jsp">Componentes</a></li>
                                <li><a class="dropdown-item" href="productos.jsp">Accesorios</a></li>
                                <li><a class="dropdown-item" href="#">Computadoras</a></li>
                                <li><a class="dropdown-item" href="./configurator/configurarpc.jsp">Audio y Video</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Ofertas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./configurator/configurarpc.jsp">Personalizar</a>
                        </li>
                    </ul>
                    <div class="d-flex align-items-center">
                    </div>
                </div>
            </div>
        </nav>
        <%
            Almacen tienda = (Almacen) session.getAttribute("tienda");
            if (tienda == null) {
                // Redirigir al servlet de inicialización
                response.sendRedirect("/Store/almacenController");
                return;
            }
//            tienda.setStocks(Almacen.inicializarStock());
            Map<String, ArrayList<Producto>> stocks = tienda.getStocks();
        %>
        <section class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2 class="text-left mb-4">Más vendidos</h2>
                    </div>
                </div>
                <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <%
                            int slideIndex = 0; // Contador para marcar la primera slide como activa
                            for (Map.Entry<String, ArrayList<Producto>> entry : stocks.entrySet()) {
                                String categoria = entry.getKey();
                                ArrayList<Producto> productos = entry.getValue();

                                // Dividir productos por slide
                                int productosPorSlide = 4;
                                int totalProductos = productos.size();
                                int totalSlides = (int) Math.ceil((double) totalProductos / productosPorSlide);

                                for (int slide = 0; slide < totalSlides; slide++) {
                        %>
                        <div class="carousel-item <%= slideIndex == 0 ? "active" : ""%>">
                            <div class="row">
                                <%
                                    int startIndex = slide * productosPorSlide;
                                    int endIndex = Math.min(startIndex + productosPorSlide, totalProductos);

                                    for (int i = startIndex; i < endIndex; i++) {
                                        Producto p = productos.get(i);
                                %>
                                <div class="col-12 col-md-6 col-lg-3 product-card">
                                    <div class="card">
                                        <img src="https://lh3.googleusercontent.com/d/<%= p.getImg()%>" class="card-img-top img-fluid" alt="<%= p.getNombre()%>">
                                        <div class="card-body">
                                            <h5 class="card-title"><%= p.getNombre()%></h5>
                                            <p class="card-text"><%= p.getDescripcion()%></p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span class="h5 mb-0">$<%= String.format("%.2f", p.getPrecioOriginal())%></span>
                                                <button class="btn btn-custom add-to-cart">Añadir</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                        </div>
                        <%
                                    slideIndex++; // Incrementar el contador para el índice de los slides
                                } // Fin del loop por slides
                            } // Fin del loop por categorías
                        %>
                        <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Anterior</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Siguiente</span>
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5">
            <div class="container">
                <div class="row filter-section">
                    <div class="col-12">
                        <h2 class="text-left mb-4">Laptops</h2>
                    </div>
                </div>
                <!--boton de filtro con js-->
                <div class="row filter-section">
                    <div class="col-12">
                        <h2 class="text-left mb-4">Filtrar Productos</h2>
                        <div class="d-flex justify-content-start flex-wrap gap-2">
                            <button class="btn btn-filter" data-category="all">Mostrar Todos</button>
                            <button class="btn btn-filter" data-category="laptops">Laptops</button>
                            <button class="btn btn-filter" data-category="monitores">Monitores</button>
                        </div>
                    </div>
                </div>


                <div class="row " id="productContainer">
                    <%
                        for (Map.Entry<String, ArrayList<Producto>> entry : tienda.getStocks().entrySet()) {
                            String categoria = entry.getKey();
                            ArrayList<Producto> productos = entry.getValue();

                            for (Producto p : productos) {
                                if (p.getMarca().equals("AMD")) {
                    %>
                    <div class="col-6 col-md-6 col-lg-3 mb-4 product-card" data-category="<%= categoria%>">
                        <div class="card h-100">
                            <img src="https://lh3.googleusercontent.com/d/<%= p.getImg()%>" class="card-img-top" alt="<%= p.getNombre()%>">
                            <div class="card-body">
                                <h5 class="card-title"><%= p.getNombre()%></h5>
                                <p class="card-text"><%= p.getDescripcion()%></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="h5 mb-0">$<%= String.format("%.2f", p.getPrecioOriginal())%></span>
                                    <button class="btn btn-custom add-to-cart" data-id="<%= p.getSku()%>" onclick="addToCart('<%= p.getSku()%>')">Añadir</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }
                    %>
                </div>
            </div>
        </section>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./cart.js" ></script>
        <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                            const categoryButtons = document.querySelectorAll('.btn-filter');
                                            const productCards = document.querySelectorAll('#productContainer .product-card');


                                            categoryButtons.forEach(button => {
                                                button.addEventListener('click', function () {
                                                    const category = this.getAttribute('data-category');

                                                    // Remover clase activa de todos los botones
                                                    categoryButtons.forEach(btn => btn.classList.remove('active'));
                                                    this.classList.add('active');

                                                    productCards.forEach(card => {
                                                        if (category === 'all' || card.getAttribute('data-category') === category) {
                                                            card.style.display = 'block';
                                                        } else {
                                                            card.style.display = 'none';
                                                        }
                                                    });
                                                });
                                            });
                                        });
        </script>
    </body>
</html>