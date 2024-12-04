package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.usuarios;
import java.util.Date;
import javax.servlet.http.HttpSession;
import model.carrito;

public class userController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        usuarios temporal = new usuarios("User Temp",true);
        
        temporal.setCarritoPersonal(new carrito());
        HttpSession session = request.getSession();
        session.setAttribute("userTemp", temporal);

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "delete":
                    manejoDelete(request, response);
                    break;
                case "update":
                    manejoActualizar(request, response);
                    break;
                case "logout":
                    manejoLogout(request, response);
                    break;

                default:
                    manejoLogin(request, response);
                    break;
            }
        } else {
            manejoLogin(request, response);
        }
        response.sendRedirect("index.jsp");
    }

    private void manejoDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect("login.jsp"); // Redirigir a login si no hay sesión
            return;
        }

        String userId = request.getParameter("userId");
        if (userId != null && !userId.isEmpty()) {
            int id = Integer.parseInt(userId);
            if (usuarios.buscarPorId(id)) {
                usuarios.EliminarUserByID(id);
                request.setAttribute("message", "Usuario eliminado exitosamente!");
            } else {
                request.setAttribute("message", "Usuario no encontrado!");
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher("removeUser.jsp");
        rd.forward(request, response);
    }

    private void manejoActualizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");

        if (userIdStr != null && !userIdStr.isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdStr);
                if (usuarios.buscarPorId(userId)) {
                    usuarios updatedUser = new usuarios();
                    updatedUser.setUserId(userId);
                    updatedUser.setNombre(request.getParameter("nombre"));
                    updatedUser.setCorreo(request.getParameter("correo"));
                    updatedUser.setPwd(request.getParameter("pwd"));

                    String fechaNacStr = request.getParameter("fecha_nac");
                    if (fechaNacStr != null && !fechaNacStr.isEmpty()) {
                        Date fechaNac = usuarios.formateoFecha(fechaNacStr);
                        updatedUser.setFecha_nac(fechaNac);
                    }

                    updatedUser.setVigente(true);

                    usuarios.ActualizaUser(updatedUser, userId);
                    request.setAttribute("message", "usuario actualizado!");
                } else {
                    request.setAttribute("message", "Usaruio no encontrado!");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "formato de ID invalido!");
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher("actualizarUsuario.jsp");
        rd.forward(request, response);
    }

    private void manejoLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("loginEmail");
        String pwd = request.getParameter("loginPwd");
        usuarios cuenta = usuarios.consultaxEmail(usuario);

        if (cuenta != null && cuenta.getPwd().equals(pwd)) {
            // Guardar el usuario en la sesión
            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", cuenta);

            // Redirigir al index
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else {
            // Manejar error de login
            request.setAttribute("error", "Credenciales inválidas. Intente de nuevo.");
            RequestDispatcher rd = request.getRequestDispatcher("/Pages/auth/login.jsp");
            rd.forward(request, response);
        }
    }

    private void manejoLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("/Pages/auth/login.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
