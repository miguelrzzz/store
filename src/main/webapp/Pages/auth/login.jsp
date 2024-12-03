<%-- 
    Document   : login
    Created on : 13 nov 2024, 10:56:39 p.m.
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CompuStore - Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #000000; /* Negro */
            --secondary-color: #ffffff; /* Blanco */
            --hover-color: #f1f1f1;
        }

        body {
            background-color: var(--secondary-color);
            color: var(--secondary-color);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background-color: var(--secondary-color);
            color: var(--primary-color);
            border-radius: 15px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.3);
            max-width: 800px;
            overflow: hidden;
        }

        .login-image {
            background-color: var(--primary-color);
            color: var(--secondary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            padding: 2rem;
        }

        .login-image h1 {
            font-size: 2.5rem;
            font-weight: bold;
        }

        .login-image p {
            font-size: 1rem;
            margin-top: 0.5rem;
        }

        .login-form {
            padding: 2rem;
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-control {
            border: 1px solid var(--primary-color);
            padding: 0.75rem;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: none;
        }

        .btn-login {
            background-color: var(--primary-color);
            color: var(--secondary-color);
            padding: 0.75rem;
            border-radius: 8px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .btn-login:hover {
            background-color: var(--hover-color);
            color: var(--primary-color);
        }

        .text-muted {
            color: #6c757d !important;
        }

        .social-btn {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
            transition: background-color 0.3s ease, color 0.3s ease;
            margin: 0 5px;
        }

        .social-btn:hover {
            background-color: var(--primary-color);
            color: var(--secondary-color);
        }

        .divider {
            position: relative;
            text-align: center;
            margin: 1.5rem 0;
        }

        .divider::before, .divider::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 45%;
            height: 1px;
            background-color: #ddd;
        }

        .divider::before {
            left: 0;
        }

        .divider::after {
            right: 0;
        }

        .divider span {
            padding: 0 1rem;
            background-color: var(--secondary-color);
            color: #666;
        }

        @media (max-width: 768px) {
            .btn-login{
                font-size: 11px;
            }
            .login-image {
                display: none;
            }
            .login-container h2, button{
                font-size: 18px;
            }
            .login-container p{
                font-size: 16px;
            }
            .login-container{
                font-size: 14px;
                top:0;
                width: 350px;
                height: 500px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container row">
        <!-- Imagen lateral -->
        <div class="col-md-6 login-image">
            <h1>CompuStore</h1>
            <p>Tu destino para la mejor tecnología</p>
        </div>

        <!-- Formulario -->
        <div class="col-md-6">
            <div class="login-form">
                <div class="login-header">
                    <h2>Bienvenido</h2>
                    <p class="text-muted">Inicia sesión en tu cuenta</p>
                </div>
                <form method="post" action="./../../userController">
                    <div class="mb-3">
                        <label for="loginEmail" class="form-label">Correo electrónico</label>
                        <input name="loginEmail" id="loginEmail" type="email" class="form-control" placeholder="enter email" required>
                    </div>
                    <div class="mb-3">
                        <label for="loginPwd" class="form-label">Contraseña</label>
                        <input name="loginPwd" id="loginPwd" type="password" class="form-control" placeholder="enter password" required>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="remember">
                            <label class="form-check-label" for="remember">Recordarme</label>
                        </div>
                        <a href="#" class="text-decoration-none">¿Olvidaste tu contraseña?</a>
                    </div>
                    <button type="submit" name="loginEnviado" id="loginEnviado" class="btn btn-login">Iniciar sesión</button>
                </form>
                <p class="text-center mt-4">
                    ¿No tienes una cuenta? 
                    <a href="register.jsp" class="text-decoration-none">Regístrate</a>
                </p>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
