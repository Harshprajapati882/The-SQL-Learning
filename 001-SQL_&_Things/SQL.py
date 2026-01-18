# SQL Code Examples

# Example of creating a table
import sqlite3

# Connect to a database (or create it)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Create a table
cursor.execute('''
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER
)
''')

# Example of inserting data
cursor.execute("INSERT INTO users (name, age) VALUES ('Alice', 30)")

# Example of querying data
cursor.execute('SELECT * FROM users')
rows = cursor.fetchall()
for row in rows:
    print(row)

# Commit changes and close the connection
conn.commit()
conn.close()
