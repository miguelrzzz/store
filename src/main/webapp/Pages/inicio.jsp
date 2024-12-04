<%-- 
    Document   : inicio
    Created on : 13 nov 2024, 10:37:44 p.m.
    Author     : Miguel
--%>

<%@page import="model.carrito"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Producto"%>
<%@page import="model.Almacen"%>
<%@page import="model.usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CompuStore</title>
        <link href="shortcut icon" href="./src/img/logo.png"/>
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
            a,
            p {
                font-size: 16px;
            }

            .navbar-custom {
                background-color: var(--primary-black);
            }

            .nav-link,
            .navbar-brand {
                color: var(--white);
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
                background-size: cover;
                background-position: center;
                height: 400px;
            }

            .btn-custom {
                background-color: var(--primary-black);
                color: var(--white);
                border: 1px solid var(--primary-black);
            }

            .btn-custom:hover {
                background-color: var(--primary-gray);
                color: var(--white);
                border: 1px solid var(--primary-gray);
            }

            .badge {
                background-color: var(--secondary-gray);
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
                background-color: var(--white);
                transition: all 0.3s;
            }

            .text-custom-purple {
                font-size: 1.5rem;
                color: var(--primary-black);
            }

            .bg-light {
                background-color: var(--light-gray);
            }

            .card {
                border: 1px solid var(--light-gray);
            }

            .card-title {
                font-size: 16px;
            }

            .card-text {
                font-size: 16px;
            }

            footer {
                background-color: var(--primary-black);
            }

            footer a:hover {
                color: var(--secondary-gray);
                text-decoration: none;
            }

            .card-img-top {
                margin-left: 100px;
                margin-top: 20px;
                width: 120px;
                height: max;
            }
            .carousel-item {
            }

            .carousel-control-next,
            .carousel-control-prev {
                top: 50%;
                transform: translateY(-50%);
                width: 5%;
            }
            .carousel-control-prev {
                left: -50px;
                color: black;
            }
            .carousel-control-next {
                right: -50px;
            }
            .carousel-control-prev-icon,
            .carousel-control-next-icon {
                background-color: black;
                background-size: 50%;
                border-radius: 50%;
                padding: 10px;
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
                    align-items: flex-end;
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
                .bg-light p,
                h4 {
                    font-size: 16px;
                }

                .bg-light .row {
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: space-around;
                    height: auto;
                }

                .bg-light .row div {
                    flex: 1;
                    text-align: center;
                    margin-bottom: 1rem;
                }

                .bg-light .row div i {
                    font-size: 20px;
                }
            }

        </style>
    </head>

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
                    <li class="nav-item">
                        <a class="nav-link" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./productsPages/productos.jsp">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Ofertas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./configurator/configurarpc.jsp">Personalizar</a>
                    </li>
                </ul>
                <div class="d-flex align-items-center">
                    <%
                        usuarios cuenta = new usuarios();
                        if (session.getAttribute("loggedUser") != null) {
                            cuenta = (usuarios) session.getAttribute("loggedUser");
                            cuenta.setCarritoPersonal(new carrito());
                        } else {
                            if (session.getAttribute("userTemp") != null) {
                                cuenta = (usuarios) session.getAttribute("userTemp");
                            } else {
                                cuenta = new usuarios("Usuario temporal", true);
                                session.setAttribute("userTemp", cuenta);
//                            cuenta = (usuarios) 
                            }
                        }
                            if (session != null && session.getAttribute("loggedUser") != null) {
                    %>
                    <a href="./auth/account.jsp" class="nav-link me-3">
                        <i class="fas fa-user"></i>
                    </a>
                    <%
                    } else {
                    %>
                    <a href="./auth/login.jsp" class="nav-link me-3">
                        <i class="fas fa-user"></i>
                    </a>
                    <%
                        }
                    %>
                    <%
                        int art = cuenta.getCarritoPersonal() != null ? cuenta.getCarritoPersonal().getCantidadArticulos() : 0;
                    %>
                    <a href="./cart/carrito.jsp" class="nav-link">
                        <i class="fas fa-shopping-cart"></i>
                        <span id="cart-count" class="badge"><%= art%></span>
                    </a>

                </div>
            </div>
        </div>
    </nav>

    <section class="py-5">
        <div class="container">
            <div id="imageCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://lh3.googleusercontent.com/d/1JEYmPS9l-Uu0RCZokRxQ5OnNsoFYunLj" class="d-block w-100" alt="Imagen 1">
                    </div>
                    <div class="carousel-item">
                        <img src="https://lh3.googleusercontent.com/d/1CvI0vvnz_j61zxsqR-VFQ6D8-S_6LmEd" class="d-block w-100" alt="Imagen 2">
                    </div>
                    <div class="carousel-item">

                        <img src="https://lh3.googleusercontent.com/d/1_bzuWIOPofWH6sUAmBORUIZ4IvunyLpW" class="d-block w-100" alt="Imagen 3">
                    </div>
                    <div class="carousel-item">

                        <img src="https://lh3.googleusercontent.com/d/1YdEDsLmmDeLiaeSM9XbJHi0BiGOKmTBj" class="d-block w-100" alt="Imagen 3">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#imageCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Anterior</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#imageCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Siguiente</span>
                </button>
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#imageCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#imageCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#imageCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    <button type="button" data-bs-target="#imageCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
                </div>
            </div>
        </div>
    </section>
    <!--seccion marcas de productos-->
    <section class="py-5">
        <div class="container">
            <div class="row filter-section">
                <div class="col-12">
                    <h2 class="text-left mb-4">Marcas</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-6 col-md-6 col-lg-3 mb-4">
                    <div class="card h-100">
                        <a href="./productsPages/amd.jsp">
                            <img src="https://lh3.googleusercontent.com/d/1bI7KCOwXOCunjWqF4Lc5dvUX7MZBft8R" class="card-img-top" alt="Marca 1">
                        </a>
                    </div>
                </div>
                <div class="col-6 col-md-6 col-lg-3 mb-4">
                    <div class="card h-100">
                        <a href="./productsPages/dell.jsp">
                            <img src="https://lh3.googleusercontent.com/d/1GHbYf5mHUsaYqx_AA18fzCIEEAtHoWMk" class="card-img-top" alt="Marca 2">
                        </a>
                    </div>
                </div>
                <div class="col-6 col-md-6 col-lg-3 mb-4">
                    <div class="card h-100">
                        <a href="./productsPages/lenovo.jsp">
                            <img src="https://lh3.googleusercontent.com/d/1NJjHa0_T0N7CWGclRDH_boILVQ5sHPhX" class="card-img-top" alt="Marca 2">
                        </a>
                    </div>
                </div>
                <div class="col-6 col-md-6 col-lg-3 mb-4">
                    <div class="card h-100">
                        <a href="./productsPages/asus.jsp">
                            <img src="https://lh3.googleusercontent.com/d/1vCS1vFbNXAoIZVV50CKulW2TXD8cHNY7" class="card-img-top" alt="Marca 2">
                        </a>
                    </div>
                </div>

                <div class="col-6 col-md-6 col-lg-3 mb-4">
                    <div class="card h-100">
                        <a href="./productsPages/intel.jsp">
                            <img src="https://lh3.googleusercontent.com/d/1_00ZEJRIwBUysXGnzPbZmSIyXohWVDXP" class="card-img-top" alt="Marca 2">
                        </a>
                    </div>
                </div>
                <div class="col-6 col-md-6 col-lg-3 mb-4">
                    <div class="card h-100">
                        <a href="./productsPages/kingston.jsp">
                            <img src="https://lh3.googleusercontent.com/d/1Ov8JbIinBUnam4eRy5av9U_AsNRiaTNq" class="card-img-top" alt="Marca 2">
                        </a>
                    </div>
                </div>
                <div class="col-6 col-md-6 col-lg-3 mb-4">
                    <div class="card h-100">
                        <a href="productsPages/gigabyte.jsp">
                            <img src="https://lh3.googleusercontent.com/d/13vBVhg65tOV89Mf-vMtho9QfpCoBmYSt" class="card-img-top" alt="Marca 2">
                        </a>
                    </div>
                </div>
                <div class="col-6 col-md-6 col-lg-3 mb-4">
                    <div class="card h-100">
                        <a href="productsPages/coolermaster.jsp">
                            <img src="https://lh3.googleusercontent.com/d/1a2yngZVL0w1hdeGye_567ThtjwyAPNfV" class="card-img-top" alt="Marca 2">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
                                            <button class="btn btn-custom add-to-cart" data-id="<%= p.getSku()%>" onclick="addToCart('<%= p.getSku()%>')">Añadir</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                } %>
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
    <!-- Footer -->
    <footer class="text-white py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <h5>CompuStore</h5>
                    <p>Tu tienda de confianza para tecnología</p>
                </div>
                <div class="col-md-4 mb-3">
                    <h5>Enlaces</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Sobre nosotros</a></li>
                        <li><a href="#" class="text-white">Términos y condiciones</a></li>
                        <li><a href="#" class="text-white">Política de privacidad</a></li>
                    </ul>
                </div>
                <div class="col-md-4 mb-3">
                    <h5>Contacto</h5>
                    <ul class="list-unstyled">
                        <li><i class="fas fa-phone me-2"></i> +1 234 567 890</li>
                        <li><i class="fas fa-envelope me-2"></i> info@compustore.com</li>
                        <li><i class="fas fa-map-marker-alt me-2"></i> San Quintin #123</li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script>
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
//                                        updateCartCount(text);
//                                        cartCount
                                const cartCountElement = document.getElementById('cart-count');
                                cartCountElement.textContent = text; // Actualizar el badge
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
        function updateCartCount(count) {
            const cartCountElement = document.getElementById('cart-count');
            cartCountElement.textContent = count;
        }
    </script>
</html>