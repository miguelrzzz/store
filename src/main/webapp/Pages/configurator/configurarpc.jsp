<%-- 
    Document   : configurarpc
    Created on : 14 nov 2024, 10:56:48 p.m.
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                --primary-color: #212529;
                --secondary-color: #666666;
                --accent-color: #000000;
                --light-gray: #f8f9fa;
                --medium-gray: #e9ecef;
            }

            body {
                background-color: var(--light-gray);
            }

            .navbar {
                background-color: white;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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

            .btn-custom-primary {
                background-color: var(--primary-color);
                color: white;
                border: none;
            }

            .btn-custom-primary:hover {
                background-color: var(--accent-color);
                color: white;
            }

            .btn-custom-outline {
                border: 2px solid var(--primary-color);
                color: var(--primary-color);
                background-color: transparent;
            }

            .btn-custom-outline:hover {
                background-color: var(--primary-color);
                color: white;
            }

            .card {
                border: none;
                box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            }

            .card-header {
                background-color: white;
                border-bottom: 1px solid var(--medium-gray);
            }

            .badge-custom {
                background-color: var(--primary-color);
                color: white;
            }

            .text-custom-primary {
                color: var(--primary-color) !important;
            }

            .list-group-item {
                border-left: none;
                border-right: none;
                border-color: var(--medium-gray);
            }

            .list-group-item:hover {
                background-color: var(--light-gray);
                color: var(--primary-color);
            }

            .footer {
                background-color: white;
                border-top: 1px solid var(--medium-gray);
            }

            .social-icon {
                color: var(--primary-color);
                transition: color 0.3s ease;
            }

            .social-icon:hover {
                color: var(--accent-color);
            }

            .product-card:hover {
                transform: translateY(-2px);
                transition: transform 0.3s ease;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

            .navbar-brand {
                font-weight: bold;
                color: var(--primary-color);
            }

            .nav-link {
                color: var(--secondary-color);
            }

            .nav-link:hover {
                color: var(--primary-color);
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand" href="#">ConfiguradorPC</a>
                <button class="navbar-toggler custom-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="../../index.jsp"><i class="fas fa-home"></i> Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-heart"></i> Favoritos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-info-circle"></i> Centro de Información</a>
                        </li>
                    </ul>
                    <div class="d-flex">
                        <form action="http://localhost:8082/Store/Pages/auth/login.jsp">
                            <button type="submit" class="btn btn-custom-outline me-2"  >Iniciar Sesión</button></form>
                        </form>
                        <button class="btn btn-custom-primary">
                            <a  class="nav-link" href="./../cart/carrito.jsp"><i class="fas fa-shopping-cart"></i> $0.00</a>
                        </button>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container my-4">
            <div class="row">
                <!-- Barra latreral Izquierda - Categorias -->
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Categorías</h5>
                        </div>
                        <div class="list-group list-group-flush">
                            <a href="#" class="list-group-item list-group-item-action">Procesador</a>
                            <a href="#" class="list-group-item list-group-item-action">Tarjeta Madre</a>
                            <a href="#" class="list-group-item list-group-item-action">Tarjeta de Video</a>
                            <a href="#" class="list-group-item list-group-item-action">Memoria RAM</a>
                            <a href="#" class="list-group-item list-group-item-action">Almacenamiento</a>
                            <a href="#" class="list-group-item list-group-item-action">Gabinete</a>
                            <a href="#" class="list-group-item list-group-item-action">Fuente de Poder</a>
                        </div>
                    </div>
                </div>

                <!-- Main Content - Productos -->
                <div class="col-md-6 mb-4">
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">Procesadores</h5>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="stockOnly">
                                <label class="form-check-label" for="stockOnly">
                                    Mostrar solo productos con stock
                                </label>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row row-cols-1 row-cols-md-2 g-4">
                                <!-- Producto 1 -->
                                <div class="col">
                                    <div class="card h-100 product-card">
                                        <div class="card-body">
                                            <span class="badge badge-custom">-26%</span>
                                            <h6 class="card-title">Procesador AMD Ryzen 5 5500</h6>
                                            <p class="card-text text-secondary">
                                                <small>Socket AM4, 3.60GHz, Six-Core</small>
                                            </p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <del class="text-secondary">$1,927.00</del>
                                                    <div class="fs-5 fw-bold text-custom-primary">$1,409.00</div>
                                                </div>
                                                <button class="btn btn-custom-outline btn-sm">Agregar</button>
                                            </div>
                                            <small class="text-secondary">254 pzas. disponibles</small>
                                        </div>
                                    </div>
                                </div>
                                <!-- Product 2 -->
                                <div class="col">
                                    <div class="card h-100 product-card">
                                        <div class="card-body">
                                            <span class="badge badge-custom">-21%</span>
                                            <h6 class="card-title">Procesador AMD Ryzen 5 5600X</h6>
                                            <p class="card-text text-secondary">
                                                <small>Socket AM4, 3.70GHz, 32MB Cache</small>
                                            </p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <del class="text-secondary">$3,330.00</del>
                                                    <div class="fs-5 fw-bold text-custom-primary">$2,619.00</div>
                                                </div>
                                                <button class="btn btn-custom-outline btn-sm">Agregar</button>
                                            </div>
                                            <small class="text-secondary">51 pzas. disponibles</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--  Resumen de la compra -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Resumen de mi PC</h5>
                        </div>
                        <div class="card-body">
                            <p class="text-secondary">No has seleccionado ningún componente</p>
                            <hr>
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-secondary">Subtotal</span>
                                <span>$0.00</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-secondary">Envío</span>
                                <span>$0.00</span>
                            </div>
                            <div class="d-flex justify-content-between fw-bold">
                                <span>Total</span>
                                <span>$0.00</span>
                            </div>
                            <button class="btn btn-custom-primary w-100 mt-3">Añadir al carrito</button>
                        </div>
                    </div>

                    <!-- div del servicio -->
                    <div class="card mt-4">
                        <div class="card-header">
                            <h5 class="mb-0">Servicio de ensamble</h5>
                        </div>
                        <div class="card-body">
                            <p class="text-secondary">Despreocúpate y deja el ensamble de tu PC en manos de nuestro equipo de expertos.</p>
                            <p class="fw-bold">$100000000000.00</p>
                            <small class="text-custom-primary">Agrega el servicio de ensamble y recibe un cupon.</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5 class="text-custom-primary">Contacto</h5>
                        <p class="text-secondary">L-D 9:00am a 6:00pm</p>
                        <p class="text-secondary">Tel: (33) 4737 1360</p>
                        <p class="text-secondary">Email: info@configuradorpc.mx</p>
                    </div>
                    <div class="col-md-4">
                        <h5 class="text-custom-primary">Enlaces útiles</h5>
                        <ul class="list-unstyled">
                            <li><a href="#" class="text-secondary text-decoration-none">¿Cómo comprar?</a></li>
                            <li><a href="#" class="text-secondary text-decoration-none">Garantías y devoluciones</a></li>
                            <li><a href="#" class="text-secondary text-decoration-none">Preguntas frecuentes</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5 class="text-custom-primary">Síguenos</h5>
                        <div class="d-flex gap-3">
                            <a href="#" class="social-icon"><i class="fab fa-facebook fa-2x"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-twitter fa-2x"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-instagram fa-2x"></i></a>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="text-center text-secondary">
                    <small>&copy; 2024 ConfiguradorPC. Todos los derechos reservados.</small>
                </div>
            </div>
        </footer>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    </body>
</html>