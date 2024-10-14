-- Use the database passed as an argument
USE alx_book_store;

-- Query to get full description of the Books table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH AS max_length, 
    IS_NULLABLE, 
    COLUMN_DEFAULT 
FROM 
    information_schema.COLUMNS 
WHERE 
    TABLE_NAME = 'Books' 
    AND TABLE_SCHEMA = 'alx_book_store';
