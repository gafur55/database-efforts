CREATE DATABASE hospitalManagement;
USE hospitalManagement;

CREATE TABLE Patients(
	patientID INTEGER NOT NULL, 
	firstName VARCHAR(50) NOT NULL, 
	lastName VARCHAR(50) NOT NULL, 
	dateOfBirth DATE NOT NULL,
    PRIMARY KEY(patientID)
);

INSERT INTO Patients
VALUES
  (1,"Dorothy","Amaya","2024-03-18"),
  (2,"Reese","Xena","1995-10-05"),
  (3,"Ciara","Leah","2014-11-21"),
  (4,"Rashad","Shaine","2002-08-19"),
  (5,"Halee","Kylan","2013-07-04"),
  (6,"Ocean","Hu","1998-10-17"),
  (7,"Bernard","Judah","2019-02-17"),
  (8,"Dieter","Macey","2006-01-02"),
  (9,"Lael","Vielka","2009-12-16"),
  (10,"Ariana","Ivory","2007-12-14"),
  (11,"Adrienne","Patience","1997-02-14"),
  (12,"Tarik","Octavius","2009-07-27"),
  (13,"Wyatt","Hiram","2015-08-19"),
  (14,"Alika","Shannon","2019-05-29"),
  (15,"Lucius","Inez","2025-10-24"),
  (16,"Priscilla","Elvis","2016-01-14"),
  (17,"Violet","Keith","2022-12-27"),
  (18,"Ira","Damian","1992-09-25"),
  (19,"Desiree","Coby","2021-10-14"),
  (20,"Heather","Damon","2022-07-26"),
  (21,"Rogan","Ira","2004-06-05"),
  (22,"Hayden","Chandler","2020-03-02"),
  (23,"Malcolm","Kaseem","2006-08-29"),
  (24,"Hillary","Kenyon","2021-04-01"),
  (25,"Macaulay","Lara","1999-10-18"),
  (26,"TaShya","Martin","1993-01-12"),
  (27,"Inez","Ursa","1996-05-10"),
  (28,"Ulla","Derek","1999-02-28"),
  (29,"Keegan","Jacob","2015-07-27"),
  (30,"Lesley","Barbara","2025-04-15"),
  (31,"Dominic","Elaine","2001-05-09"),
  (32,"Mannix","Jasper","2020-08-12"),
  (33,"Lara","Gary","1993-12-25"),
  (34,"September","Mercedes","1998-03-02"),
  (35,"Phyllis","Ishmael","2025-01-18"),
  (36,"Leslie","Phyllis","1999-12-25"),
  (37,"Gil","Lucas","1995-01-06"),
  (38,"Tara","Cara","1991-11-03"),
  (39,"Laith","Reagan","2014-11-11"),
  (40,"Savannah","Jocelyn","1995-12-01"),
  (41,"Kai","Keegan","2009-10-03"),
  (42,"Hammett","Keane","2005-05-24"),
  (43,"Graham","Ignacia","2021-08-06"),
  (44,"Tiger","Shelly","1994-04-01"),
  (45,"Emmanuel","Marshall","2001-10-31"),
  (46,"Nina","Hakeem","2020-07-16"),
  (47,"Chandler","Yvette","2005-09-10"),
  (48,"Kimberley","Ulysses","2012-01-20"),
  (49,"Perry","Haley","2009-01-31"),
  (50,"Zelenia","Upton","2014-07-27");


SELECT *
FROM Patients
LIMIT 15;




CREATE TABLE Doctors(
	doctorID INTEGER NOT NULL, 
	firstName VARCHAR(50) NOT NULL, 
	lastName VARCHAR(50) NOT NULL,
	specialization VARCHAR(50) NOT NULL,
    PRIMARY KEY(doctorID)
);

INSERT INTO Doctors
VALUES
  (1,"James","Hu","venenatis"),
  (2,"Bruce","Bo","iaculis"),
  (3,"Wayne","Amir","libero."),
  (4,"Uta","Adrienne","feugiat"),
  (5,"Mechelle","Peter","nonummy."),
  (6,"Ian","Charlotte","magna"),
  (7,"Davis","Signe","habitant"),
  (8,"Nolan","Amaya","Curabitur"),
  (9,"Kuame","Dennis","dignissim"),
  (10,"Aladdin","Ebony","pharetra");

SELECT *
FROM Doctors
LIMIT 15;





