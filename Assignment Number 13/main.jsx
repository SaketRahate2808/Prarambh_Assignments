import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import './index.css';
import App from './App.jsx';
import { BrowserRouter, Route, Routes } from 'react-router-dom';

import About from './assets/components/About.jsx';
import Contact from './assets/components/Contact.jsx';
import Navbar from './assets/components/NavBar.jsx';
import Depts from './assets/components/Depts.jsx';
import NotFound from './assets/components/NotFound.jsx';
import Emps from './assets/components/Emps.jsx';
import Details from './assets/components/Details.jsx';
import ProdDetails from './assets/components/ProdDetails.jsx';
import ProdList from './assets/components/ProdList.jsx';

const routing = (
  <BrowserRouter>
    <Navbar />
    <Routes>
      <Route path="/" element={<App />} />
      <Route path="/Depts" element={<Depts />} />
      <Route path="/Emps" element={<Emps />} />
      <Route path="/About" element={<About />} />
      <Route path="/Contact" element={<Contact />} />
      <Route path="/Details" element={<Details />} />
      <Route path="/ProdDetails" element={<ProdDetails />} />
      <Route path="/ProdList" element={<ProdList />} />
      <Route path="*" element={<NotFound />} />
    </Routes>
  </BrowserRouter>
);

createRoot(document.getElementById('root')).render(
  <StrictMode>
    {routing}
  </StrictMode>
);
``
