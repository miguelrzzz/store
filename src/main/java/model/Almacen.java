/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Miguel
 */
public class Almacen {

//    private ArrayList<Producto> stock;
//    Nueva forma
    private Map<String, ArrayList<Producto>> stocks = new HashMap<>();
    private String categoria;
    private long valorTotal;

    public Almacen() {
    }

    public Almacen(String nombre, Map<String, ArrayList<Producto>> tienda){
        this.categoria = nombre;
        this.stocks = tienda;
    }
    public Almacen(String categoria) {
        this.categoria = categoria;
    }
//     String nombre, String descripcion, String img, double precioOriginal, img  

    static public Map<String, ArrayList<Producto>> inicializarStock() {
        Map<String, ArrayList<Producto>> tienda = new HashMap<>();
        tienda.put("procesadores", Producto.inicialiarProcesadores());
        tienda.put("tarjetasGraficas", Producto.inicialiarTarjetasGraficas());
        tienda.put("mouses", Producto.inicializarMouse());
        tienda.put("laptops", Producto.inicialiazarLaptops());
        tienda.put("monitores", Producto.inicializarMonitores());
        for (Map.Entry<String, ArrayList<Producto>> entrada : tienda.entrySet()) {
            ArrayList<Producto> productos = entrada.getValue();
            for (Producto p : productos) {
                p.setCantidadDisponible(50);
            }
        }
        return tienda;
    }


    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public long getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(long valorTotal) {
        this.valorTotal = valorTotal;
    }

    public Map<String, ArrayList<Producto>> getStocks() {
        return stocks;
    }

    public void setStocks(Map<String, ArrayList<Producto>> stocks) {
        this.stocks = stocks;
    }

    public Producto getProductoPorSku(String sku) {
        for (Map.Entry<String, ArrayList<Producto>> entry : this.getStocks().entrySet()) {
            ArrayList<Producto> productos = entry.getValue();
            for (Producto p : productos) {
                if (p.getSku().equals(sku)) {
                    return p;
                }
            }
        }
        return null;
    }
}
