import React, { useState, useEffect } from "react";
import productosJSON from "../Product/productos.json";
import ProductCard from "../Product/productcard"; //

const ConfigurarPC = () => {
    const [categoriaActiva, setCategoriaActiva] = useState(null); // Categoría activa
    const [marcaSeleccionada, setMarcaSeleccionada] = useState(""); // Marca seleccionada
    const [productos, setProductos] = useState([]); // Productos a mostrar
    const [marcas, setMarcas] = useState([]); // Marcas dinámicas

    const categorias = [
        { nombre: "Procesadores", key: "procesador" },
        { nombre: "Tarjetas Madre", key: "tarjetamadre" },
        { nombre: "Disipador", key: "disipador" },
        { nombre: "Ram", key: "memoriaram" },
        { nombre: "Tarjeta grafica", key: "tarjetagrafica" },
    ];

    useEffect(() => {
        // Cuando se selecciona una categoría, actualiza las marcas y productos
        if (categoriaActiva) {
            const productosDeCategoria = productosJSON[categoriaActiva] || [];
            setProductos(productosDeCategoria);
            const marcasDisponibles = [
                ...new Set(productosDeCategoria.map((producto) => producto.marca))
            ];
            setMarcas(marcasDisponibles);
            setMarcaSeleccionada(""); // Resetear la marca seleccionada
        } else {
            setProductos([]);
            setMarcas([]);
        }
    }, [categoriaActiva]);

    useEffect(() => {
        // Filtrar productos por marca seleccionada
        if (marcaSeleccionada) {
            const productosDeCategoria = productosJSON[categoriaActiva] || [];
            const productosFiltrados = productosDeCategoria.filter(
                (producto) => producto.marca === marcaSeleccionada
            );
            setProductos(productosFiltrados);
        } else if (categoriaActiva) {
            setProductos(productosJSON[categoriaActiva] || []);
        }
    }, [marcaSeleccionada, categoriaActiva]);

    return (
        <div className="bg-gray-100 min-h-screen">
            <main className="container mx-auto py-8 px-6 grid grid-cols-12 gap-6">
                {/* Sidebar de Categorías */}
                <aside className="col-span-3 bg-white shadow rounded-lg p-4">
                    <h2 className="text-lg font-bold mb-4">Categorías</h2>
                    <ul className="space-y-2">
                        {categorias.map((categoria) => (
                            <li key={categoria.key}>
                                <button
                                    className={`text-gray-700 hover:text-blue-500 block ${
                                        categoriaActiva === categoria.key
                                            ? "font-bold text-blue-500"
                                            : ""
                                    }`}
                                    onClick={() => setCategoriaActiva(categoria.key)}
                                >
                                    {categoria.nombre}
                                </button>
                            </li>
                        ))}
                    </ul>
                </aside>

                {/* Productos */}
                <section className="col-span-9 bg-white shadow rounded-lg p-4">
                    <h2 className="text-lg font-bold mb-4">
                        {categoriaActiva
                            ? `Productos en ${categorias.find(
                                (cat) => cat.key === categoriaActiva
                            )?.nombre}`
                            : "Selecciona una categoría"}
                    </h2>

                    {/* Filtro de Marca */}
                    {marcas.length > 0 && (
                        <div className="mb-4">
                            <label htmlFor="marca" className="block text-sm font-medium text-gray-700">
                                Filtrar por marca:
                            </label>
                            <select
                                id="marca"
                                value={marcaSeleccionada}
                                onChange={(e) => setMarcaSeleccionada(e.target.value)}
                                className="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                            >
                                <option value="">Todas las marcas</option>
                                {marcas.map((marca) => (
                                    <option key={marca} value={marca}>
                                        {marca}
                                    </option>
                                ))}
                            </select>
                        </div>
                    )}

                    {/* Lista de Productos */}
                    <div className="grid grid-cols-2 gap-4">
                        {productos.length > 0 ? (
                            productos.map((producto) => (
                                <ProductCard key={producto.sku} {...producto} />
                            ))
                        ) : (
                            <p className="text-gray-600">
                                {categoriaActiva
                                    ? "No hay productos disponibles para esta categoría o marca."
                                    : "Por favor, selecciona una categoría."}
                            </p>
                        )}
                    </div>
                </section>
            </main>
        </div>
    );
};

export default ConfigurarPC;
