/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Miguel
 */
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class carrito {

    private int userID;
    private Long total;
    private String usuario;
    private LocalDateTime fechaCreacion;
    private ArrayList<Producto> productos;
    private ArrayList<Producto> productosComprados;
//    private 
      private Map<Date, ArrayList<Producto>> historial = new HashMap<>();  
    
    public carrito() {
        this.productos = new ArrayList<>();
        this.fechaCreacion = LocalDateTime.now();
    }

    public carrito(int id, Long total, String usuario, ArrayList<Producto> productos) {
        this.userID = id;
        this.total = total;
        this.usuario = usuario;
        this.productos = productos != null ? productos : new ArrayList<>(); // Protección contra null
        this.fechaCreacion = LocalDateTime.now();
    }

    public void agregarProducto(Producto producto) {
        if (this.productos == null) {
            this.productos = new ArrayList<>();
        }

        // Verificar si el producto ya está en el carrito
        for (Producto p : productos) {
            if (p.getSku().equals(producto.getSku())) {
                p.setCantidadComprada(p.getCantidadComprada() + 1);
                return;
            }
        }
        productos.add(producto);
    }

    public double calcularTotal() {
        double subtotal = 0.0;
        for (Producto producto : productos) {
            subtotal += producto.getPrecioOriginal() * producto.getCantidadComprada();
        }
        return subtotal;
    }

    public Map<Date, ArrayList<Producto>> getHistorial() {
        return historial;
    }

    public void setHistorial(Map<Date, ArrayList<Producto>> historial) {
        this.historial = historial;
    }

    public void vaciarCarrito() {
        productos.clear();
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Long getTotal() {
        return total;
    }

    public ArrayList<Producto> getProductosComprados() {
        return productosComprados;
    }

    public void setProductosComprados(ArrayList<Producto> productosComprados) {
        this.productosComprados = productosComprados;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public LocalDateTime getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDateTime fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public ArrayList<Producto> getProductos() {
        return productos;
    }

    public void setProductos(ArrayList<Producto> productos) {
        this.productos = productos;
    }

    public int getCantidadArticulos() {
        int total = 0;
        for (Producto p : productos) {
            total += p.getCantidadComprada();
        }
        total += productos.size();

        return total;
    }
}
