import { useEffect, useState } from "react";

function ProductManager() {
  const [products, setProducts] = useState([]);
  const [pid, setPid] = useState("");
  const [pname, setPname] = useState("");
  const [price, setPrice] = useState("");
  const [errors, setErrors] = useState({});

  // Load initial data
  useEffect(() => {
    const initialProducts = [
      { pid: 101, pname: "Laptop", price: 45000 },
      { pid: 102, pname: "Mobile", price: 25000 },
      { pid: 103, pname: "Tablet", price: 18000 },
    ];
    setProducts(initialProducts);
  }, []);

  // Validation logic
  function validate() {
    const newErrors = {};
    if (!pid || parseInt(pid) < 1 || parseInt(pid) > 9999) {
      newErrors.pid = "Product ID is required and must be between 1 and 9999.";
    }
    if (!pname || pname.length <= 4) {
      newErrors.pname = "Product name must be more than 4 characters.";
    }
    if (!price || parseFloat(price) <= 0) {
      newErrors.price = "Price must be greater than 0.";
    }
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  }

  // Add new product
  function addProduct() {
    if (!validate()) return;

    const newProduct = {
      pid: parseInt(pid),
      pname: pname,
      price: parseFloat(price),
    };
    setProducts([...products, newProduct]);
    setPid("");
    setPname("");
    setPrice("");
    setErrors({});
  }

  return (
    <>
      <h2>Product Manager</h2>
      <fieldset>
        <legend>Add New Product</legend>

        <label>Product ID:</label>
        <input
          type="number"
          value={pid}
          onChange={(e) => setPid(e.target.value)}
        />
        <span style={{ color: "red" }}>{errors.pid}</span>
        <br /><br />

        <label>Product Name:</label>
        <input
          type="text"
          value={pname}
          onChange={(e) => setPname(e.target.value)}
        />
        <span style={{ color: "red" }}>{errors.pname}</span>
        <br /><br />

        <label>Price:</label>
        <input
          type="number"
          value={price}
          onChange={(e) => setPrice(e.target.value)}
        />
        <span style={{ color: "red" }}>{errors.price}</span>
        <br /><br />

        <input type="button" value="Add Product" onClick={addProduct} />
      </fieldset>

      <hr />

      <h3>Product List</h3>
      <table border="1" cellPadding="10">
        <thead>
          <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Price </th>
          </tr>
        </thead>
        <tbody>
          {products.map((prod, index) => (
            <tr key={index}>
              <td>{prod.pid}</td>
              <td>{prod.pname}</td>
              <td>{prod.price}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

export default ProductManager;
