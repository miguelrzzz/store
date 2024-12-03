package controller;
import model.Producto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/productos")
public class productoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String jsonPath = getServletContext().getRealPath("./src/json/procesadores.json");
        Producto item = new Producto();
        
        List<Producto> productosDestacados = new ArrayList<>();
        
        // Cargar productos destacados

        request.setAttribute("productosDestacados", productosDestacados);
        request.getRequestDispatcher("/productos-destacados.jsp").forward(request, response);
    }
}