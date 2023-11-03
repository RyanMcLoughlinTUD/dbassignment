import psycopg2
import getpass

try:
    connection = psycopg2.connect(
        host="localhost",##insert tud postgres server address here
        user="C21431604",
        password=getpass.getpass(prompt='Password '),
        port="54321",
        database="postgres"
    )

    cursor = connection.cursor()
    PCname = input("Enter the PC model name: ")
    cursor.callproc("makePC", (PCname))
    
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