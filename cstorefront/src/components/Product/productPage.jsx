import React from 'react';
import {useState} from "react";
import ProductGrid from './productGrid';

const ProductsPage = () => {
    const [filters, setFilters] = useState({
        searchTerm: '',
        minPrice: 0,
        maxPrice: 2000,
        marca: '',
        categoria: ''
    });

    const marcas = ["LOGITECH", "RAZER", "CORSAIR"];
    const categorias = ["mouse", "teclado", "audifonos"];

    const handleSearchChange = (e) => {
        setFilters(prev => ({
            ...prev,
            searchTerm: e.target.value
        }));
    };

    const handlePriceChange = (e) => {
        setFilters(prev => ({
            ...prev,
            maxPrice: e.target.value
        }));
    };

    const handleBrandChange = (e) => {
        setFilters(prev => ({
            ...prev,
            marca: e.target.value
        }));
    };

    const handleCategoryChange = (e) => {
        setFilters(prev => ({
            ...prev,
            categoria: e.target.value
        }));
    };

    return (
        <div className="min-h-screen bg-gray-50">
            {/* Header */}
            <header className="bg-white shadow-sm">
                <div className="container mx-auto px-4 py-6">
                    <h1 className="text-3xl font-bold text-gray-900">Nuestros Productos</h1>
                </div>
            </header>

            {/* Main Content */}
            <main className="container mx-auto px-4 py-8">
                <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                    {/* Barra lateral de filtros para compra usando aside de html*/}
                    <aside className="space-y-6 bg-white p-6 rounded-lg shadow-sm">
                        <div className="space-y-4">
                            <h2 className="text-xl font-semibold">Filtros</h2>

                            {/* busacdor */}
                            <div className="space-y-2">
                                <label htmlFor="search" className="block text-sm font-medium text-gray-700">
                                    Buscar
                                </label>
                                <input
                                    type="text"
                                    id="search"
                                    className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-black-500 "
                                    placeholder="Buscar productos..."
                                    value={filters.searchTerm}
                                    onChange={handleSearchChange}
                                />
                            </div>

                            {/* Rango de precios  */}
                            <div className="space-y-2">
                                <label htmlFor="price" className="block text-sm  font-medium text-gray-700 ">
                                    Precio máximo: ${filters.maxPrice}
                                </label>
                                <input
                                    type="range"
                                    id="price"
                                    min="0"
                                    max="2000"
                                    step="100"
                                    className="w-full bg-auto bg-black"
                                    value={filters.maxPrice}
                                    onChange={handlePriceChange}
                                />
                            </div>

                            {/* Brand */}
                            <div className="space-y-2">
                                <label htmlFor="marca" className="block text-sm font-medium text-gray-700">
                                    Marca
                                </label>
                                <select
                                    id="marca"
                                    className="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-black"
                                    value={filters.marca}
                                    onChange={handleBrandChange}
                                >
                                    <option value="">Todas</option>
                                    {marcas.map(marca => (
                                        <option key={marca} value={marca}>
                                            {marca}
                                        </option>
                                    ))}
                                </select>
                            </div>

                            {/* Category */}
                            <div className="space-y-2">
                                <label htmlFor="categoria" className="block text-sm font-medium text-gray-700">
                                    Categoría
                                </label>
                                <select
                                    id="categoria"
                                    className="w-full px-3 py-2 border hover:color border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-black"
                                    value={filters.categoria}
                                    onChange={handleCategoryChange}
                                >
                                    <option value="">Todas</option>
                                    {categorias.map(categoria => (
                                        <option key={categoria} value={categoria}>
                                            {categoria.charAt(0).toUpperCase() + categoria.slice(1)}
                                        </option>
                                    ))}
                                </select>
                            </div>
                        </div>
                    </aside>

                    {/* Products Grid */}
                    <div className="md:col-span-3">
                        <ProductGrid
                            title=""
                            columns={3}
                            categoria={filters.categoria}
                            searchTerm={filters.searchTerm}
                            maxPrice={filters.maxPrice}
                            marca={filters.marca}
                            className="p-0"
                        />
                    </div>
                </div>
            </main>
        </div>
    );
};

export default ProductsPage;