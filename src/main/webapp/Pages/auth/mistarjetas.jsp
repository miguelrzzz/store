<%-- 
    Document   : mistarjetas
    Created on : 25 nov 2024, 7:45:57 p.m.
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Tarjetas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .card-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 15px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            font-size: 18px;
            font-weight: bold;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .tarjeta {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            background-color: #fff;
            transition: box-shadow 0.2s;
        }
        .tarjeta:hover {
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        .tarjeta .icon {
            font-size: 30px;
            color: #6200ea;
        }
        .tarjeta-info {
            flex-grow: 1;
            margin-left: 15px;
        }
        .tarjeta-info h5 {
            margin: 0;
            font-size: 16px;
            font-weight: bold;
        }
        .tarjeta-info p {
            margin: 0;
            font-size: 14px;
            color: #6c757d;
        }
        .btn {
            background-color: black;
            color:white;
            font-size: 14px;
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #white;
            color: black;
            /*border-color: black;*/
        }
    </style>
</head>
<body>
    <div class="card-container">
        <div class="card-header">Mis Tarjetas Bancarias</div>

        <!-- Tarjeta 1 -->
        <div class="tarjeta">
            <div class="icon">
                <i class="bi bi-credit-card"></i>
            </div>
            <div class="tarjeta-info">
                <h5>Tarjeta Visa</h5>
                <p>**** **** **** 1234</p>
                <p>Vencimiento: 12/25</p>
            </div>
            <a href="#" class="btn">Eliminar</a>
        </div>

        <!-- Tarjeta 2 -->
        <div class="tarjeta">
            <div class="icon">
                <i class="bi bi-credit-card-2-front"></i>
            </div>
            <div class="tarjeta-info">
                <h5>Tarjeta Mastercard</h5>
                <p>**** **** **** 5678</p>
                <p>Vencimiento: 08/26</p>
            </div>
            <a href="#" class="btn">Eliminar</a>
        </div>

        <!-- Botón para añadir más tarjetas -->
        <div class="text-center mt-3">
            <a href="#" class="btn">Añadir nueva tarjeta</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
