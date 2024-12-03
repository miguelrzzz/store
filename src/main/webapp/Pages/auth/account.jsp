<%-- 
    Document   : account
    Created on : 13 nov 2024, 10:56:39 p.m.
    Author     : Miguel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cuenta</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <style>
            body {
                background-color: #fff;
                color: #000;
            }
            a{
                color:black;
                text-decoration: none;
            }
            a:hover{
                color:#000;
            }
            .card {
                /*width: 900px;*/
                border: none;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .card-header {
                background-color: #f5f5f5;
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

            .account-option i:hover {
                font-size: 15px;
                color: black;
                margin-right: 12px;
            }

            .account-option .right-arrow {
                font-size: 14px;
                color: #999;
            }
        </style>
    </head>
    <body>
        <% if (true) {%>

        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="mb-0">Cuenta</h4>
                        </div>
                        <div class="card-body">

                            <div class="account-option">
                                <div><a href="./datos.jsp"><i class="fas fa-user"></i> Datos personales</a></div>
                                <div class="right-arrow"><a href="./datos.jsp"><i class="fas fa-chevron-right"></i></a></div>
                            </div>
                            <div class="account-option">
                                <div><a href="./seguridad.jsp"><i class="fas fa-lock"></i> Seguridad</a></div>
                                <div class="right-arrow"><a href="./seguridad.jsp"><i class="fas fa-chevron-right"></i></a></div>
                            </div>
                            <div class="account-option">
                                <div><a href="./mistarjetas"><i class="fas fa-credit-card"></i> Mis tarjetas</a></div>
                                <div class="right-arrow"><a href="./mistarjetas.jsp"><i class="fas fa-chevron-right"></i></a></div>
                            </div>
                            <!--<i class="fa fa-history" aria-hidden="true"></i>-->
                            <div class="account-option">
                                <div><a href="#"><i class="fas fa-map-marker-alt"></i> Direcciones</a></div>
                                <div class="right-arrow"><a href="#"><i class="fas fa-chevron-right"></i></a></div>
                            </div>
                            <div class="account-option">
                                <div><a href="#"><i class="fa fa-history"></i> Historial de pedidos</a></div>
                                <div class="right-arrow"><a href="#"><i class="fas fa-chevron-right"></i></a></div>
                            </div>
                            <div class="account-option">
                                <div><a href="#"><i class="fas fa-shield-alt"></i> Privacidad</a></div>
                                <div class="right-arrow"><a href="#"><i class="fas fa-chevron-right"></a></i></div>
                            </div>
                            <div class="account-option">
                                <div><a href="#"><i class="fas fa-comment"></i> Comunicaciones</a></div>
                                <div class="right-arrow"><a href="#"><i class="fas fa-chevron-right"></a></i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} else { %>

        <% }%>
    </body>
</html>