import React from "react";

const CartItem = ({ product, onIncrease, onDecrease, onRemove }) => {
    return (
        <div className="border-b border-gray-300 py-4">
            <div className="flex items-center">
                <div className="w-16 h-16">
                    <img
                        src={product.image}
                        alt={product.name}
                        className="object-cover w-full h-full rounded"
                    />
                </div>
                <div className="flex-1 ml-4">
                    <h5 className="text-lg font-semibold">{product.name}</h5>
                    <p className="text-sm text-gray-500">{product.description}</p>
                </div>
                <div className="flex items-center space-x-4">
                    <button
                        className="px-2 py-1 bg-gray-200 rounded hover:bg-gray-300"
                        onClick={() => onDecrease(product.id)}
                    >
                        -
                    </button>
                    <span className="text-lg">{product.quantity}</span>
                    <button
                        className="px-2 py-1 bg-gray-200 rounded hover:bg-gray-300"
                        onClick={() => onIncrease(product.id)}
                    >
                        +
                    </button>
                </div>
                <div className="text-right ml-4">
                    <span className="text-lg font-bold">${product.price.toFixed(2)}</span>
                </div>
                <div className="ml-4">
                    <button
                        className="text-red-500 hover:text-red-700"
                        onClick={() => onRemove(product.id)}
                    >
                        <i className="fas fa-times"></i>
                    </button>
                </div>
            </div>
        </div>
    );
};

export default CartItem;
