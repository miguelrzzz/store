import {Truck,Headphones,Shield} from 'lucide-react';
const subFooter = () => {
    const features = [
        {
            icon: <Truck className="w-12 h-12" />,
            title: "Envío Gratis",
            description: "En compras mayores a $500"
        },
        {
            icon: <Headphones className="w-12 h-12" />,
            title: "Soporte 24/7",
            description: "Asistencia técnica especializada"
        },
        {
            icon: <Shield className="w-12 h-12" />,
            title: "Garantía",
            description: "12 meses en todos los productos"
        }
    ];

    return (
        <section className="bg-gray-100 py-16">
            <div className="container mx-auto px-4">
                <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                    {features.map((feature, index) => (
                        <div key={index} className="text-center">
                            <div className="text-black mb-4 flex justify-center">
                                {feature.icon}
                            </div>
                            <h3 className="text-xl font-semibold mb-2">{feature.title}</h3>
                            <p className="text-gray-600">{feature.description}</p>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
};
export default subFooter;