CREATE TABLE Appointments(
	appointmentID INTEGER NOT NULL, 
    patientID INTEGER NOT NULL, 
    doctorID INTEGER NOT NULL, 
    appointmentDate DATE NOT NULL,
    PRIMARY KEY(appointmentID),
    FOREIGN KEY(patientID) REFERENCES Patients(patientID)
    ON DELETE CASCADE,
    FOREIGN KEY(doctorID) REFERENCES Doctors(doctorID)
    ON DELETE CASCADE
);

INSERT INTO Appointments
VALUES
	(1,4,4,"2024-06-09"),
  (2,29,7,"2024-11-21"),
  (3,13,5,"2024-09-28"),
  (4,5,8,"2024-10-16"),
  (5,18,5,"2024-09-26"),
  (6,10,2,"2024-06-27"),
  (7,22,5,"2024-02-27"),
  (8,39,4,"2024-01-16"),
  (9,39,8,"2024-08-25"),
  (10,2,7,"2024-05-05"),
  (11,23,4,"2024-05-19"),
  (12,2,5,"2024-04-09"),
  (13,18,2,"2024-04-08"),
  (14,3,2,"2024-10-15"),
  (15,44,3,"2024-09-23"),
  (16,39,8,"2024-02-06"),
  (17,40,9,"2024-03-31"),
  (18,43,6,"2024-06-11"),
  (19,47,9,"2024-09-03"),
  (20,3,5,"2024-01-13"),
  (21,14,5,"2024-01-15"),
  (22,22,5,"2024-05-27"),
  (23,11,4,"2024-12-02"),
  (24,5,3,"2024-02-26"),
  (25,35,4,"2024-08-09"),
  (26,33,4,"2024-11-17"),
  (27,42,5,"2024-06-08"),
  (28,42,6,"2024-12-02"),
  (29,9,9,"2024-03-31"),
  (30,26,3,"2024-10-29"),
  (31,18,9,"2024-10-24"),
  (32,46,7,"2024-11-18"),
  (33,25,3,"2024-11-08"),
  (34,45,8,"2024-08-09"),
  (35,24,10,"2024-11-25"),
  (36,23,3,"2024-01-01"),
  (37,50,4,"2024-09-20"),
  (38,36,4,"2024-09-16"),
  (39,9,4,"2024-01-20"),
  (40,14,2,"2024-12-04"),
  (41,13,8,"2024-05-17"),
  (42,41,9,"2024-04-03"),
  (43,36,7,"2024-05-23"),
  (44,34,8,"2024-08-06"),
  (45,17,6,"2024-01-16"),
  (46,28,6,"2024-09-21"),
  (47,27,10,"2024-05-16"),
  (48,20,5,"2024-02-24"),
  (49,25,6,"2024-07-22"),
  (50,14,6,"2024-09-05"),
  (51,35,10,"2024-03-03"),
  (52,43,8,"2024-01-11"),
  (53,41,6,"2024-09-21"),
  (54,35,2,"2024-04-12"),
  (55,41,2,"2024-11-24"),
  (56,9,1,"2024-10-24"),
  (57,46,5,"2024-12-08"),
  (58,29,6,"2024-10-04"),
  (59,3,7,"2024-01-29"),
  (60,21,9,"2024-05-03"),
  (61,11,4,"2024-04-11"),
  (62,42,3,"2024-10-19"),
  (63,20,9,"2024-05-13"),
  (64,4,1,"2024-05-24"),
  (65,11,7,"2024-07-16"),
  (66,23,6,"2024-12-01"),
  (67,41,3,"2024-01-21"),
  (68,37,4,"2024-08-07"),
  (69,38,5,"2024-10-13"),
  (70,18,10,"2024-06-19"),
  (71,17,5,"2024-07-05"),
  (72,8,6,"2024-06-08"),
  (73,27,9,"2024-03-19"),
  (74,31,9,"2024-06-23"),
  (75,9,4,"2024-07-07"),
  (76,24,7,"2024-01-22"),
  (77,6,7,"2024-06-28"),
  (78,41,9,"2024-04-26"),
  (79,32,8,"2024-04-21"),
  (80,13,8,"2024-12-01"),
  (81,50,6,"2024-03-01"),
  (82,49,8,"2024-10-17"),
  (83,37,3,"2024-05-22"),
  (84,20,9,"2024-06-05"),
  (85,34,7,"2024-09-26"),
  (86,13,6,"2024-01-16"),
  (87,7,6,"2024-01-15"),
  (88,18,7,"2024-09-05"),
  (89,2,9,"2024-04-21"),
  (90,24,9,"2024-10-24"),
  (91,16,9,"2024-09-17"),
  (92,27,6,"2024-10-03"),
  (93,35,6,"2024-06-28"),
  (94,7,3,"2024-11-28"),
  (95,30,2,"2024-03-22"),
  (96,47,7,"2024-05-03"),
  (97,9,4,"2024-05-28"),
  (98,16,5,"2024-12-27"),
  (99,28,8,"2024-09-21"),
  (100,30,3,"2024-10-10");


