CREATE DATABASE storedb;
-- Connect to the database
\c storedb;


-- Create Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Products Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10, 2) NOT NULL
);

-- Create Order Items Table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INT REFERENCES products(product_id) ON DELETE CASCADE,
    quantity INT NOT NULL,
    price_per_unit NUMERIC(10, 2) NOT NULL
);

-- Insert dummy data into Users
INSERT INTO users (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.com');

-- Insert dummy data into Products
INSERT INTO products (name, description, price, stock_quantity) VALUES
('Laptop', 'High performance laptop', 999.99, 50),
('Smartphone', 'Latest model smartphone', 699.99, 100),
('Headphones', 'Noise-cancelling headphones', 199.99, 200),
('Monitor', '4K resolution monitor', 299.99, 75);

-- Insert dummy data into Orders
INSERT INTO orders (user_id, total_amount) VALUES
(1, 1199.98),
(2, 899.98),
(3, 699.99),
(4, 399.98);

-- Insert dummy data into Order Items
INSERT INTO order_items (order_id, product_id, quantity, price_per_unit) VALUES
(1, 1, 1, 999.99),
(1, 3, 1, 199.99),
(2, 2, 1, 699.99),
(2, 4, 1, 199.99),
(3, 2, 1, 699.99),
(4, 3, 2, 199.99);
