import psycopg2, getpass, pandas as pd
from psycopg2 import Error
try:
    connection = psycopg2.connect(
        host="localhost", user = "BUILDER",
        password=getpass.getpass(),
        port="5432", database="postgres")

    cursor = connection.cursor()

    cursor.execute("CALL add_sale('F11111', '1', '2')")

    connection.commit()

except (Exception, Error) as error:
    print("Error while connecting to PostgreSQL:", error)