SELECT *
FROM Appointments
LIMIT 15;

SELECT patientID, COUNT(appointmentID) AS all_appoinments
FROM Appointments
GROUP BY patientID;

SELECT *
FROM Appointments
WHERE patientID = 9;




CREATE TABLE Prescriptions(
	prescriptionID INTEGER NOT NULL, 
    appointmentID INTEGER NOT NULL,  
    medicationName VARCHAR(50) NOT NULL,
    PRIMARY KEY(prescriptionID),
    FOREIGN KEY(appointmentID) REFERENCES Appointments(appointmentID)
    ON DELETE CASCADE
);


INSERT INTO Prescriptions
VALUES
  (1,85,"neque"),
  (2,42,"non"),
  (3,9,"metus."),
  (4,1,"tempor"),
  (5,16,"dolor."),
  (6,94,"Phasellus"),
  (7,29,"aliquam"),
  (8,100,"lorem,"),
  (9,44,"dolor"),
  (10,34,"metus."),
  (11,29,"Duis"),
  (12,19,"laoreet"),
  (13,18,"ullamcorper."),
  (14,4,"in,"),
  (15,48,"Aenean"),
  (16,72,"Donec"),
  (17,72,"faucibus"),
  (18,42,"aliquam"),
  (19,58,"gravida."),
  (20,47,"mauris"),
  (21,80,"ac"),
  (22,99,"sapien."),
  (23,36,"eget"),
  (24,97,"placerat,"),
  (25,3,"velit"),
  (26,7,"ipsum"),
  (27,21,"nisl"),
  (28,12,"In"),
  (29,90,"Duis"),
  (30,13,"arcu"),
  (31,82,"ipsum"),
  (32,69,"faucibus"),
  (33,44,"malesuada"),
  (34,65,"ipsum."),
  (35,5,"commodo"),
  (36,71,"ipsum."),
  (37,62,"gravida"),
  (38,100,"semper."),
  (39,10,"ultricies"),
  (40,60,"lectus"),
  (41,81,"magna"),
  (42,74,"semper"),
  (43,5,"Ut"),
  (44,23,"a,"),
  (45,48,"commodo"),
  (46,9,"tincidunt,"),
  (47,26,"Suspendisse"),
  (48,94,"fringilla"),
  (49,31,"placerat"),
  (50,43,"facilisi."),
  (51,67,"nec"),
  (52,49,"at"),
  (53,28,"quam."),
  (54,34,"at,"),
  (55,90,"ullamcorper,"),
  (56,76,"varius."),
  (57,100,"erat."),
  (58,100,"Aliquam"),
  (59,63,"Quisque"),
  (60,12,"Cras"),
  (61,89,"vitae"),
  (62,52,"enim."),
  (63,78,"massa."),
  (64,41,"scelerisque,"),
  (65,50,"fringilla"),
  (66,30,"ligula."),
  (67,73,"gravida"),
  (68,75,"mauris"),
  (69,80,"Duis"),
  (70,72,"aliquet.");


SELECT *
FROM Prescriptions
LIMIT 15;




-- 1. For each doctor (by ID), count the number of appointments and order the result set by such a counter. 
SELECT A.doctorID, COUNT(A.appointmentId) AS number_of_appointments
FROM Appointments AS A
GROUP BY A.doctorID
ORDER BY COUNT(A.appointmentId) ASC
LIMIT 10;






-- 2. Display patients (by ID) who have multiple prescriptions (more than one prescription per patient) in your database.
SELECT A.patientID, COUNT(P.prescriptionID) AS num_of_prescriptions
FROM Prescriptions AS P, Appointments AS A
WHERE P.appointmentID=A.appointmentID
GROUP BY A.patientID
HAVING COUNT(P.prescriptionID) > 1
LIMIT 10;







-- 3. Display patients (by their ids and full names) who have no recorded appointments in the database.
SELECT patientID, firstName, lastName
FROM Patients
WHERE patientID NOT IN (
	SELECT patientID
    FROM Appointments
    );
    
    
    
    
-- . For the year of 2024, display the number of appointments per month.
SELECT LEFT(appointmentDate, 7) AS month_of_year, Count(appointmentID) AS number_of_appointments
FROM Appointments
WHERE appointmentDate LIKE '2024-%'
GROUP BY month_of_year
ORDER BY month_of_year ASC;


    


