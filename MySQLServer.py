import mysql.connector
from mysql.connector import Error

def create_database():
    cursor = None
    connection = None
    try:
        # Establish the connection to MySQL
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='@218006680Kgn'
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it doesn't already exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
            print("Database 'alx_book_store' created successfully!")
            
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        if cursor is not None:
            cursor.close()
        if connection is not None:
            connection.close()

if __name__ == "__main__":
    create_database()
