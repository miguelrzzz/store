import CartItem from "./cartItem";
import CartSummary from "./cartSummary";

const Cart = () => {
    const products = [
        { id: 1, name: "Laptop", description: "14-inch display", price: 799.99, quantity: 1, image: "/images/laptop.jpg" },
        { id: 2, name: "Mouse", description: "Wireless", price: 19.99, quantity: 2, image: "/images/mouse.jpg" },
    ];

    const subtotal = products.reduce((sum, item) => sum + item.price * item.quantity, 0);
    const shipping = 15.0;
    const taxRate = 0.16;

    const handleIncrease = (id) => console.log("Increase quantity for", id);
    const handleDecrease = (id) => console.log("Decrease quantity for", id);
    const handleRemove = (id) => console.log("Remove item with ID", id);
    const handleCheckout = () => console.log("Proceed to checkout");
    const handleContinueShopping = () => console.log("Continue shopping");

    return (
        <div className="container mx-auto p-4">
            <h1 className="text-2xl font-bold mb-4">Tu Carrito</h1>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div className="md:col-span-2">
                    {products.map((product) => (
                        <CartItem
                            key={product.id}
                            product={product}
                            onIncrease={handleIncrease}
                            onDecrease={handleDecrease}
                            onRemove={handleRemove}
                        />
                    ))}
                </div>
                <CartSummary
                    subtotal={subtotal}
                    shipping={shipping}
                    taxRate={taxRate}
                    onCheckout={handleCheckout}
                    onContinueShopping={handleContinueShopping}
                />
            </div>
        </div>
    );
};

export default Cart;