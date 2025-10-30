import { Link } from "react-router-dom";

const products = [
  { id: 1, name: "Laptop", price: 999 },
  { id: 2, name: "Phone", price: 499 },
  { id: 3, name: "Headphones", price: 199 },
];

function Products() {
  return (
    <div>
      <h2>Products List</h2>
      <div style={{ display: "flex", gap: "20px" }}>
        {products.map((product) => (
          <div key={product.id} style={{ border: "1px solid #ccc", padding: "10px" }}>
            <h3>{product.name}</h3>
            <p>Price: ${product.price}</p>
            <Link to={`/details/${product.id}`}>View Details</Link>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Products;
