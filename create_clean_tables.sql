#To Create the TAble,
CREATE TABLE raw_orders (
  OrderID VARCHAR(20),
  OrderDate DATE,
  CustomerID VARCHAR(20),
  CustomerName VARCHAR(100),
  ProductID VARCHAR(20),
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  Brand VARCHAR(50),
  Quantity INT,
  UnitPrice DECIMAL(10,2),
  Discount DECIMAL(5,2),
  Tax DECIMAL(10,2),
  ShippingCost DECIMAL(10,2),
  TotalAmount DECIMAL(10,2),
  PaymentMethod VARCHAR(50),
  OrderStatus VARCHAR(20),
  City VARCHAR(50),
  State VARCHAR(50),
  Country VARCHAR(50),
  SellerID VARCHAR(20)
);

#Checking the TAble
SELECT COUNT(*) FROM raw_orders;

#First 5 raw_orders
SELECT * FROM raw_orders LIMIT 5;


#Cleaning Process

#Creating Customer Table

CREATE TABLE customers (
  customer_id VARCHAR(20) PRIMARY KEY,
  customer_name VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50)
);

#Insert the Unique Customers

INSERT INTO customers (customer_id, customer_name, city, state, country)
SELECT 
    CustomerID,
    MIN(CustomerName),
    MIN(City),
    MIN(State),
    MIN(Country)
FROM raw_orders
GROUP BY CustomerID;

#Verify Customer Tables
SELECT COUNT(*) FROM customers;
SELECT * FROM customers LIMIT 5;


#Create Order table
CREATE TABLE orders (
  order_id VARCHAR(20) PRIMARY KEY,
  customer_id VARCHAR(20),
  order_date DATE,
  order_status VARCHAR(20),
  total_amount DECIMAL(10,2),
  payment_method VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

#Insert DAta into Orderss Table
INSERT INTO orders
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  OrderStatus,
  TotalAmount,
  PaymentMethod
FROM raw_orders;

#Table Checking
SELECT COUNT(*) FROM orders;
SELECT * FROM orders LIMIT 5;

#Quality Checking
#QUICK DATA QUALITY CHECKS [results shows zero]
#Check for missing Customers
-- Check for missing customers
SELECT COUNT(*) 
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
