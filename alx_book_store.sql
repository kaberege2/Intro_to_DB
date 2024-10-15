import mysql.connector

--# Establish a connection to MySQL
connection = mysql.connector.connect(
    host='localhost',     
    user='root',   
    password='@218006680Kgn' 
)

cursor = connection.cursor()

--# Create the database
cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
cursor.execute("USE alx_book_store;")
connection.database = "alx_book_store"

--# Create the Authors table
cursor.execute("""
    CREATE TABLE IF NOT EXISTS Authors (
        author_id INT AUTO_INCREMENT PRIMARY KEY,
        author_name VARCHAR(215) NOT NULL
    );
""")

--# Create the Books table
cursor.execute("""
    CREATE TABLE IF NOT EXISTS Books (
        book_id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(130) NOT NULL,
        author_id INT,
        price DOUBLE NOT NULL,
        publication_date DATE,
        FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    );
""")

--# Create the Customers table
cursor.execute("""
    CREATE TABLE IF NOT EXISTS Customers (
        customer_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_name VARCHAR(215) NOT NULL,
        email VARCHAR(215) NOT NULL,
        address TEXT
    );
""")

--# Create the Orders table
cursor.execute("""
    CREATE TABLE IF NOT EXISTS Orders (
        order_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_id INT,
        order_date DATE,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    );
""")

--# Create the Order_Details table
cursor.execute("""
    CREATE TABLE IF NOT EXISTS Order_Details (
        orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
        order_id INT,
        book_id INT,
        quantity DOUBLE NOT NULL,
        FOREIGN KEY (order_id) REFERENCES Orders(order_id),
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
    );
""")

--# Commit the changes and close the connection
connection.commit()
cursor.close()
connection.close()

print("Database and tables created successfully!")
