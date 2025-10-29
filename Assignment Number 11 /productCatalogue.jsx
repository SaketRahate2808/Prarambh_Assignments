import React from "react";

function ProductCatalog() {
  const storeName = "TechTrend Innovations";

  const categories = ["Electronics", "Accessories", "Gadgets"];

  const storeInfo = {
    location: "San Francisco, CA",
    founded: 2023,
    rating: 4.8,
  };

  const products = [
    { id: 1, name: "Wireless Earbuds", price: 59.99, category: "Electronics" },
    { id: 2, name: "Smart Watch", price: 199.99, category: "Gadgets" },
    { id: 3, name: "Phone Case", price: 19.99, category: "Accessories" },
    { id: 4, name: "Bluetooth Speaker", price: 89.99, category: "Electronics" },
    { id: 5, name: "VR Headset", price: 299.99, category: "Gadgets" },
    { id: 6, name: "USB-C Hub", price: 39.99, category: "Accessories" },
  ];

  const containerStyle = {
    width: "100%",
    minHeight: "100vh",
    padding: "40px",
    boxSizing: "border-box",
    fontFamily: "Arial, sans-serif",
    backgroundColor: "#f0f2f5",
  };

  const contentWrapperStyle = {
    maxWidth: "1400px",
    margin: "0 auto",
  };

  const sectionStyle = {
    backgroundColor: "#fff",
    padding: "30px",
    marginBottom: "40px",
    borderRadius: "10px",
    boxShadow: "0 4px 8px rgba(0,0,0,0.1)",
  };

  const titleStyle = {
    textAlign: "center",
    fontSize: "40px",
    marginBottom: "30px",
    color: "#222",
  };

  const categoryTagStyle = {
    display: "inline-block",
    backgroundColor: "#dbeafe",
    color: "#1e3a8a",
    padding: "10px 20px",
    borderRadius: "25px",
    fontSize: "16px",
    margin: "8px",
  };

  const productGridStyle = {
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(280px, 1fr))",
    gap: "30px",
    marginTop: "20px",
  };

  const productCardStyle = {
    backgroundColor: "#ffffff",
    padding: "20px",
    border: "1px solid #ccc",
    borderRadius: "8px",
    boxShadow: "0 2px 6px rgba(0,0,0,0.1)",
    transition: "transform 0.2s ease",
  };

  const priceStyle = {
    color: "#008000",
    fontWeight: "bold",
    fontSize: "18px",
  };

  return (
    <div style={containerStyle}>
      <div style={contentWrapperStyle}>
        <h1 style={titleStyle}>{storeName}</h1>

        {/* Categories */}
        <div style={sectionStyle}>
          <h2>Categories</h2>
          <div>
            {categories.map((cat, index) => (
              <span key={index} style={categoryTagStyle}>
                {cat}
              </span>
            ))}
          </div>
        </div>

        {/* Store Info */}
        <div style={sectionStyle}>
          <h2>Store Information</h2>
          <p><strong>Location:</strong> {storeInfo.location}</p>
          <p><strong>Founded:</strong> {storeInfo.founded}</p>
          <p><strong>Rating:</strong> {storeInfo.rating} ⭐</p>
        </div>

        {/* Products */}
        <div style={sectionStyle}>
          <h2>Featured Products</h2>
          {products.length === 0 ? (
            <p>No products available.</p>
          ) : (
            <div style={productGridStyle}>
              {products.map((product) => (
                <div key={product.id} style={productCardStyle}>
                  <h3>{product.name}</h3>
                  <p>Category: {product.category}</p>
                  <p style={priceStyle}>${product.price.toFixed(2)}</p>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default ProductCatalog;
