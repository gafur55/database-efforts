CREATE DATABASE MyHotel;
USE MyHotel;

CREATE TABLE Guests(
	GuestID INTEGER PRIMARY KEY, 
    First_Name VARCHAR(100), 
    Last_Name VARCHAR(100), 
    Email VARCHAR(100), 
    Age INTEGER, 
    State VARCHAR(100)
);

SELECT * from Guests Limit 10;

CREATE TABLE Rooms(
	RoomNumber INTEGER PRIMARY KEY, 
    RoomType VARCHAR(100),
    FloorNumber INTEGER
);

select * from Rooms Limit 10;

CREATE TABLE Reservations(
	ReservationID INTEGER PRIMARY KEY, 
    GuestID INTEGER,
    RoomNumber INTEGER,
    CheckInDate DATE,
    NumberOfNights INTEGER,
    TotalCost DECIMAL(10,10),
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID) ON DELETE CASCADE,
    FOREIGN KEY (RoomNumber) REFERENCES Rooms(RoomNumber) ON DELETE CASCADE
);

ALTER TABLE Reservations MODIFY TotalCost DECIMAL(10,2);

select * from Reservations Limit 10;




SELECT Guests.First_Name, Guests.Last_Name, Guests.State
FROM Guests, Rooms, Reservations
WHERE Rooms.RoomType="Suite" AND Reservations.GuestID=Guests.GuestID AND 
		Reservations.RoomNumber=Rooms.RoomNumber;



#Display guests -by full name and email- who are from the states of Illinois, 
#Indiana, and Michigan with ages between 25 (included) and 30(included)

select Guests.First_Name, Guests.Last_Name, Guests.Email 
from Guests 
where Guests.State='Illinois' OR Guests.State='Indiana' OR 
	  Guests.State='Michigan' AND Guests.Age<31 AND Guests.Age>24;


#For each available room type, display the type of the room, 
#the number of reservations made, and the average number of nights
select Rooms.RoomType, Count(Reservations.ReservationID) AS number_of_reservs, 
		AVG(Reservations.NumberOfNights) AS average_nights 
from Rooms, Reservations 
where Reservations.RoomNumber=Rooms.RoomNumber  
group by Rooms.RoomType;













