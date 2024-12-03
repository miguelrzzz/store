/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.util.ArrayList;
/**
 *
 * @author Miguel
 */
public class Producto {
    private String nombre;
    private String descripcion;
    private String img;
    private double precioOriginal;
    private String categoria;
    private String sku;
    private String marca;
    private int cantidadDisponible;
    private int cantidadComprada;
    
   // Constructores
    public Producto() {}
    
    public Producto(String nombre, String descripcion, String img, double precioOriginal, String marca, String sku) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.img = img;
        this.precioOriginal = precioOriginal;
        this.marca = marca;
        this.sku = sku;
    }


    // Getters y setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrecioOriginal() {
        return precioOriginal;
    }

    public void setPrecioOriginal(double precioOriginal) {
        this.precioOriginal = precioOriginal;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getCantidadDisponible() {
        return cantidadDisponible;
    }

    public void setCantidadDisponible(int cantidadDisponible) {
        this.cantidadDisponible = cantidadDisponible;
    }

    public int getCantidadComprada() {
        return cantidadComprada;
    }

    public void setCantidadComprada(int cantidadComprada) {
        this.cantidadComprada = cantidadComprada;
    }
    
    

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }
      static public ArrayList<Producto> inicialiarProcesadores() {
        ArrayList<Producto> procesadores = new ArrayList<Producto>();
        procesadores.add(new Producto("AMD Ryzen 5 5500",
                "Procesador de seis núcleos con gran rendimiento para gaming y trabajo",
                "18BbayFhrGRJBTUWoquuw1Na8wAer0wKG",
                1409,
                "AMD",
                "RYZEN5-5500"
        ));
        procesadores.add(new Producto("AMD Ryzen 5 5600X",
                "Procesador optimizado para gaming de alto rendimiento.",
                "18BbayFhrGRJBTUWoquuw1Na8wAer0wKG",
                2619,
                "AMD",
                "RYZEN5-5600X"
        ));

        procesadores.add(new Producto("AMD Ryzen 7 5800X",
                "Procesador de 8 núcleos y 16 hilos, ideal para gaming y creación de contenido.",
                "1gmuZP1Bvl7g6zsNllhYat1qMNdWPEK8Z",
                4399,
                "AMD",
                "RYZEN7-5800X"
        ));

        procesadores.add(new Producto("AMD Ryzen 9 5900X",
                "Procesador de 12 núcleos para multitarea avanzada y alto rendimiento en gaming.",
                "1KEK7VTS6Ok_QXEDwBBu7eE29g6aFVwkN",
                7499,
                "AMD",
                "RYZEN7-5900X"
        ));

        procesadores.add(new Producto("Intel Core i5-13600K",
                "Procesador de 14 núcleos con un excelente rendimiento para gaming y productividad.",
                "1fwBaVO36HWTL8uB6_Ox0GsREQWSalW2M",
                4299,
                "Intel",
                "RYZEN7-5900X"
        ));

        procesadores.add(new Producto("Intel Core i5-13600K",
                "Procesador de 14 núcleos con un excelente rendimiento para gaming y productividad.",
                "1fwBaVO36HWTL8uB6_Ox0GsREQWSalW2M",
                4299,
                "Intel",
                "RYZEN7-5900X"
        ));

        procesadores.add(new Producto("Intel Core i7-13700K",
                "Procesador de 16 núcleos para alto rendimiento en tareas exigentes y gaming.",
                "14YDZUQExT4yGWZhA8IbFZVLwykY4BmSy",
                7199,
                "Intel",
                "I7-13700K"
        ));

        procesadores.add(new Producto("Intel Core i9-13900K",
                "Procesador de 24 núcleos, ideal para gaming extremo y trabajo creativo.",
                "1iezGQakjkaU7-qaWhjXOpZ992dUWOF8y",
                13999,
                "Intel",
                "I9-13900K"
        ));

        procesadores.add(new Producto("AMD Ryzen 7 7700X",
                "Procesador de 8 núcleos y 16 hilos, excelente para videojuegos y software profesional..",
                "1U-GYREPepRuCqqmCnqsoSY0dnYXiq4hk",
                5899,
                "AMD",
                "RYZEN7-7700X"
        ));

        procesadores.add(new Producto("AMD Ryzen Threadripper 3970X",
                "Procesador de 32 núcleos para estaciones de trabajo de alto rendimiento.",
                "1tCBjIsrWVhA5RinLUxvHs1T_sfKGzpHj",
                24999,
                "AMD",
                "THREADRIPPER-3970X"
        ));

        procesadores.add(new Producto("Intel Xeon W-2295",
                "Procesador de 18 núcleos diseñado para estaciones de trabajo y entornos profesionales.",
                "1jWi30qTqVA8Mpj3maZ5iDxadb3xR1Gh8",
                23999,
                "intel",
                "XEON-W2295"
        ));
        return procesadores;
    }

    static public ArrayList<Producto> inicialiarTarjetasGraficas() {
        ArrayList<Producto> tarjetasGraficas = new ArrayList<Producto>();

        tarjetasGraficas.add(new Producto("NVIDIA GeForce RTX 3060 Ti",
                "Tarjeta gráfica con trazado de rayos y DLSS para gaming en alta resolución.",
                "1kWG3SmuOrCHoNbaCAv3qOMagEVUZ3UE6",
                7999,
                "NVIDIA",
                "RTX-3060TI"
        ));
        tarjetasGraficas.add(new Producto("NVIDIA GeForce RTX 4090",
                "La GPU más avanzada de NVIDIA para creadores y gamers entusiastas.",
                "119278Ystc8WRQDSh0sG8Ka8pEOmqK8Ox",
                4299,
                "NVIDIA",
                "RTX-4090"
        ));

        tarjetasGraficas.add(new Producto("AMD Radeon RX 6700 XT",
                "Tarjeta gráfica para gaming de alto rendimiento con 12 GB de memoria.",
                "1wD9hXQCwuxbiLdjOL1IFQiB5-WhrIAQ5",
                7299,
                "AMD",
                "RX-6700XT"
        ));
        tarjetasGraficas.add(new Producto("AMD Radeon RX 7900 XT",
                "Tarjeta gráfica con trazado de rayos y excelente rendimiento para 4K.",
                "1AGeZy2KKLgPeNEeG5U_0McRoDHItmMoW",
                19999,
                "AMD",
                "RX-7900XTX"
        ));

        tarjetasGraficas.add(new Producto("ASUS Rog Strix RTX 3070",
                "Versión premium de la RTX 3070 con diseño ASUS ROG y refrigeración avanzada.",
                "19Ejd_g-Ip9UqpJ_S30AWFexWIOAq5ZjO",
                15999,
                "NVIDIA",
                "RTX-4090"
        ));

        tarjetasGraficas.add(new Producto("Gigabyte AORUS Radeon RX 6800 XT",
                "GPU de alta gama de Gigabyte con refrigeración avanzada y rendimiento en 4K.",
                "1q66UsKjsa8vmna_y06qCVg3vD_XjNZPI",
                15999,
                "Gigabyte",
                "AORUS-6800XT"
        ));

        tarjetasGraficas.add(new Producto("EVGA GeForce RTX 3070 FTW3 Ultra",
                "La GPU más avanzada de NVIDIA para creadores y gamers entusiastas.",
                "1A4w4ppgBSLh4SQGJ6yuypvLoD6DiDkUQ",
                14999,
                "EVGA",
                "EVGA-3070FTW3"
        ));

        tarjetasGraficas.add(new Producto("NVIDIA GeForce RTX 4090",
                "La GPU más avanzada de NVIDIA para creadores y gamers entusiastas.",
                "1A4w4ppgBSLh4SQGJ6yuypvLoD6DiDkUQ",
                14999,
                "EVGA",
                "EVGA-3070FTW3"
        ));

        return tarjetasGraficas;
    }

    static public ArrayList<Producto> inicializarMouse() {
        ArrayList<Producto> mouse = new ArrayList<Producto>();
        mouse.add(new Producto("PEBBLE Mouse 2 M350S",
                "Mouse Bluetooth® delgado y compacto con un botón personalizable.",
                "1bXFEyucuFGpiw-_JDKRNbDLE5euNJ0N1",
                639,
                "Logitech",
                "LOGN-M350S"
        ));

        mouse.add(new Producto("MX ANYWHERE 3",
                "Mouse Bluetooth® delgado y compacto con un botón personalizable.",
                "1bXFEyucuFGpiw-_JDKRNbDLE5euNJ0N1",
                639,
                "Logitech",
                "LOGN-M350S"
        ));
        mouse.add(new Producto("Logitech G502",
                "Mouse Gaming Inalámbrico, HERO 25K, 25,600 DPI, RGB, Peso Reducido, 11 Botones Programables, Batería Larga Duración",
                "1VYb5snLx1IHc0Zli_rpQOQQOJDTbNPPI",
                2199,
                "Logitech",
                "LOGN-G502"
        ));

        mouse.add(new Producto("Asus ROG Gladius III",
                "Mouse asimétrico con 26,000 DPI, Push-Fit Switch Socket II exclusivo, estética ROG grabada con láser",
                "1DoHgZF-ADWGcL0CdlnwowWFVOrQ10rlh",
                1589,
                "ASUS",
                "ASUS-GLADIUSIII"
        ));
        mouse.add(new Producto("PEBBLE Mouse 2 M350S",
                "Mouse Bluetooth® delgado y compacto con un botón personalizable.",
                "1bXFEyucuFGpiw-_JDKRNbDLE5euNJ0N1",
                639,
                "Logitech",
                "LOGN-M350S"
        ));
        mouse.add(new Producto("PEBBLE Mouse 2 M350S",
                "Mouse Bluetooth® delgado y compacto con un botón personalizable.",
                "1bXFEyucuFGpiw-_JDKRNbDLE5euNJ0N1",
                639,
                "Logitech",
                "LOGN-M350S"
        ));
        mouse.add(new Producto("PEBBLE Mouse 2 M350S",
                "Mouse Bluetooth® delgado y compacto con un botón personalizable.",
                "1bXFEyucuFGpiw-_JDKRNbDLE5euNJ0N1",
                639,
                "Logitech",
                "LOGN-M350S"
        ));
        mouse.add(new Producto("PEBBLE Mouse 2 M350S",
                "Mouse Bluetooth® delgado y compacto con un botón personalizable.",
                "1bXFEyucuFGpiw-_JDKRNbDLE5euNJ0N1",
                639,
                "Logitech",
                "LOGN-M350S"
        ));
        mouse.add(new Producto("PEBBLE Mouse 2 M350S",
                "Mouse Bluetooth® delgado y compacto con un botón personalizable.",
                "1bXFEyucuFGpiw-_JDKRNbDLE5euNJ0N1",
                639,
                "Logitech",
                "LOGN-M350S"
        ));
        mouse.add(new Producto("PEBBLE Mouse 2 M350S",
                "Mouse Bluetooth® delgado y compacto con un botón personalizable.",
                "1bXFEyucuFGpiw-_JDKRNbDLE5euNJ0N1",
                639,
                "Logitech",
                "LOGN-M350S"
        ));
        mouse.add(new Producto("PEBBLE Mouse 2 M350S",
                "Mouse Bluetooth® delgado y compacto con un botón personalizable.",
                "1bXFEyucuFGpiw-_JDKRNbDLE5euNJ0N1",
                639,
                "Logitech",
                "LOGN-M350S"
        ));
        return mouse;
    }

    static public ArrayList<Producto> inicialiazarLaptops() {
        ArrayList<Producto> laptops = new ArrayList<Producto>();
//        DELL
        laptops.add(new Producto("Dell Inspiron 3520",
                "Portátil FHD con visualización táctil de 15,6\" - Intel Core i5-1155G7, 8GB de RAM, 256GB SSD, Modo Windows 11 S - Negro Carbono (i3520-5810BLK-PUS)",
                "1yubSxbXgXEfhRCP5lxBstF2UzfCzSV3m",
                9426,
                "DELL",
                "DELL-Inspirion3520"
        ));
        laptops.add(new Producto("Dell Inspiron 3523",
                "Portátil FHD con visualización táctil de 15.6\" Full HD, AMD Ryzen 5 7520U 2.80GHz, 8GB, 512GB SSD, Windows 11 Home 64-bit, Español, Plata",
                "1vYy4bPN4OBfT9PeGWYzpApoBefQ1Xtnf",
                6900,
                "DELL",
                "DELL-Inspirion3523"
        ));
        laptops.add(new Producto("Dell Inspiron 3511",
                "Laptop con pantalla táctil Full HD de 15.6 pulgadas, Intel Core i5-1135G7, RAM DDR4 32 GB, SSD PCIe de 1 TB, lector de tarjetas SD, HDMI, Wi-Fi, Windows 11 Home, negro",
                "1lFXOGeMnVtYpNE2-NY66bi1w3ynYV4sm",
                8900,
                "DELL",
                "DELL-Inspirion3511"
        ));

        laptops.add(new Producto("Dell G5525",
                "Laptop Gaming G5525 15.6\" FHD, NVIDIA® GeForce RTX™ 3060 AMD Ryzen 9, 16GB RAM, 1TB SSD, Win11, Gris",
                "10p4Gmr1Ebfi7JHfb-m6WTB2GX7Drps4q",
                23890,
                "DELL",
                "DELL-G5525"
        ));

        laptops.add(new Producto("Dell G16",
                " Laptop para juegos, visualización QHD de 16 pulgadas, Intel Core i9-13900HX, 64 GB DDR5 RAM, 2 TB NVMe SSD, NVIDIA GeForce RTX 4070",
                "1Ts5uutNzWkk5QgVBSfSwtJi2s1j3UVNt",
                35890,
                "DELL",
                "DELL-G16"
        ));

        laptops.add(new Producto("Dell Latitude 7410",
                "Ordenador Portátil 14 Pulgadas Full HD, Intel Core i7-10610U, 8 GB RAM DDR4, 512 GB SSD, Windows 10 Pro",
                "1qPEWn7FHqdWU8hzzlMQz-UBCFpC0PVLi",
                6200,
                "DELL",
                "DELL-Latitude7410"
        ));
        laptops.add(new Producto("Dell G15",
                "Portátil para juegos, Intel Core i7-13650HX, 16 GB DDR5 RAM, 1 TB PCIe SSD, visualización FullHD de 15.6 pulgadas, RTX 4060, teclado retroiluminado, Windows 11 Home, gris oscuro",
                "1UUGURQ3ZWLlCQwPKhT9F5cAHXNgw0Sdc",
                29100,
                "DELL",
                "DELL-G15"
        ));
        laptops.add(new Producto("Dell Latitude 5310 2 in 1",
                "Laptop con visualización táctil i7 10th, 13.3\" FHD (1920 x 1080) portátil con teclado retroiluminado, Quad Core i7-10610U 4.9GHz, 16 GB de RAM, 512 GB SSD, Win10 Pro",
                "13Wpp0vWA680Il2bkStN-xtDiYVfBGxEY",
                7750,
                "DELL",
                "DELL-Latitude5310"
        ));

        return laptops;
    }

    static public ArrayList<Producto> inicializarMonitores() {
        //DELL
        ArrayList<Producto> monitores = new ArrayList<Producto>();
        monitores.add(new Producto("Dell 23,8'' Monitor P2425H",
                "Pantalla con resolución de 1920 x 1080 y un tamaño diagonal de 60.5 cm (23.8\").",
                "1zoDaNYjcDHoIDuL31vpbHYpwjYZAaalU",
                3400,
                "DELL",
                "DELL-P2425H"
        ));
        monitores.add(new Producto("Dell 24'' Monitor P2423D",
                "Pantalla con resolución de 2560 x 1440 a 60Hz , QHD HDMI DP USB .",
                "14Cv2IrQI886s02hFVnBSLRyGbyct0bYA",
                5400,
                "DELL",
                "DELL-P2423D"
        ));

        monitores.add(new Producto("Dell Monitor 32\" S3222DGM",
                "Monitor Gaming Curvo QHD HDMI DP 165Hz FreeSync Premium",
                "1ct7CTcT0rYK-EpHYgL9WttsTNwneT5Ae",
                8460,
                "DELL",
                "DELL-S3222DGM"
        ));

        monitores.add(new Producto("Dell Monitor 34\" S3422WG",
                "Monitor Gaming Curvo 34\" WQHD HDMI DP USB 144Hz FreeSync Premium Pro",
                "1hG6crFayPPsJqdrISyxHSnXJ7aewzuIZ",
                10774,
                "DELL",
                "DELL-S3422WG"
        ));

        monitores.add(new Producto("Dell Monitor 27\"  S2722DGM",
                "Monitor Curvado para Juegos de 27'' Curvado con frecuencia de actualización de 165 Hz, visualización QHD (2560 x 1440), Color Negro",
                "1m2g_q5glRaOZkGya27AkuyAmL9CLd5pG",
                6300,
                "DELL",
                "DELL-S2722DGM"
        ));

        monitores.add(new Producto("Dell Monitor 27\"  S2716DG",
                "Monitor LED de 27\",2560 x 1440 a 60 Hz  Borde Delgado, VGA, HDM , movimiento giratorio                                                      ",
                "1x3EYiMaO-w5iElwCLSYveGO6RKtdXZL6",
                6300,
                "DELL",
                "DELL-S2716DG"
        ));
        monitores.add(new Producto("Dell Monitor 27\"  SE2717H",
                "Monitor LED de 27\",1920 x 1080 at 60Hz, Base Ajustable, VGA, HDMI1.4                                                   ",
                "1dBUxmwlRsfiZV6Ru1cikk7cQ20s1zxTX",
                5400,
                "DELL",
                "DELL-SE2717H"
        ));

        return monitores;
    }
  


}
