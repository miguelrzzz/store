const ProductCard = ({ nombre, descripcion, precioOriginal, img, marca, sku }) => {
    const shortDescription = descripcion.length > 100
        ? `${descripcion.substring(0, 100)}...`
        : descripcion;

    return (
        <div className="bg-white rounded-lg shadow-md hover:-translate-y-1 transition-transform duration-300">
            <img
                src={img}
                alt={nombre}
                className="w-full h-64 object-contain rounded-t-lg p-4"
            />
            <div className="p-4">
                <h3 className="text-xl font-semibold mb-2">{nombre}</h3>
                <p className="text-gray-600 text-sm mb-2">{marca} - {sku}</p>
                <p className="text-gray-600 mb-4">{shortDescription}</p>
                <div className="flex justify-between items-center">
                    <span className="text-xl font-bold">
                        ${precioOriginal.toLocaleString()}
                    </span>
                    <button className="bg-black text-white px-4 py-2 rounded hover:bg-gray-800">
                        Añadir
                    </button>
                </div>
            </div>
        </div>
    );
};
export default ProductCard;