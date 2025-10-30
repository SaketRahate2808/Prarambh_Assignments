import { useParams } from "react-router-dom";

const products = [
  { id: 1, name: "Laptop", price: 999, description: "High-performance laptop" },
  { id: 2, name: "Phone", price: 499, description: "Latest smartphone" },
  { id: 3, name: "Headphones", price: 199, description: "Noise-cancelling headphones" },
];

function Details() {
  const { id } = useParams();
  const product = products.find((p) => p.id === parseInt(id));

  if (!product) return <p>Product not found</p>;

  return (
    <div>
      <h2>{product.name}</h2>
      <p><strong>Price:</strong> ${product.price}</p>
      <p><strong>Description:</strong> {product.description}</p>
    </div>
  );
}

export default Details;
``
