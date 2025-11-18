import mysql.connector

my_connection = mysql.connector.connect(
    user='root',
    password='qafur2002',
    host='localhost',
    database='MyHotel'
)

cursorObject = my_connection.cursor()

#-----------------------=------Guests data insertion-----------------------------
# with open("Data/hotel_guests.csv", 'r') as file:
#     lines = file.readlines()
#     lines.pop(0)

# prefixes = ["mr", "mrs", "ms", "miss", "dr", "prof", "sir", "madam"]
# suffixes = ["phd", "md", "jr", "sr", "ii", "iii", "iv"]
# insert_query = "INSERT INTO Guests VALUES (%s, %s, %s, %s, %s, %s);"
# for line in lines:
#     values = line.strip().split(',')

#     GuestID = int(values[0])
#     FullName = values[1]
#     Email = values[2]
#     Age = int(values[3])
#     Address = values[4]
#     State = values[5]
    
#     name_parts = FullName.split()
#     if name_parts and name_parts[0].replace('.', '').lower() in prefixes:
#         name_parts.pop(0)
#     if name_parts and name_parts[-1].replace('.', '').lower() in suffixes:
#         name_parts.pop(-1)
#     first_name = name_parts[0]
#     last_name = name_parts[1]

#     parsed_values = (GuestID, first_name, last_name, Email, Age, State)
    
#     # print(parsed_values)
#     cursorObject.execute(insert_query, parsed_values)
#     my_connection.commit()


#---------------------------------Rooms data insertion---------------------------------
# with open("Data/hotel_rooms.csv", 'r') as file:
#     lines = file.readlines()
#     lines.pop(0)

# insert_query = "INSERT INTO Rooms VALUES (%s, %s, %s);"
# for line in lines:
#     values = line.strip().split(',')

#     room_number = int(values[0])
#     room_type = values[1]
#     floor_number = int(values[2])
    

#     parsed_values = (room_number, room_type, floor_number)
    
#     # print(parsed_values)
#     cursorObject.execute(insert_query, parsed_values)
#     my_connection.commit()



#-------------------------------------Reservations data insertion---------------------------
# with open("Data/hotel_reservations.csv", 'r') as file:
#     lines = file.readlines()
#     lines.pop(0)

# insert_query = "INSERT INTO Reservations VALUES (%s, %s, %s, %s, %s, %s);"
# for line in lines:
#     values = line.strip().split(',')

#     reservation_id = int(values[0])
#     guest_id = int(values[1])
#     room_num = int(values[2])
#     check_in_date = values[3]
#     num_of_night = int(values[4])
#     total_cost = float(values[5].replace('$', ''))
    
#     parsed_values = (reservation_id, guest_id, room_num, check_in_date, num_of_night, total_cost)
#     # print(parsed_values)
#     cursorObject.execute(insert_query, parsed_values)
#     my_connection.commit()



#---------------------------------TASK 3--------------------------------------------

#Display guests -by full name and state- who reserved rooms of type “Suite”
query = 'SELECT Guests.First_Name, Guests.Last_Name, Guests.State' \
        'FROM Guests, Rooms, Reservations' \
        'WHERE Rooms.RoomType="Suite" AND Reservations.GuestID=Guests.GuestID AND Reservations.RoomNumber=Rooms.RoomNumber' 

cursorObject.execute('''
                     SELECT Guests.First_Name, Guests.Last_Name, Guests.State 
                     FROM Guests, Rooms, Reservations 
                     WHERE Rooms.RoomType='Suite' AND Reservations.GuestID=Guests.GuestID AND  Reservations.RoomNumber=Rooms.RoomNumber;
                     ''')
allResults = cursorObject.fetchall()
print("\n\nGuests who reserved rooms of type “Suite”")
counter = 1
for line in allResults:
    print(f"{counter}. {line[0]} {line[1]} {line[2]}")
    counter += 1


#Display guests -by full name and email- who are from the states of Illinois, Indiana, and Michigan with ages between 25 (included) and 30(included)
cursorObject.execute("select Guests.First_Name, Guests.Last_Name, Guests.Email from Guests where Guests.State='Illinois' OR Guests.State='Indiana' OR Guests.State='Michigan' AND Guests.Age<31 AND Guests.Age>24;")
allResults = cursorObject.fetchall()
print("\n\nFrom the states of Illinois, Indiana, and Michigan with ages between 25 (included) and 30(included)")
counter = 1
for line in allResults:
    print(f"{counter}. {line[0]} {line[1]} {line[2]}")
    counter += 1


#For each available room type, display the type of the room, the number of reservations made, and the average number of nights
cursorObject.execute("select Rooms.RoomType, Count(Reservations.ReservationID) AS number_of_reservs, AVG(Reservations.NumberOfNights) AS average_nights from Rooms, Reservations where Reservations.RoomNumber=Rooms.RoomNumber  group by Rooms.RoomType;")
allResults = cursorObject.fetchall()
print("\n\nType of the room, the number of reservations made, and the average number of nights")
counter = 1
for line in allResults:
    print(f"{counter}. {line[0]} {line[1]} {line[2]}")
    counter += 1