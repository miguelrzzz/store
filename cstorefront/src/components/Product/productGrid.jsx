import React from 'react';
import ProductCard from './productcard';
import productData from './productData.json';

const ProductGrid = ({
                         title,
                         columns = 4,
                         className = "",
                         categoria = null
                     }) => {
    const gridColumns = {
        1: 'grid-cols-1',
        2: 'grid-cols-1 md:grid-cols-2',
        3: 'grid-cols-1 md:grid-cols-2 lg:grid-cols-3',
        4: 'grid-cols-1 md:grid-cols-2 lg:grid-cols-4'
    };

    const filteredProducts = categoria
        ? productData.filter(product => product.categoria === categoria)
        : productData;

    return (
        <section className={`py-16 ${className}`}>
            <div className="container mx-auto px-4">
                {title && (
                    <h2 className="text-3xl font-bold text-center mb-8">{title}</h2>
                )}
                <div className={`grid ${gridColumns[columns]} gap-6`}>
                    {filteredProducts.map((product) => (
                        <ProductCard
                            key={product.sku}
                            nombre={product.nombre}
                            descripcion={product.descripcion}
                            precioOriginal={product.precioOriginal}
                            img={product.img}
                            marca={product.marca}
                            sku={product.sku}
                        />
                    ))}
                </div>
            </div>
        </section>
    );
};

export default ProductGrid;