import React from "react";

const CartSummary = ({ subtotal, shipping, taxRate, onCheckout, onContinueShopping }) => {
    const tax = subtotal * taxRate;
    const total = subtotal + tax + shipping;

    return (
        <div className="p-6 bg-gray-100 rounded shadow">
            <h4 className="text-xl font-bold mb-4">Resumen del Pedido</h4>
            <div className="flex justify-between text-gray-700 mb-2">
                <span>Subtotal</span>
                <span>${subtotal.toFixed(2)}</span>
            </div>
            <div className="flex justify-between text-gray-700 mb-2">
                <span>Envío</span>
                <span>${shipping.toFixed(2)}</span>
            </div>
            <div className="flex justify-between text-gray-700 mb-4">
                <span>IVA ({(taxRate * 100).toFixed(0)}%)</span>
                <span>${tax.toFixed(2)}</span>
            </div>
            <div className="flex justify-between text-lg font-bold text-gray-800 mb-4">
                <span>Total</span>
                <span>${total.toFixed(2)}</span>
            </div>
            <button
                className="w-full py-2 mb-2 text-white hover:text-black hover:border-black-600 bg-black -600 rounded hover:bg-gray-100"
                onClick={onCheckout}
            >
                Proceder al Pago
            </button>
            <button
                className="w-full py-2 text-black-600 border border-black-600 rounded hover:bg-blue-50"
                onClick={onContinueShopping}
            >
                Seguir Comprando
            </button>
        </div>
    );
};

export default CartSummary;
