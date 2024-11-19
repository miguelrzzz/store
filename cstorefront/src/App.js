import logo from './logo.svg';
import './App.css';
import Navbar from "./components/home/navbar";
import Footer from "./components/home/footer";
import { HashRouter,Route, Routes} from "react-router-dom";
import LoginPage from "./components/auth/login";
import HomePage from "./components/home/homePage";
import Cart from "./components/cart/cart";
import ConfigurarPC from "./components/configurator/configurarpc";
import ProductPage from "./components/Product/productPage";
function App() {
    return (
        <HashRouter>
            <div className="flex flex-col min-h-screen">
                <Navbar />
                <main className="flex-grow">
                    <Routes>
                        <Route path="/" element={<HomePage />} />
                        <Route path="/login" element={<LoginPage />} />
                        <Route path="/cart" element={<Cart/>}/>
                        <Route path="/configurador" element={<ConfigurarPC/>}/>
                        <Route path="/productos" element={<ProductPage/>}/>
                        {/*<Route path="/logup" element={</>}></Route>*/}
                    </Routes>
                </main>
                <Footer />
            </div>
        </HashRouter>
    );
}

export default App;