create database MyCompany;
use MyCompany;

-- Products (PID: integer, PName: varchar(x), Vendor: varchar(x), AvailableQuantity: integer)
CREATE TABLE Products(
	PID INTEGER PRIMARY KEY, 
    PName VARCHAR(100), 
    Vendor VARCHAR(100), 
    AvailableQuantity INTEGER
);
select * from Products Limit 10;


-- Customers (CID: integer, FullName: varchar(x), Email: varchar(x), Age: integer, Address: varchar(x), State: varchar(x))
CREATE TABLE Customers(
	CID INTEGER PRIMARY KEY, 
    FullName VARCHAR(100), 
    Email VARCHAR(100), 
    Age INTEGER, 
    Address VARCHAR(100),
    State VARCHAR(100)
);
select * from customers limit 10;


-- Orders (OID: integer, PID: integer, CID: integer, OrderQuantity: integer, OrderDate: DATE, TotalCost: decimal(x,x))
-- The “PID” and “CID” fields in Orders relation are foreign keys referencing the “PID” field of the Products relation and “CID”
-- field of the Customers relation
CREATE TABLE Reservations(
	OID INTEGER PRIMARY KEY, 
    PID INTEGER,
    CID INTEGER,
    OrderQuantity INTEGER,
    OrderDate DATE,
    TotalCost DECIMAL(10,2),
    FOREIGN KEY (PID) REFERENCES Products(PID) ON DELETE CASCADE,
    FOREIGN KEY (CID) REFERENCES Customers(CID) ON DELETE CASCADE
);
RENAME TABLE Reservations TO Orders;
select * from Orders limit 10;



-- For each available product vendor, display the vendor as well as the number of unique products and the total quantity
-- available. Only display vendors with more than 5 unique products
select  Products.Vendor, 
		count(distinct Products.PID) AS number_of_unique_products, 
		SUM(Products.AvailableQuantity) as TotalAvailable
from Products
group by Products.Vendor
having count(distinct Products.PID) > 5; 


-- Display the customers -by full name, state, and age- who made orders with more than 1500$ (included)
select Distinct Customers.FullName, Customers.State, Customers.Age 
from Customers, Orders 
where Orders.TotalCost > 1499 AND Orders.CID=Customers.CID; 


-- Display any order made in 2024 with total cost greater than the average of all orders made so far. 
-- Display the orders in descending order of their total costs
select * 
from Orders 
where Year(Orders.OrderDate)='2024' AND Orders.TotalCost> (select Avg(TotalCost) from Orders) 
Order by TotalCost Desc;







