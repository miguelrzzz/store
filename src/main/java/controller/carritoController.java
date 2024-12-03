package controller;

import model.Almacen;
import model.Producto;
import model.carrito;
import model.usuarios;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class carritoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // Find product in stock
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lógica principal
            String action = request.getParameter("action");
            String productId = request.getParameter("productId");

            // Agregar logs para debug
            System.out.println("Action recibida: " + action);
            System.out.println("ProductId recibido: " + productId);

            if (productId == null || productId.trim().isEmpty()) {
                throw new IllegalArgumentException("ID de producto no válido");
            }

            HttpSession session = request.getSession(false); // Cambiado a false para no crear sesión si no existe
            if (session == null) {
                throw new SecurityException("No hay sesión activa");
            }

            usuarios user = (usuarios) session.getAttribute("loggedUser");
            if (user == null) {
                throw new SecurityException("Usuario no autenticado");
            }

            // Verificar si el carrito existe
            if (user.getCarritoPersonal() == null) {
                user.setCarritoPersonal(new carrito()); // Asumiendo que tienes un constructor vacío
            }

            Almacen tienda = new Almacen();
            tienda.setStocks(Almacen.inicializarStock());

            Producto producto = tienda.getProductoPorSku(productId);
            if (producto == null) {
                throw new IllegalArgumentException("Producto con ID " + productId + " no encontrado");
            }

            user.getCarritoPersonal().agregarProducto(producto);

            // Respuesta exitosa con más detalles
            response.setContentType("application/json");
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"message\": \"Producto agregado exitosamente\"}");

        } catch (IllegalArgumentException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Error en los parámetros: " + e.getMessage());
            e.printStackTrace(); // Para ver el error en los logs del servidor
        } catch (SecurityException e) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Error de autenticación: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error interno del servidor: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
