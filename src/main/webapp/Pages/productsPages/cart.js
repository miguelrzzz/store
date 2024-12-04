/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function addToCart(productId) {
    console.log("Enviando solicitud para agregar el producto:", productId);

    fetch('http://localhost:8082/Store/carritoController', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'action=add&productId=' + productId
    })
            .then(response => {
                console.log("Respuesta del servidor:", response);
                return response.text().then(text => {
                    if (response.ok) {
                        alert('Producto añadido al carrito exitosamente');
                    } else {
                        throw new Error(text || 'Error en la solicitud');
                    }
                });
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Error: ' + error.message);
            });
}

document.addEventListener('DOMContentLoaded', function () {
    const categoryButtons = document.querySelectorAll('.btn-filter');
    const productCards = document.querySelectorAll('#productContainer .product-card');
    categoryButtons.forEach(button => {
        button.addEventListener('click', function () {
            const category = this.getAttribute('data-category');
            // Remover clase activa de todos los botones
            categoryButtons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
            productCards.forEach(card => {
                if (category === 'all' || card.getAttribute('data-category') === category) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });
});