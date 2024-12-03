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
        body: 'action=add&productId=' + productId  // Corregido
    })
            .then(response => {
                console.log("Respuesta del servidor:", response);
                if (response.ok) {
                    alert('Producto añadido al carrito');
                } else {
                    alert('Error al añadir el producto: ' + response.status);
                }
            })
            .catch(error => {
                console.error('Error al procesar la solicitud:', error);
                alert('Error al procesar la solicitud');
            });
}