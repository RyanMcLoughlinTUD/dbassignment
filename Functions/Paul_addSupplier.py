import psycopg2
import getpass

try:
    connection = psycopg2.connect(
        host="localhost",
        user="paul",
        password=getpass.getpass(prompt='Password '),
        port="54321",
        database="postgres"
    )

    cursor = connection.cursor()
    
    name = input("Enter the supplier name: ")
    address = input("Enter the supplier address: ")
    phone = input("Enter the supplier phone number: ")
    
    cursor.callproc("addsupplierdetails", (name, address, phone))
    
    result = cursor.fetchone()
    print(result)

except (Exception, psycopg2.DatabaseError) as error:
    print("Error while connecting to PostgreSQL or calling the function:", error)

finally:
    if connection:
        connection.commit()
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
    else:
        print("Terminating")

