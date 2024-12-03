/**
 *
 * @author Miguel
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package model;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Miguel
 */
public class usuarios implements Serializable {
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //  Datos personales
    private String user;
    private int userId;
    private String pwd;
    private String nombre;
    private String apellido1;
    private String apellido2;
    private String correo;
    private String correo2;
    private String genero;
    private Date fecha_nac;
    private Long numero_celular;

    //  Informacion adicional
    private String fotoPerfil;
    private boolean vigente;
    static private int contadorID = 0;
    
    private carrito CarritoPersonal;
    private ArrayList<Cuenta> tarjetasAgregadas;
    
    
    //  Extra
    private static ArrayList<usuarios> listaUsuarios = null;
   
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
    public usuarios(int userId, String pwd, String nombre, String correo, boolean vigente, Date fecha_nac) {
        this.userId = userId;
        this.pwd = pwd; // Asigna el valor de pwd
        this.nombre = nombre;
        this.correo = correo;
        this.vigente = vigente;
        this.fecha_nac = fecha_nac;
    }

    public String getCorreo2() {
        return correo2;
    }

    public void setCorreo2(String correo2) {
        this.correo2 = correo2;
    }

    public Long getNumero_celular() {
        return numero_celular;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public static int getContadorID() {
        return contadorID;
    }

    public static void setContadorID(int contadorID) {
        usuarios.contadorID = contadorID;
    }

    public carrito getCarritoPersonal() {
        return CarritoPersonal;
    }

    public void setCarritoPersonal(carrito CarritoPersonal) {
        this.CarritoPersonal = CarritoPersonal;
    }
    
    
    
    public void setNumero_celular(Long numero_celular) {
        this.numero_celular = numero_celular;
    }

    public usuarios() {
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFotoPerfil() {
        return fotoPerfil;
    }

    public void setFotoPerfil(String fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public boolean isVigente() {
        return vigente;
    }

    public void setVigente(boolean vigente) {
        this.vigente = vigente;
    }

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    private static ArrayList<usuarios> getListaUsuarios() {
        if (listaUsuarios == null) {
            listaUsuarios = inicializarUsuarios();
        }
        return listaUsuarios;
    }

    public ArrayList<usuarios> agregaUsuario(usuarios neew) {
        ArrayList<usuarios> listaUsuarios = inicializarUsuarios();
        listaUsuarios.add(neew);
        return listaUsuarios;
    }

    static public ArrayList<usuarios> ActualizaDatos(usuarios act, int id) {
        ArrayList<usuarios> lista = inicializarUsuarios();
        for (usuarios user : lista) {
            if (act.getUserId() == id) {
                int index = lista.indexOf(act);
                lista.set(index, act);
                return lista;
            }
        }
        return lista;
    }

    static public ArrayList<usuarios> EliminarDatos(String correo) {
        ArrayList<usuarios> lista = inicializarUsuarios();
        for (usuarios user : lista) {
            if (user.getCorreo().equals(correo)) {
                int index = lista.indexOf(user);
                lista.remove(index);
                return lista;
            }
        }
        return lista;
    }

    public static ArrayList<usuarios> inicializarUsuarios() {
        ArrayList<usuarios> listado = new ArrayList<>();
        listado.add(new usuarios(contadorID++,"uuu","Miguel", "miguel.ramirez83@uabc.edu.mx", true,formateoFecha("18/09/2004")));
        listado.add(new usuarios(contadorID++,"123","Angel", "angel.ramirez83@gmail.com", true,formateoFecha("18/09/2004")));
        listado.add(new usuarios(contadorID++,"001","Goyito", "goyito@gmail.com", true,formateoFecha("07/12/1989")));
        listado.add(new usuarios(contadorID++,"admin","admin", "admin@gmail.com", true,formateoFecha("18/09/2004")));        
        return listado;
    }

    public boolean validarUsuario2(String u, String p) {
        ArrayList<usuarios> lista = getListaUsuarios();
        for (usuarios user : lista) {
            if (user.getCorreo().equals(u) && user.getPwd().equals(p)) {
                return true;
            }
        }
        return false;
    }

    static public ArrayList<usuarios> EliminarUserByID(int id) {
        ArrayList<usuarios> lista = getListaUsuarios();
        lista.removeIf(user -> user.getUserId() == id);
        return lista;
    }

    static public ArrayList<usuarios> ActualizaUser(usuarios act, int id) {
        ArrayList<usuarios> lista = getListaUsuarios();
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getUserId() == id) {
                lista.set(i, act);
                break;
            }
        }
        return lista;
    }

    //       Metodos para validacion
    public boolean validarUsuario(String login, String password) {
        return login.equals("admin") && password.equals("admin");
    }

    public boolean validadUsuario2(String u, String p) {
        ArrayList<usuarios> listaUsuarios = inicializarUsuarios();
        for (usuarios user : listaUsuarios) {
            if (user.getCorreo().equals(u) && user.getPwd().equals(p)) {
                return true;
            }
        }
        return false;
    }

    //    Metodos de busqueda
    static public ArrayList<usuarios> consulta() {
        return getListaUsuarios();
    }

    static public boolean buscarPorId(int id) {
        ArrayList<usuarios> lista = getListaUsuarios();
        return lista.stream().anyMatch(user -> user.getUserId() == id);
    }

    public static usuarios consultaxId(int id) {
        ArrayList<usuarios> lista = inicializarUsuarios();
        for (usuarios u : lista) {
            if (u.getUserId() == id) {
                return u;
            }
        }
        return null;
    }

    public static usuarios consultaxEmail(String email) {
        ArrayList<usuarios> lista = inicializarUsuarios();
        for (usuarios u : lista) {
            if (u.getCorreo().equals(email)) {
                return u;
            }
        }
        return null;
    }

    // Metodos auxiliares
    public static Date formateoFecha(String date) {
        try {
            return new SimpleDateFormat("dd/MM/yyyy").parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
