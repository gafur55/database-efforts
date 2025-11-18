import mysql.connector

my_connection = mysql.connector.connect(
    user='root',
    password='qafur2002',
    host='localhost',
    database='MyCompany'
)

cursorObject = my_connection.cursor()

#-----------------------=------Customers data insertion-----------------------------
# with open("Data/ecommerce_customers.csv", 'r') as file:
#     lines = file.readlines()
#     lines.pop(0)


# insert_query = "INSERT INTO Customers VALUES (%s, %s, %s, %s, %s, %s);"
# for line in lines:
#     values = line.strip().split(',')

#     cid = int(values[0])
#     FullName = values[1]
#     Email = values[2]
#     Age = int(values[3])
#     Address = values[4]
#     State = values[5]

#     parsed_values = (cid, FullName, Email, Age, Address, State)
    
# #     # print(parsed_values)
#     cursorObject.execute(insert_query, parsed_values)
#     my_connection.commit()


#---------------------------------Products data insertion---------------------------------
# with open("Data/ecommerce_products.csv", 'r') as file:
#     lines = file.readlines()
#     lines.pop(0)

# insert_query = "INSERT INTO Products VALUES (%s, %s, %s, %s);"
# for line in lines:
#     values = line.strip().split(',')

#     pid = int(values[0])
#     pname = values[1]
#     vendor = values[2]
#     available_quant = values[3]
    

#     parsed_values = (pid, pname, vendor, available_quant)
    
# #     # print(parsed_values)
#     cursorObject.execute(insert_query, parsed_values)
#     my_connection.commit()



#-------------------------------------Orders data insertion---------------------------
# with open("Data/ecommerce_orders.csv", 'r') as file:
#     lines = file.readlines()
#     lines.pop(0)

# insert_query = "INSERT INTO Orders VALUES (%s, %s, %s, %s, %s, %s);"
# for line in lines:
#     values = line.strip().split(',')

#     oid = int(values[0])
#     pid = int(values[1])
#     cid = int(values[2])
#     order_quantity = int(values[3])
#     order_date = values[4]
#     total_cost = float(values[5])
    
#     parsed_values = (oid, pid, cid, order_quantity, order_date, total_cost)
# #     # print(parsed_values)
#     cursorObject.execute(insert_query, parsed_values)
#     my_connection.commit()



# #---------------------------------TASK 3--------------------------------------------

#1st Query
query = "select  Products.Vendor, count(distinct Products.PID) AS number_of_unique_products, SUM(Products.AvailableQuantity) as TotalAvailable from Products group by Products.Vendor having count(distinct Products.PID) > 5;"

cursorObject.execute("select  Products.Vendor, count(distinct Products.PID) AS number_of_unique_products, SUM(Products.AvailableQuantity) as TotalAvailable from Products group by Products.Vendor having count(distinct Products.PID) > 5;")
allResults = cursorObject.fetchall()
print("\n\nFirst Query")
counter = 1
for line in allResults:
    print(f"{counter}. {line[0]} {line[1]} {line[2]}")
    counter += 1


#2nd Query
cursorObject.execute("select Distinct Customers.FullName, Customers.State, Customers.Age from Customers, Orders where Orders.TotalCost > 1499 AND Orders.CID=Customers.CID;")
allResults = cursorObject.fetchall()
print("\n\n2nd Query")
counter = 1
for line in allResults:
    print(f"{counter}. {line[0]} {line[1]} {line[2]}")
    counter += 1


#For each available room type, display the type of the room, the number of reservations made, and the average number of nights
cursorObject.execute("select * from Orders where Year(Orders.OrderDate)='2024' AND Orders.TotalCost> (select Avg(TotalCost) from Orders) Order by TotalCost Desc;")
allResults = cursorObject.fetchall()
print("\n\n3rd Query")
counter = 1
for line in allResults:
    print(f"{counter}. {line[0]} {line[1]} {line[2]} {line[3]} {line[4]} {line[5]}")
    counter += 1