
CREATE TABLE Customer (
    Customer_id VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(20) NOT NULL,
    Customer_Tel VARCHAR(20) NOT NULL
);

CREATE TABLE Product (
    Product_id VARCHAR(20) PRIMARY KEY,
    Product_Name VARCHAR(20) NOT NULL,
    Price DECIMAL(10, 2) -- Removed CHECK constraint for compatibility
);

CREATE TABLE Orders (
    Customer_id VARCHAR(20),
    Product_id VARCHAR(20),
    Quantity INT,
    Total_amount DECIMAL(10, 2),
    OrderDate DATE DEFAULT NULL, -- Use DEFAULT NULL if CURRENT_DATE is problematic
    CONSTRAINT fk_customer FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    CONSTRAINT fk_product FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);





ALTER TABLE Orders
ADD COLUMN OrderDate DATE;

UPDATE Orders
SET OrderDate = CURDATE();  -- or NOW() if you prefer timestamp


INSERT INTO Customer (Customer_id, Customer_Name, Customer_Tel)
VALUES ('C001', 'John Doe', '1234567890');

-- multiple inserts
INSERT INTO Product (Product_id, Product_Name, Price)
VALUES 
    ('P002', 'Gadget', 29.99),
    ('P003', 'Sprocket', 9.99);
    
INSERT INTO Orders (Customer_id, Product_id, Quantity, Total_amount, OrderDate)
VALUES ('C001', 'P001', 3, 59.97, '2024-09-17');
