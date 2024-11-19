import React from 'react';
import ProductGrid from '../Product/productGrid';

const FeaturedProducts = () => {
    return (
        <ProductGrid
            title="Productos Destacados"
            columns={4}
        />
    );
};

export default FeaturedProducts;