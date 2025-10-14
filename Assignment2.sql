******************************************************************* Inventory Management System ********************************************************************************

1. Database Structure and Constraints (DDL)
-- ---------------------------------
-- Table: Products
-- ---------------------------------
CREATE TABLE Products (
    product_id   NUMBER(10)      PRIMARY KEY, -- Primary Key (Unique Identifier)
    product_name VARCHAR2(100)   NOT NULL UNIQUE, -- Mandatory and Unique
    category     VARCHAR2(50)    NOT NULL, -- Mandatory
    price        NUMBER(10, 2)   NOT NULL, -- Mandatory
    stock_quantity NUMBER(10)    DEFAULT 0 NOT NULL, -- Defaults to 0, Mandatory
    
    -- Business Rule: Prices must be positive
    CONSTRAINT chk_product_price CHECK (price > 0),
    
    -- Optional: Ensure stock quantity is non-negative
    CONSTRAINT chk_product_stock CHECK (stock_quantity >= 0) 
);

-- ---------------------------------
-- Table: Customers
-- ---------------------------------
CREATE TABLE Customers (
    customer_id  NUMBER(10)      PRIMARY KEY, -- Primary Key (Unique Identifier)
    first_name   VARCHAR2(50)    NOT NULL, -- Mandatory
    last_name    VARCHAR2(50)    NOT NULL, -- Mandatory
    email        VARCHAR2(100)   NOT NULL UNIQUE, -- Mandatory and Unique
    phone_number VARCHAR2(20)    -- Optional
);

-- ---------------------------------
-- Table: Orders
-- ---------------------------------
CREATE TABLE Orders (
    order_id     NUMBER(10)      PRIMARY KEY, -- Primary Key (Unique Identifier)
    customer_id  NUMBER(10)      NOT NULL, -- Mandatory
    order_date   DATE            DEFAULT SYSDATE, -- Defaults to current date
    total_amount NUMBER(10, 2)   NOT NULL, -- Mandatory
    
    -- Foreign Key: Links order to a valid customer
    CONSTRAINT fk_customer_id
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),
        
    -- Business Rule: Total order amounts must be non-negative
    CONSTRAINT chk_order_total CHECK (total_amount >= 0)
);

-- ---------------------------------
-- Table: OrderDetails
-- ---------------------------------
CREATE TABLE OrderDetails (
    order_detail_id NUMBER(10)   PRIMARY KEY, -- Primary Key (Unique Identifier)
    order_id        NUMBER(10)   NOT NULL, -- Mandatory
    product_id      NUMBER(10)   NOT NULL, -- Mandatory
    quantity        NUMBER(5)    NOT NULL, -- Mandatory
    
    -- Foreign Key: Links detail record to a valid order
    CONSTRAINT fk_order_id
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),
        
    -- Foreign Key: Links detail record to a valid product
    CONSTRAINT fk_product_id
        FOREIGN KEY (product_id)
        REFERENCES Products(product_id),
        
    -- Business Rule: Quantities ordered must be positive
    CONSTRAINT chk_detail_quantity CHECK (quantity > 0),
    
    -- Composite Unique Key: Ensures a product is only listed once per order
    CONSTRAINT unq_order_product UNIQUE (order_id, product_id)
);
2. Data Insertion (DML)
-- ---------------------------------
-- Insert Sample Data into Products
-- ---------------------------------
INSERT INTO Products (product_id, product_name, category, price, stock_quantity) VALUES (
    101, 
    'Aether-Book Pro Laptop', 
    'Laptops', 
    1499.99, 
    50
);

INSERT INTO Products (product_id, product_name, category, price, stock_quantity) VALUES (
    102, 
    'Aura-Sound ANC Headphones', 
    'Headphones', 
    199.50, 
    15
);

INSERT INTO Products (product_id, product_name, category, price, stock_quantity) VALUES (
    103, 
    'Volt-Speed USB-C Charger', 
    'Accessories', 
    25.00, 
    100
);

-- ---------------------------------
-- Insert Sample Data into Customers
-- ---------------------------------
INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number) VALUES (
    1, 
    'Alex', 
    'Johnson', 
    'alex.johnson@example.com', 
    '555-0101'
);

INSERT INTO Customers (customer_id, first_name, last_name, email) VALUES (
    2, 
    'Maria', 
    'Garcia', 
    'maria.garcia@example.com'
);

-- ---------------------------------
-- Insert Sample Data into Orders
-- ---------------------------------
INSERT INTO Orders (order_id, customer_id, total_amount) VALUES (
    1001, 
    1, 
    1499.99
);

INSERT INTO Orders (order_id, customer_id, total_amount, order_date) VALUES (
    1002, 
    2, 
    449.50, 
    DATE '2025-10-10'
);

-- ---------------------------------
-- Insert Sample Data into OrderDetails
-- ---------------------------------
INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity) VALUES (
    5001, 
    1001, 
    101, -- Aether-Book Pro Laptop
    1
);

INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity) VALUES (
    5002, 
    1002, 
    102, -- Aura-Sound ANC Headphones
    2
);

INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity) VALUES (
    5003, 
    1002, 
    103, -- Volt-Speed USB-C Charger
    2
);
3. Functional Queries (DML/Reporting)
3a. Retrieve Products with Low Stock (Less than 20 units)
SELECT 
    product_id,
    product_name,
    category,
    stock_quantity
FROM 
    Products
WHERE 
    stock_quantity < 20
ORDER BY 
    stock_quantity ASC;


  3b. Calculate the Total Amount Spent by Each Customer
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_full_name,
    SUM(o.total_amount) AS total_spent
FROM
    Customers c
JOIN
    Orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
ORDER BY
    total_spent DESC;  

  3c. Update Product Stock Quantities After Orders

-- Step 1: View current stock before update (Optional check)
SELECT product_id, product_name, stock_quantity AS stock_before_update FROM Products WHERE product_id IN (101, 102, 103);

-- Step 2: Update the Products table to reflect sales
UPDATE Products p
SET p.stock_quantity = p.stock_quantity - (
    SELECT SUM(od.quantity)
    FROM OrderDetails od
    WHERE od.product_id = p.product_id
)
WHERE p.product_id IN (
    SELECT DISTINCT product_id FROM OrderDetails
);

-- Step 3: View updated stock after order processing
SELECT product_id, product_name, stock_quantity AS stock_after_update FROM Products WHERE product_id IN (101, 102, 103);

******************************************************************* Inventory Management System ********************************************************************************

