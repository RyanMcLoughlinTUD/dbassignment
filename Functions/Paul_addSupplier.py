import psycopg2
import getpass

try:
    connection = psycopg2.connect(
        host="147.252.250.51",
        user="C21359216",
        password=getpass.getpass(prompt='Password: '),
        port=5432,
        database="postgres"
    )

    cursor = connection.cursor()

    name = input("Enter the supplier name: ")
    address = input("Enter the supplier address: ")
    phone = input("Enter the supplier phone number: ")

    cursor.execute("set search_path to \"Cust857B\"")
    cursor.callproc("addSupplierDetails", (name, address, phone))

    result = cursor.fetchone()
    print("Function result: ", result)

except (Exception, psycopg2.DatabaseError) as error:
    print("Error while connecting to PostgreSQL or calling the function: ", error)

finally:
    if connection:
        connection.commit()
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
    else:
        print("Terminating")
