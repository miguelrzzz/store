<%--  
    Document   : register
    Created on : 13 nov 2024, 11:30:00 p.m.
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CompStore - Registro</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #000000;
                --hover-color: #f5f5f5;
            }

            body {
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            input{
                height: 40px;
            }

            span{
                height: 40px;
            }

            .register-container {
                background: white;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                overflow: hidden;
                max-width: 900px;
                width: 100%;
            }

            .register-header {
                text-align: center;
                margin-bottom: 2rem;
            }

            .register-form {
                padding: 2rem;
            }

            .register-image {
                background-color: var(--primary-color);
                background-size: cover;
                background-position: center;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                padding: 2rem;
            }

            .form-control {
                border: 2px solid #eee;
                padding: 0.75rem;
                border-radius: 10px;
                margin-bottom: 1rem;
            }

            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: none;
            }

            .input-group-text {
                background: transparent;
                border: 2px solid #eee;
                border-right: none;
            }

            .form-control {
                border-left: none;
            }

            .btn-register {
                background-color: var(--primary-color);
                color: white;
                padding: 0.75rem;
                border-radius: 10px;
                width: 100%;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .btn-register:hover {
                background-color: var(--hover-color);
                color: white;
            }

            .social-login {
                margin-top: 2rem;
            }

            .social-btn {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                border: 2px solid #eee;
                color: #666;
                margin: 0 0.5rem;
                transition: all 0.3s;
            }

            .social-btn:hover {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                color: white;
            }

            .divider {
                margin: 1.5rem 0;
                position: relative;
            }

            .divider::before {
                content: "";
                position: absolute;
                top: 50%;
                left: 0;
                right: 0;
                height: 1px;
                background-color: #eee;
            }

            .divider span {
                background-color: white;
                padding: 0 1rem;
                color: #666;
                position: relative;
                z-index: 1;
            }

            @media (max-width: 768px) {
                .btn-register{
                    font-size: 11px;
                }
                .register-image {
                    display: none;
                }

                .container{
                    width: 350px;
                }
                .register-container h2, button{
                    font-size: 18px;
                }
                .register-container p{
                    font-size: 16px;
                }

            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="register-container">
                <div class="row g-0">
                    <div class="col-md-6">
                        <div class="register-image h-100">
                            <div class="text-center">
                                <h1 class="display-4 fw-bold mb-4">CompuStore</h1>
                                <p class="lead">Tu destino para la mejor tecnología</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="register-form">
                            <div class="register-header">
                                <h2 class="mb-0">Crea una cuenta</h2>
                                <p class="text-muted">Regístrate en CompuStore</p>
                            </div>

                            <form>
                                <div class="input-group mb-3">
                                    <span class="input-group-text">
                                        <i class="fas fa-user text-muted"></i>
                                    </span>
                                    <input name="registerName" id="registerName" type="text" class="form-control" placeholder="Nombre completo" required>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text">
                                        <i class="fas fa-envelope text-muted"></i>
                                    </span>
                                    <input name="registerEmail" id="registerEmail" type="email" class="form-control" placeholder="Correo electrónico" required>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text">
                                        <i class="fas fa-lock text-muted"></i>
                                    </span>
                                    <input nombre="registerPwd1" id="registerPwd1" type="password" class="form-control" placeholder="Contraseña" required>
                                </div>

                                <div class="input-group mb-4">
                                    <span class="input-group-text">
                                        <i class="fas fa-lock text-muted"></i>
                                    </span>
                                    <input nombre="registerPwd2" id="registerPwd2" type="password" class="form-control" placeholder="Confirmar contraseña" required>
                                </div>

                                <button type="submit" class="btn btn-register mb-3">Registrarse</button>

                                <p class="text-center mt-4">
                                    ¿Ya tienes una cuenta? 
                                    <a href="login.jsp" class="text-decoration-none" style="color: var(--primary-color);">Inicia sesión</a>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
