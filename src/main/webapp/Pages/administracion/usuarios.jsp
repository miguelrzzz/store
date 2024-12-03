<%-- 
    Document   : usuarios
    Created on : 2 dic 2024, 11:51:49 p.m.
    Author     : Miguel
--%>



<%@page import="model.usuarios"%>
<%@page import="java.util.Map"%>
<%@page import="model.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Almacen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admin Dashboard | Korsat X Parmaga</title>
        <!-- ======= Styles ====== -->
        <link rel="stylesheet" href="./style.css">
    </head>

    <body>
        <!-- =============== Navigation ================ -->
        <div class="container">
            <div class="navigation">
                <ul>
                    <li>
                        <a href="./dash.jsp">
                            <span class="icon">
                                <ion-icon name="logo-apple"></ion-icon>
                            </span>
                            <span class="title">CompuStore-Admin</span>
                        </a>
                    </li>

                    <li>
                        <a href="./dash.jsp">
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
                        <a href="#">
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
                <div class="topbar">
                    <div class="toggle">
                        <ion-icon name="menu-outline"></ion-icon>
                    </div>

                    <div class="search">
                        <label>
                            <input type="text" placeholder="Search here">
                            <ion-icon name="search-outline"></ion-icon>
                        </label>
                    </div>

                    <div class="user">
                        <img src="assets/imgs/customer01.jpg" alt="">
                    </div>
                </div>

                <!-- ================ Detalles de los productos ================= -->
                <div class="details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2>Almacen</h2>
                            <a href="#" class="btn">View All</a>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Nombre</td>
                                    <td>Apellido</td>
                                    <td>Segundo Apellido</td>
                                    <td>Contacto</td>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    ArrayList<usuarios> listaUsuarios = usuarios.consulta();

                                    for (usuarios u : listaUsuarios) {
                                %>
                                <tr>
                                    <td><%=u.getUserId() %> </td>
                                    <td><%=u.getNombre()%></td>
                                    <td><%=u.getApellido1()%> </td>
                                    <td><%=u.getApellido2()%> </td>
                                    <td><%=u.getCorreo() %> </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>

        <!-- =========== Scripts =========  -->
        <script src="./main.js"></script>

        <!-- ====== ionicons ======= -->
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>

</html>