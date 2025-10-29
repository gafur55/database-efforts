CREATE DATABASE ecommerce;
USE ecommerce;


CREATE TABLE Customers(
	customerId INTEGER NOT NULL, 
    firstName VARCHAR(50) NOT NULL, 
    lastName VARCHAR(50) NOT NULL, 
    addressState VARCHAR(100),
    PRIMARY KEY (customerId)
);

INSERT INTO Customers 
VALUES (1,"Melvin Horne","Chloe Arnold","Illinois"),
  (2,"Kaye Vaughan","Kennedy Brewer","Indiana"),
  (3,"Bert Baxter","Camden Harrington","Wisconsin"),
  (4,"Roth Clements","Yuri Guthrie","Michigan"),
  (5,"Gabriel Levy","Cecilia Fernandez","Illinois"),
  (6,"Felix Bryant","Bell Lopez","Indiana"),
  (7,"Murphy Vance","Shoshana Sanchez","Wisconsin"),
  (8,"Raja Noel","Holmes Nieves","Michigan"),
  (9,"Hope Murray","Renee Knight","Illinois"),
  (10,"Nolan Espinoza","Jocelyn Sykes","Indiana"),
  (11,"Dara Ramsey","Calvin Martin","Wisconsin"),
  (12,"Vincent Skinner","Ali David","Michigan"),
  (13,"Hunter Waller","Jasmine Horn","Illinois"),
  (14,"Regan Saunders","Tamara Puckett","Indiana"),
  (15,"Axel Sykes","Kadeem Blackwell","Wisconsin"),
  (16,"Orla Fowler","Avram Irwin","Michigan"),
  (17,"Burton Stanley","Kristen Adams","Illinois"),
  (18,"Julian Barlow","Brynn Potts","Indiana"),
  (19,"Angelica Rivers","Hannah Vance","Wisconsin"),
  (20,"Nora Burton","Arsenio Abbott","Michigan"),
  (21,"John Spears","Kylan Spencer","Illinois"),
  (22,"John Marquez","Susan Gates","Indiana"),
  (23,"Marcia Acevedo","Griffin Castillo","Wisconsin"),
  (24,"Chaney Gilliam","Nigel Gray","Michigan"),
  (25,"Camden Mcintyre","Alan Serrano","Illinois"),
  (26,"Martena Fulton","Devin Bentley","Indiana"),
  (27,"Rhea Randall","Winifred Hahn","Wisconsin"),
  (28,"Halla Gill","Channing Cox","Michigan"),
  (29,"Mohammad Dillon","Perry Potts","Illinois"),
  (30,"Evan Burt","Myra Shaw","Indiana"),
  (31,"Kellie Rodgers","Guinevere Dotson","Wisconsin"),
  (32,"Zane Wood","Alfonso Morgan","Michigan"),
  (33,"Talon Sharp","Ian Allen","Illinois"),
  (34,"Allen Reynolds","Maisie Velez","Indiana"),
  (35,"Veronica Cabrera","Lee Brooks","Wisconsin"),
  (36,"Joshua Sandoval","Yolanda West","Michigan"),
  (37,"Addison Byers","Colin Vasquez","Illinois"),
  (38,"Maia Boone","Patricia Hood","Indiana"),
  (39,"Dean Dominguez","Leo Bishop","Wisconsin"),
  (40,"Zenaida Humphrey","Yoko Dalton","Michigan");










CREATE TABLE Categories(
	categoryId INTEGER NOT NULL, 
	categoryName VARCHAR(100) NOT NULL,
	PRIMARY KEY(categoryId)
);

INSERT 
INTO Categories
VALUES (1, 'Electronics'), 
		(2, 'Books'), 
        (3, 'Automotive'), 
        (4, 'Office Supplies');












CREATE TABLE Products(
	productId INTEGER NOT NULL, 
	productName VARCHAR(30) NOT NULL, 
	categoryId INTEGER, 
	price DECIMAL(9,2),
	PRIMARY KEY (productId),
	FOREIGN KEY (categoryId) REFERENCES Categories(categoryId)
    ON DELETE CASCADE
    ON UPDATE SET NULL
);


INSERT
INTO Products
VALUES (1, 'Smartphone', 1, 699.99),
(2, 'Laptop', 1, 1199.99),
(3, 'Bluetooth Speaker', 1, 49.99),
(4, 'Noise Canceling Headphones', 1, 249.99),
(5, 'Fiction Novel', 2, 14.99),
(6, 'Science Textbook', 2, 79.99),
(7, 'History Book', 2, 19.99),
(8, 'Car Seat Cover', 3, 49.99),
(9, 'Windshield Wipers', 3, 15.99),
(10, 'Tire Inflator', 3, 29.99),
(11, 'Car Vacuum Cleaner', 3, 39.99),
(12, 'Desk Organizer', 4, 19.99),
(13, 'Ballpoint Pens - Pack of 20', 4, 5.99),
(14, 'Wireless Mouse', 4, 12.99),
(15, 'Notebook - Pack of 5', 4, 8.99);

















