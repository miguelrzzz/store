<%-- 
    Document   : carrito
    Created on : 14 nov 2024, 11:50:39 p.m.
    Author     : Miguel
--%>
<%@page import="model.Producto"%>
<%@page import="model.usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Carrito - CompuStore</title>
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
            h5{
                font-size: 20px;
            }
            a,p{
                font-size: 16px;
            }

            .navbar-custom {
                background-color: var(--primary-black);
            }

            .nav-link, .navbar-brand {
                color: var(--white)
                    /*COLOOOOOOOORRRRRRR ZI*/
            }

            .nav-link:hover {
                color: var(--secondary-gray)
                    /*COLOOOOOOOORRRRRRR ZI*/
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

            .btn-outline-custom {
                background-color: var(--white);
                color: var(--primary-black);
                border: 1px solid var(--primary-black);
            }

            .btn-outline-custom:hover {
                background-color: var(--light-gray);
                color: var(--primary-black);
            }

            .badge {
                background-color: var(--secondary-gray)
                    /*COLOOOOOOOORRRRRRR ZI*/
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

            .toggler-line {
                width: 100%;
                height: 2px;
                background-color: var(--white);
            }

            .cart-item {
                border-bottom: 1px solid var(--light-gray);
                padding: 1.5rem 0;
                height: 10rem;
            }

            .cart-item:last-child {
                border-bottom: none;
            }

            .quantity-control {
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .quantity-btn {
                width: 30px;
                height: 30px;
                display: flex;
                align-items: center;
                justify-content: center;
                border: 1px solid var(--light-gray);
                background: var(--white);
                cursor: pointer;
            }

            .quantity-btn:hover {
                background: var(--light-gray);
            }

            .cart-summary {
                background-color: var(--light-gray);
                padding: 1.5rem;
                border-radius: 4px;
            }

            .product-image {
                max-width: 120px;
                height: auto;
            }

            .remove-item {
                color: var(--secondary-gray);
                cursor: pointer;
            }

            .remove-item:hover {
                color: var(--primary-black);
            }
            @media (max-width: 768px) {
                .navbar-nav {
                    /*width: 0.1rem;*/
                    flex-direction: column;
                    align-items:flex-start;
                    gap: 0.5rem;
                }
            }
            
        </style>
    </head>
    <body>
        <% 
         usuarios cuenta = (usuarios) session.getAttribute("loggedUser");
         
        %>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="./../inicio.jsp">CompuStore</a>
                <button class="navbar-toggler custom-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="toggler-line"></span>
                    <span class="toggler-line"></span>
                    <span class="toggler-line"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="./../inicio.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Ofertas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./../configurator/configurarpc.jsp">Personalizar</a>
                        </li>
                    </ul>
                    <div class="d-flex align-items-center">
                        <a href="./../auth/login.jsp" class="nav-link me-3">
                            <i class="fas fa-user"></i>
                        </a>
                        <a href="carrito.jsp" class="nav-link">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="badge">3</span>
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Carrito seccion-->
        <%if(cuenta != null) {%>
        <div class="container my-5">
            <h2 class="mb-4">Carrito de Compras</h2>

            <div class="row">
                <!-- Carrito items-->
                <div class="col-lg-8">
                    <!-- Carrtio Item 1 -->
                    <!-- Cart Item 2 -->
                    <!-- Cart Item 3 -->
                    <% for(Producto p : cuenta.getCarritoPersonal().getProductos() ) { %>
                    <div class="cart-item">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <img src="https://lh3.googleusercontent.com/d/<%= p.getImg()%>" alt="Kit Gaming" class="product-image">
                            </div>
                            <div class="col-md-4">
                                <h5 class="mb-1"><%=p.getNombre() %> </h5>
                                <p class="text-muted mb-0"><%=p.getDescripcion() %></p>
                            </div>
                            <div class="col-md-2">
                                <div class="quantity-control">
                                    <button class="quantity-btn">-</button>
                                    <span>1</span>
                                    <button class="quantity-btn">+</button>
                                </div>
                            </div>
                            <div class="col-md-2 text-end">
                                <span class="h5"><%=p.getPrecioOriginal() %></span>
                            </div>
                            <div class="col-md-2 text-end">
                                <i class="fas fa-times remove-item"></i>
                            </div>
                        </div>
                    </div>
                    <%} %>
                </div>

                <!-- Cart Summary -->
                <div class="col-lg-4">
                    <div class="cart-summary">
                        <h4 class="mb-4">Resumen del Pedido</h4>

                        <div class="d-flex justify-content-between mb-2">
                            <span>Subtotal</span>
                            <span><%=cuenta.getCarritoPersonal().calcularTotal() %></span>
                        </div>

                        <div class="d-flex justify-content-between mb-2">
                            <span>Envío</span>
                            <span>Gratis</span>
                        </div>

                        <div class="d-flex justify-content-between mb-4">
                            <span>IVA (16%)</span>
                            <span>$247.99</span>
                        </div>

                        <div class="d-flex justify-content-between mb-4">
                            <span class="h5">Total</span>
                            <span class="h5">$1,797.96</span>
                        </div>

                        <!-- Coupon Code -->
                        <div class="mb-4">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Código de descuento">
                                <button class="btn btn-outline-custom">Aplicar</button>
                            </div>
                        </div>

                        <button class="btn btn-custom w-100 mb-2">Proceder al Pago</button>
                        <button class="btn btn-outline-custom w-100">Seguir Comprando</button>
                    </div>
                </div>
            </div>
        </div>
        <%}else{ %>
        
        <p> Hola </p>
        <%}%>
        <!-- Footer -->
        <footer class="bg-dark text-white py-4 mt-5">
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
    </body>
</html>