import mysql.connector

my_connection = mysql.connector.connect(user='root',
                                        password='qafur2002',
                                        host='localhost',
                                        database='myUniversity')

# print(my_connection)


cursorObject = my_connection.cursor()

cursorObject.execute("INSERT INTO students VALUES (10, 'Gafur Mammadov', 'Computer Science', 3.6, 2025);")
my_connection.commit()