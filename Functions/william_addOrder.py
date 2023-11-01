import psycopg2, getpass, pandas as pd
from psycopg2 import Error
try:
    connection = psycopg2.connect(
        host="147.252.250.51", user = "C21437002",
        password=getpass.getpass(),
        port="5432", database="postgres")

    cursor = connection.cursor()
    
    email = input("Enter account email: ")
    pcname = input("Enter name of pc: ")

    cursor.execute("CALL addOrder(email,pcname)")

    connection.commit()

except (Exception, Error) as error:
    print("Error while connecting to PostgreSQL:", error)
