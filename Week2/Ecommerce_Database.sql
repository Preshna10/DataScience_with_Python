CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL
);

SHOW TABLES;

INSERT INTO categories(category_id, category_name)
VALUES
(1,'Electronics'),
(2,'Home & Kitchen'),
(3,'Books'),
(4,'Sports'),
(5,'Accessories');

SELECT *FROM categories;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    signup_date TEXT NOT NULL
);

SHOW TABLES;

ALTER TABLE CUSTOMERS
CHANGE `name` `fullname` TEXT;

DESCRIBE CUSTOMERS;

INSERT INTO customers(customer_id, fullname, city, signup_date) 
VALUES
(1,'Aarav Sharma','Kathmandu','2025-01-10'),
(2,'Sita Thapa','Pokhara','2025-01-15'),
(3,'Rohan Gurung','Lalitpur','2025-02-03'),
(4,'Maya Rai','Bhaktapur','2025-02-18'),
(5,'Nabin Karki','Kathmandu','2025-03-05'),
(6,'Anisha Shrestha','Pokhara','2025-03-20'),
(7,'Bibek Tamang','Chitwan','2025-04-02'),
(8,'Priya Adhikari','Lalitpur','2025-04-17'),
(9,'Suman KC','Kathmandu','2025-05-01'),
(10,'Elina Gurung','Dharan','2025-05-12'),
(11,'Roshan Bista','Butwal','2025-06-08'),
(12,'Kabita Magar','Pokhara','2025-06-21');

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date TEXT NOT NULL,
    status TEXT NOT NULL,
    total_amount REAL NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

DESCRIBE orders;

INSERT INTO orders(order_id,customer_id,order_date,status,total_amount)
VALUES
(101,1,'2025-07-01','Completed',145.0),
(102,2,'2025-07-03','Completed',85.0),
(103,3,'2025-07-05','Completed',150.0),
(104,1,'2025-07-09','Completed',110.0),
(105,4,'2025-07-12','Cancelled',55.0),
(106,5,'2025-07-15','Completed',205.0),
(107,6,'2025-07-18','Completed',95.0),
(108,7,'2025-07-22','Completed',130.0),
(109,8,'2025-07-25','Completed',85.0),
(110,9,'2025-08-01','Completed',170.0),
(111,2,'2025-08-04','Completed',120.0),
(112,3,'2025-08-08','Completed',55.0),
(113,10,'2025-08-11','Completed',95.0),
(114,5,'2025-08-15','Completed',150.0),
(115,11,'2025-08-18','Completed',60.0),
(116,1,'2025-08-21','Completed',75.0);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category_id INTEGER NOT NULL,
    price REAL NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

DESCRIBE products;

INSERT INTO products(product_id,product_name,category_id,price)
VALUES
(1,'Wireless Headphones',1,85.0),
(2,'Bluetooth Speaker',1,60.0),
(3,'Laptop Stand',1,45.0),
(4,'Coffee Maker',2,120.0),
(5,'Water Bottle',2,25.0),
(6,'SQL for Beginners',3,30.0),
(7,'Data Science Handbook',3,55.0),
(8,'Yoga Mat',4,35.0),
(9,'Running Shoes',4,95.0),
(10,'Backpack',5,50.0),
(11,'USB-C Cable',5,15.0),
(12,'Mechanical Keyboard',1,110.0);

SHOW TABLES;