DROP TABLE Orders;

CREATE TABLE Orders(
	orderId INTEGER NOT NULL, 
    customerId INTEGER NOT NULL, 
    productId INTEGER NOT NULL, 
    orderDate DATE NOT NULL, 
    quantity INTEGER NOT NULL,
    PRIMARY KEY(orderId), 
    FOREIGN KEY (productId) REFERENCES Products(productId)
    ON DELETE CASCADE,
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
    ON DELETE CASCADE
);

INSERT INTO Orders
VALUES
  (1,4,5,"2021-02-15",611),
  (2,8,5,"2022-10-07",74),
  (3,20,12,"2022-08-22",425),
  (4,9,6,"2021-07-04",836),
  (5,39,5,"2022-08-18",551),
  (6,20,4,"2021-04-01",189),
  (7,40,4,"2021-01-28",179),
  (8,3,4,"2021-03-22",845),
  (9,14,3,"2021-06-09",50),
  (10,7,11,"2022-04-20",667),
  (11,30,8,"2021-09-22",9),
  (12,12,11,"2021-08-07",963),
  (13,34,15,"2022-05-15",107),
  (14,11,8,"2022-09-16",854),
  (15,12,5,"2021-10-10",776),
  (16,30,3,"2021-08-15",675),
  (17,10,6,"2021-12-18",786),
  (18,27,3,"2021-05-17",753),
  (19,15,4,"2021-09-03",203),
  (20,34,3,"2021-01-08",55),
  (21,16,10,"2022-07-12",601),
  (22,33,11,"2022-06-21",600),
  (23,34,12,"2022-02-06",773),
  (24,26,3,"2021-12-29",967),
  (25,3,8,"2022-04-10",137),
  (26,31,1,"2021-08-21",249),
  (27,21,7,"2022-05-16",63),
  (28,38,3,"2022-05-11",241),
  (29,39,3,"2021-04-27",775),
  (30,10,3,"2021-03-28",985),
  (31,8,11,"2022-02-28",486),
  (32,33,12,"2022-07-29",383),
  (33,30,2,"2021-04-13",680),
  (34,20,10,"2021-05-06",818),
  (35,3,11,"2021-03-23",4),
  (36,30,9,"2022-06-11",557),
  (37,7,6,"2021-12-27",934),
  (38,40,13,"2021-10-02",989),
  (39,17,12,"2021-09-09",660),
  (40,30,12,"2022-06-22",389),
  (41,4,14,"2021-08-01",119),
  (42,6,12,"2021-12-17",815),
  (43,30,10,"2022-06-19",663),
  (44,4,7,"2021-09-20",375),
  (45,7,2,"2021-07-26",257),
  (46,9,6,"2021-10-11",483),
  (47,37,13,"2021-09-21",344),
  (48,5,13,"2022-03-21",874),
  (49,27,2,"2021-01-23",49),
  (50,17,9,"2021-02-12",585),
  (51,10,6,"2021-10-18",788),
  (52,7,6,"2021-12-21",238),
  (53,12,6,"2021-04-03",473),
  (54,20,14,"2021-07-11",847),
  (55,13,10,"2021-06-21",544),
  (56,2,2,"2021-09-16",552),
  (57,23,12,"2021-07-02",951),
  (58,19,8,"2022-09-07",363),
  (59,15,2,"2021-05-04",763),
  (60,18,6,"2021-08-11",500),
  (61,25,9,"2021-09-09",931),
  (62,14,14,"2021-06-10",561),
  (63,13,7,"2022-09-05",837),
  (64,39,8,"2022-04-16",64),
  (65,4,9,"2022-09-26",188),
  (66,9,12,"2021-03-24",229),
  (67,33,5,"2022-05-23",494),
  (68,22,12,"2022-08-21",655),
  (69,23,10,"2021-04-11",116),
  (70,19,9,"2022-07-28",689),
  (71,8,3,"2022-10-19",215),
  (72,10,15,"2021-08-02",295),
  (73,39,15,"2022-07-08",904),
  (74,18,2,"2021-08-07",251),
  (75,1,3,"2021-11-19",288),
  (76,24,9,"2022-05-08",526),
  (77,4,11,"2021-07-18",535),
  (78,26,9,"2022-10-14",269),
  (79,11,3,"2021-06-04",93),
  (80,3,6,"2022-08-26",594),
  (81,12,3,"2022-02-24",643),
  (82,21,6,"2021-07-18",706),
  (83,12,6,"2021-07-14",497),
  (84,21,9,"2021-06-18",174),
  (85,36,13,"2022-01-05",728),
  (86,30,9,"2021-02-20",356),
  (87,7,6,"2021-11-19",717),
  (88,10,2,"2022-09-11",136),
  (89,15,3,"2022-05-22",450),
  (90,27,4,"2022-09-07",395),
  (91,33,5,"2021-07-30",581),
  (92,36,1,"2021-02-13",33),
  (93,22,14,"2021-05-07",3),
  (94,15,3,"2022-03-10",989),
  (95,19,13,"2022-01-16",341),
  (96,11,6,"2022-03-24",53),
  (97,14,5,"2022-02-15",64),
  (98,25,6,"2022-08-14",294),
  (99,17,4,"2021-02-09",19),
  (100,7,3,"2021-12-04",901);























