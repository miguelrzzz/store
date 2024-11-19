import FeaturedProducts from "./featuredProducts";
import SubFooter from "./subFooter";
import ProductGrid from "../Product/productGrid";
import React from "react";
const HomePage = () => {
    return (
        <>
            <section className="bg-gradient-to-r from-gray-900 to-black text-white h-96 flex items-center">
                <div className="container mx-auto text-center px-4">
                    <h1 className="text-4xl md:text-5xl font-bold mb-4">Bienvenido a CompuStore</h1>
                    <p className="text-xl mb-6">Tu destino para la mejor tecnología</p>
                    <button className="bg-black text-white px-6 py-3 rounded hover:bg-gray-800 transition-colors">
                        Ver Productos
                    </button>
                </div>
            </section>
            <div>
                <FeaturedProducts/>
            </div>
            <div>
                <FeaturedProducts/>
            </div>
            <div>
                <ProductGrid title="Categorias Destacados" columns={4}/>
            </div>
            <div>
                <ProductGrid title="Lo mas vendido" columns={4}/>
            </div>
            <div>
                <SubFooter/>
            </div>
        </>
    );
};
export default HomePage;