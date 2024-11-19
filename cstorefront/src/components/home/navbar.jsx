import React, { useState } from 'react';
import { ShoppingCart, User } from 'lucide-react';
import {Link} from 'react-router-dom';
const Navbar = () => {
    return (
        <nav className="bg-black text-white py-4">
            <div className="container mx-auto px-4">
                <div className="flex justify-between items-center">
                    <a href="#" className="text-xl custom_title">CompuStore</a>

                    <button
                        // ... RECUERDA AGREGAR EL MENU DE HAMBURGUESA PARA MOVILES
                    >
                        {/* ... ICONONOS PAR A EL MENU MOVIL */}
                    </button>
                    <div className="hidden md:flex absolute md:relative top-16 md:top-0 left-0 h-2/4 w-full md:w-auto bg-black md:bg-transparent flex-col md:flex-row items-end md:items-center gap-4 p-4 md:p-0">
                        <ul className="flex flex-col md:flex-row md:space-x-6 space-y-2 md:space-y-0 items-end md:items-center">
                            <li>
                                <Link to="/" className="block hover:text-gray-300 transition-colors">
                                    Home
                                </Link>
                            </li>
                            <li>
                                <Link to="/productos" className="block hover:text-gray-300 transition-colors">
                                    Productos
                                </Link>
                            </li>
                            <li>
                                <a href="#" className="block hover:text-gray-300 transition-colors">
                                    Ofertas
                                </a>
                            </li>
                            <li>
                                <Link to="/configurador" className="block hover:text-gray-300 transition-colors">
                                    Personalizar
                                </Link>
                            </li>
                        </ul>
                        <div className="flex items-center space-x-4">
                            <Link to="/login" className="hover:text-gray-300">
                                <User size={20} />
                            </Link>
                            <Link to="/cart" className="relative hover:text-gray-300">
                                <ShoppingCart size={20} />
                                <span className="absolute -top-2 -right-2 bg-gray-600 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">
                  0
                </span>
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    );
};

export default Navbar;