CREATE TABLE Reviews(
	reviewId INTEGER NOT NULL, 
    customerId INTEGER NOT NULL, 
    productId INTEGER NOT NULL, 
    rating INTEGER NOT NULL,
    PRIMARY KEY(reviewId),
    FOREIGN KEY(customerId) REFERENCES Customers(customerId)
    ON DELETE CASCADE,
    FOREIGN KEY (productId) REFERENCES Products(productId)
    ON DELETE CASCADE
);

INSERT INTO Reviews
VALUES
  (1,13,5,4),
  (2,31,4,5),
  (3,18,2,2),
  (4,23,6,5),
  (5,37,14,9),
  (6,27,4,3),
  (7,32,7,8),
  (8,18,10,9),
  (9,36,7,8),
  (10,4,10,6),
  (11,23,3,9),
  (12,19,4,4),
  (13,6,15,2),
  (14,19,6,6),
  (15,36,4,5),
  (16,30,3,7),
  (17,19,8,3),
  (18,4,8,4),
  (19,40,6,1),
  (20,4,14,9),
  (21,7,5,6),
  (22,12,4,3),
  (23,3,2,6),
  (24,17,5,6),
  (25,32,9,5),
  (26,25,12,8),
  (27,9,6,7),
  (28,11,10,6),
  (29,20,5,10),
  (30,37,5,8),
  (31,24,9,3),
  (32,28,6,9),
  (33,18,4,8),
  (34,25,6,6),
  (35,3,5,7),
  (36,23,13,2),
  (37,38,8,5),
  (38,25,12,9),
  (39,23,3,7),
  (40,29,3,6),
  (41,10,6,3),
  (42,39,14,3),
  (43,12,3,6),
  (44,24,13,2),
  (45,25,1,4),
  (46,23,7,4),
  (47,39,8,2),
  (48,38,9,5),
  (49,24,15,5),
  (50,22,3,6),
  (51,22,4,10),
  (52,15,11,9),
  (53,11,6,4),
  (54,5,7,1),
  (55,16,5,8),
  (56,25,2,8),
  (57,37,6,8),
  (58,5,5,10),
  (59,33,4,2),
  (60,29,12,8);

















SELECT *
FROM Reviews
LIMIT 15;







-- Display the average rating for each product. Display the product name and price as well, ordered by the product name
-- in ascending order

SELECT P.productName, P.price, AVG(R.rating) AS Average_rating
FROM Products AS P, Reviews AS R
WHERE R.productId = P.productId
GROUP BY P.productName, P.price
ORDER BY (P.productName) ASC;









-- 2. Count the number of customers who ordered products from the 'Electronics' category.
SELECT COUNT(DISTINCT orde.customerId) AS number_of_customers
FROM Products AS prod, Orders AS orde, Categories AS cat
WHERE orde.productId=prod.productId AND prod.categoryId=cat.categoryId AND cat.categoryName='Electronics';









-- For each state in the customers table, display the state name and the number of orders made from such state. Order the
-- output in ascending order of the state name.
SELECT C.addressState, COUNT(O.orderId) AS number_of_order
FROM Customers AS C, Orders AS O
WHERE O.customerId = C.customerId
GROUP BY C.addressState
ORDER BY C.addressState ASC;












-- 4. Display the customers -by first and last name- who ordered products from the 'Books' category but did not order any
-- product from the ‘Office Supplies’ category.
--      ● For space constraints, limit your output to 10 customers only
SELECT DISTINCT Cust.customerId AS ID, Cust.firstName AS first_name, Cust.lastName AS last_name
FROM Orders AS O, Categories AS Cat, Customers AS Cust, Products AS Prod
WHERE O.customerId = Cust.customerId
  AND O.productId = Prod.productId
  AND Prod.categoryId = Cat.categoryId 
  AND Cat.categoryName='Books' 
  AND Cust.customerId NOT IN (
	SELECT O2.customerId
	FROM Orders AS O2, Categories AS Cat2, Products AS Prod2
	WHERE O2.productId=Prod2.productId 
      AND Prod2.categoryId=Cat2.categoryId 
	  AND Cat2.categoryName='Office Supplies'
) LIMIT 10;