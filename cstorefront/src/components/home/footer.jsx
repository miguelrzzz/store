import {Phone,Mail,MapPin} from 'lucide-react';
import '../../src/css/components.css';
const Footer = () => {
    return (
        <footer className="bg-black text-white py-12">
            <div className="container mx-auto px-4">
                <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div>
                        <h3 className="text-xl font-bold mb-4 custom_title">CompuStore</h3>
                        <p>Tu tienda de confianza para tecnología</p>
                    </div>
                    <div>
                        <h3 className="text-xl font-bold mb-4 custom_title">Enlaces</h3>
                        <ul className="space-y-2">
                            <li><a href="#" className="hover:text-gray-300">Sobre nosotros</a></li>
                            <li><a href="#" className="hover:text-gray-300">Términos y condiciones</a></li>
                            <li><a href="#" className="hover:text-gray-300">Política de privacidad</a></li>
                        </ul>
                    </div>
                    <div>
                        <h3 className="text-xl font-bold mb-4">Contacto</h3>
                        <ul className="space-y-2">
                            <li className="flex items-center">
                                <Phone size={16} className="mr-2" /> +1 234 567 890
                            </li>
                            <li className="flex items-center">
                                <Mail size={16} className="mr-2" /> info@compustore.com
                            </li>
                            <li className="flex items-center">
                                <MapPin size={16} className="mr-2" /> San Quintin #123
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    );
};
export default Footer;