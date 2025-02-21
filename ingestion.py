import os
import psycopg2
import pandas as pd

# PostgreSQL Configuration
DB_HOST = os.environ.get('DB_HOST', 'localhost')
DB_PORT = os.environ.get('DB_PORT', '5432')
DB_NAME = os.environ.get('DB_NAME', 'postgres')
DB_USER = os.environ.get('DB_USER', 'postgres')
DB_PASSWORD = os.environ.get('DB_PASSWORD', 'password')

# File paths
DDL_FILE = 'house_prices.sql'
CSV_FILE = 'train.csv'

# Step 1: Connect to PostgreSQL
try:
    conn = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    conn.autocommit = True
    cursor = conn.cursor()
    print("Connected to PostgreSQL")

    # Step 2: Execute DDL to create the table
    with open(DDL_FILE, 'r') as ddl:
        cursor.execute(ddl.read())
    print("Table 'house_prices' created or already exists.")

    # Step 3: Load CSV data using pandas
    df = pd.read_csv(CSV_FILE)

    # Convert all column names to lowercase to match the database schema
    df.columns = [col.lower() for col in df.columns]

    # Handle potential issues with NaN values (PostgreSQL doesn't accept NaN for integer columns)
    df = df.fillna(0)

    # Step 4: Upload data to PostgreSQL using COPY
    from io import StringIO
    buffer = StringIO()
    df.to_csv(buffer, index=False, header=False)
    buffer.seek(0)

    cursor.copy_from(buffer, 'house_prices', sep=',')
    conn.commit()

    print("Data uploaded successfully!")

except Exception as e:
    print(f"Error: {e}")

finally:
    if cursor:
        cursor.close()
    if conn:
        conn.close()
    print("PostgreSQL connection closed.")
