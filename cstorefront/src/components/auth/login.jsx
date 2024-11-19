import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function LoginPage() {
    const navigate = useNavigate();
    const [activeForm, setActiveForm] = useState('login');
    const [formData, setFormData] = useState({
        email: '',
        password: '',
        username: '',
        confirmPassword: '',
    });
    const [error, setError] = useState(null);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError(null);

        try {
            if (activeForm === 'login') {
                const response = await fetch('http://localhost:8080/users/login', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        email: formData.email,
                        password: formData.password,
                        username: formData.username
                    }),
                });

                const data = await response.json();

                if (!response.ok) {
                    setError(data.message || 'Error al iniciar sesión');
                    return;
                }

                // Guardar los datos del usuario en localStorage
                localStorage.setItem('user', JSON.stringify(data));

                // Redirigir al usuario a la página principal
                navigate('/');
            } else if (activeForm === 'signup') {
                const response = await fetch('http://localhost:8080/users', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({
                        email: formData.email,
                        password: formData.password,
                        username: formData.username
                    }),
                });

                const data = await response.json();

                if (!response.ok) {
                    setError(data.message || 'Error al registrar usuario');
                    return;
                }

                // Mostrar mensaje de éxito y cambiar a formulario de login
                alert('Usuario registrado exitosamente');
                setActiveForm('login');
            }
        } catch (error) {
            setError('Error de conexión al servidor');
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData((prevData) => ({
            ...prevData,
            [name]: value,
        }));
    };

    const toggleForm = () => {
        setActiveForm(activeForm === 'login' ? 'signup' : 'login');
        setError(null);
        setFormData({
            email: '',
            password: '',
            username: '',
            confirmPassword: '',
        });
    };

    return (
        <div className="min-h-screen w-full flex items-center justify-center bg-gradient-to-br from-[#f5f7fa] to-[#c3cfe2]">
            <div className="w-[80%] max-w-[900px] max-h-[700px] overflow-hidden rounded-[20px] shadow-lg">
                <div className="flex flex-row">
                    {/* Form Section */}
                    <div className="w-full md:w-1/2 p-8">
                        <div className="text-center mb-8">
                            <h2 className="text-2xl font-bold mb-0">
                                {activeForm === 'login' ? 'Bienvenido' : 'Regístrate'}
                            </h2>
                            <p className="text-gray-500">
                                {activeForm === 'login' ? 'Inicia sesión en tu cuenta' : 'Crea una cuenta nueva'}
                            </p>
                            {error && <div className="text-red-500 mt-2">{error}</div>}
                        </div>

                        <form onSubmit={handleSubmit}>
                            <div className="mb-4">
                                <label htmlFor="email">Correo electrónico</label>
                                <input
                                    type="email"
                                    id="email"
                                    name="email"
                                    value={formData.email}
                                    onChange={handleChange}
                                    className="border border-gray-300 p-2 w-full rounded"
                                    required
                                />
                            </div>
                            <div className="mb-4">
                                <label htmlFor="password">Contraseña</label>
                                <input
                                    type="password"
                                    id="password"
                                    name="password"
                                    value={formData.password}
                                    onChange={handleChange}
                                    className="border border-gray-300 p-2 w-full rounded"
                                    required
                                />
                            </div>
                            {activeForm === 'signup' && (
                                <>
                                    <div className="mb-4">
                                        <label htmlFor="username">Nombre de usuario</label>
                                        <input
                                            type="text"
                                            id="username"
                                            name="username"
                                            value={formData.username}
                                            onChange={handleChange}
                                            className="border border-gray-300 p-2 w-full rounded"
                                            required
                                        />
                                    </div>
                                    <div className="mb-4">
                                        <label htmlFor="confirmPassword">Confirmar contraseña</label>
                                        <input
                                            type="password"
                                            id="confirmPassword"
                                            name="confirmPassword"
                                            value={formData.confirmPassword}
                                            onChange={handleChange}
                                            className="border border-gray-300 p-2 w-full rounded"
                                            required
                                        />
                                    </div>
                                </>
                            )}
                            <button
                                type="submit"
                                className="w-full bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                            >
                                {activeForm === 'login' ? 'Iniciar Sesión' : 'Registrarse'}
                            </button>
                        </form>

                        <div className="text-center mt-4">
                            <button
                                onClick={toggleForm}
                                className="text-blue-500 hover:text-blue-700"
                            >
                                {activeForm === 'login'
                                    ? '¿No tienes cuenta? Regístrate'
                                    : '¿Ya tienes cuenta? Inicia sesión'}
                            </button>
                        </div>
                    </div>

                    {/* Image Section */}
                    <div className="hidden md:flex md:w-1/2 bg-black text-white">
                        <div className="flex flex-col items-center justify-center w-full p-8">
                            <h1 className="text-4xl font-bold mb-4">CompuStore</h1>
                            <p className="text-xl">Tu destino para la mejor tecnología</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default LoginPage;