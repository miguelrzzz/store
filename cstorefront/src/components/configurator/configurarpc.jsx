import React from "react";

const ConfigurarPC = () => {
    return (
        <div className="bg-gray-100 min-h-screen">
            <main className="container mx-auto py-8 px-6 grid grid-cols-12 gap-6">
                {/* Categorías */}
                <aside className="col-span-3 bg-white shadow rounded-lg p-4">
                    <h2 className="text-lg font-bold mb-4">Categorías</h2>
                    <ul className="space-y-2">
                        {[
                            "Procesador",
                            "Tarjeta Madre",
                            "Tarjeta de Video",
                            "Memoria RAM",
                            "Almacenamiento",
                            "Gabinete",
                            "Fuente de Poder",
                        ].map((categoria) => (
                            <li key={categoria}>
                                <a href="#" className="text-gray-700 hover:text-blue-500">
                                    {categoria}
                                </a>
                            </li>
                        ))}
                    </ul>
                </aside>

                {/* Productos */}
                <section className="col-span-6 bg-white shadow rounded-lg p-4">
                    <div className="flex justify-between items-center mb-4">
                        <h2 className="text-lg font-bold">Procesadores</h2>
                        <label className="flex items-center space-x-2 text-sm text-gray-700">
                            <input type="checkbox" className="form-checkbox" />
                            <span>Mostrar solo productos con stock</span>
                        </label>
                    </div>
                    <div className="grid grid-cols-2 gap-4">
                        {[
                            {
                                nombre: "Procesador AMD Ryzen 5 5500",
                                socket: "Socket AM4, 3.60GHz, Six-Core",
                                precioAntes: "$1,927.00",
                                precioActual: "$1,409.00",
                                descuento: "-26%",
                                stock: "254 pzas. disponibles",
                            },
                            {
                                nombre: "Procesador AMD Ryzen 5 5600X",
                                socket: "Socket AM4, 3.70GHz, 32MB Cache",
                                precioAntes: "$3,330.00",
                                precioActual: "$2,619.00",
                                descuento: "-21%",
                                stock: "51 pzas. disponibles",
                            },
                        ].map((producto) => (
                            <div
                                key={producto.nombre}
                                className="border border-gray-200 rounded-lg p-4"
                            >
                <span className="bg-black text-white text-xs font-bold px-2 py-1 rounded">
                  {producto.descuento}
                </span>
                                <h3 className="text-gray-800 font-semibold mt-2">
                                    {producto.nombre}
                                </h3>
                                <p className="text-sm text-gray-600">{producto.socket}</p>
                                <p className="text-gray-400 line-through">{producto.precioAntes}</p>
                                <p className="text-lg font-bold text-gray-800">
                                    {producto.precioActual}
                                </p>
                                <p className="text-sm text-gray-600">{producto.stock}</p>
                                <button className="mt-4 bg-black text-white text-sm font-semibold py-2 px-4 rounded-lg hover:bg-blue-600">
                                    Agregar
                                </button>
                            </div>
                        ))}
                    </div>
                </section>

                {/* Resumen y Ensamblaje */}
                <aside className="col-span-3 space-y-6">
                    {/* Resumen de mi PC */}
                    <div className="bg-white shadow rounded-lg p-4">
                        <h2 className="text-lg font-bold mb-4">Resumen de mi PC</h2>
                        <p className="text-sm text-gray-600 mb-4">
                            No has seleccionado ningún componente
                        </p>
                        <div className="space-y-2 text-sm text-gray-700">
                            <div className="flex justify-between">
                                <span>Subtotal</span>
                                <span>$0.00</span>
                            </div>
                            <div className="flex justify-between">
                                <span>Envío</span>
                                <span>$0.00</span>
                            </div>
                            <div className="flex justify-between font-bold text-gray-900">
                                <span>Total</span>
                                <span>$0.00</span>
                            </div>
                        </div>
                        <button className="mt-4 w-full bg-black text-white py-2 px-4 rounded-lg hover:bg-gray-800">
                            Añadir al carrito
                        </button>
                    </div>

                    {/* Servicio de ensamblaje */}
                    <div className="bg-white shadow rounded-lg p-4">
                        <h2 className="text-lg font-bold mb-4">Servicio de ensamblaje</h2>
                        <p className="text-sm text-gray-600 mb-4">
                            Despreocúpate y deja el ensamblaje de tu PC en manos de nuestro
                            equipo de expertos.
                        </p>
                        <p className="text-lg font-bold text-gray-800">
                            $1000000000000.00
                        </p>
                        <p className="text-sm text-gray-600">
                            Agrega el servicio de ensamblaje y recibe un cupón.
                        </p>
                    </div>
                </aside>
            </main>

            {/* Footer */}
            <footer className="bg-white py-4 mt-6 border-t border-gray-200">
                <div className="container mx-auto grid grid-cols-3 gap-4 text-sm">
                    <div>
                        <h3 className="font-bold text-gray-800 mb-2">Contacto</h3>
                        <p>L-D 9:00am a 6:00pm</p>
                        <p>Tel: (33) 4737 1360</p>
                        <p>Email: info@configuradorpc.mx</p>
                    </div>
                    <div>
                        <h3 className="font-bold text-gray-800 mb-2">Enlaces útiles</h3>
                        <ul className="space-y-1">
                            <li>
                                <a href="#" className="text-gray-700 hover:text-blue-500">
                                    ¿Cómo comprar?
                                </a>
                            </li>
                            <li>
                                <a href="#" className="text-gray-700 hover:text-blue-500">
                                    Garantías y devoluciones
                                </a>
                            </li>
                            <li>
                                <a href="#" className="text-gray-700 hover:text-blue-500">
                                    Preguntas frecuentes
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h3 className="font-bold text-gray-800 mb-2">Síguenos</h3>
                        <div className="flex space-x-2">
                            <a href="#" className="text-gray-700 hover:text-blue-500">
                                Facebook
                            </a>
                            <a href="#" className="text-gray-700 hover:text-blue-500">
                                Twitter
                            </a>
                            <a href="#" className="text-gray-700 hover:text-blue-500">
                                Instagram
                            </a>
                        </div>
                    </div>
                </div>
                <div className="text-center text-gray-600 mt-4">
                    © 2024 ConfiguradorPC. Todos los derechos reservados.
                </div>
            </footer>
        </div>
    );
};

export default ConfigurarPC;
