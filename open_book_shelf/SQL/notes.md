## Notes on the Intro to SQL book at LS



Source: https://launchschool.com/books/sql

Useful Resources:

* PostgreSQL (`psql`) terminal documentation 
  * https://www.postgresql.org/docs/9.0/app-psql.html



### Summary



### Notes

* What command can we use to open the psql console and open the database 'postgres'?
  * `psql postgres`

* Two types of commands you can issue from the `psql` console prompt:
  * `psql` console meta-commands
  * run SQL statements using standard SQL syntax

* How many separate sub-languages can we think of SQL as comprising, and what are they?
  * DDL: Data Definition Language
  * DML: Data Manipulation Language
  * DCL: Data Control Language
    * Think of the `Owner` information when using the `\dt` meta command.
* Database names should be written in **snake_case**.
* What are some common Postgres keys/constraints?
  * `NOT NULL constraint`, `UNIQUE constraint`,  `DEFAULT constraint`, `PRIMARY Key`, `FOREIGN Key`
* What is the basic format of an `ALTER TABLE` statement?
  * `ALTER TABLE table_to_change HOW TO CHANGE THE TABLE additional arguments`
* What is the basic format for adding a column constraint (`NOT NULL`, `UNIQUE`, etc)?
  * `ALTER TABLE table_name ALTER COLUMN column_name SET constraint clause`	
* What is the basic format for removing a column constraint?
  * `ALTER TABLE table_name DROP CONSTRAINT constraint_name`
* What is the basic format for adding a table constraint?
  * `ALTER TABLE table_name ADD CONSTRAINT constraint_name constraint clause`
* How can we add a column to an existing table?
  * Use an `ADD COLUMN` clause in an `ALTER TABLE` statement
* How can we remove a column from an existing table?
  * Use a `DROP COLUMN` clause in an `ALTER TABLE` statement.

| Command-line Command | Notes                                                        |
| :------------------- | :----------------------------------------------------------- |
| `psql -d sql_book`   | starts a `psql` session and connect to the *sql_book* database (specified by `-d`) |
| `createdb sql_book`  | creates a new database called *sql_book* using a psql utility |
| `dropdb my_database` | permanently deletes the database named *my_database* and all its data |

| PSQL Command                         | Notes                                                        |
| :----------------------------------- | :----------------------------------------------------------- |
| `\l` or `\list`                      | displays all databases                                       |
| `\c sql_book` or `\connect sql_book` | connects to the *sql_book* database                          |
| `\q`                                 | exits the PostgreSQL session and return to the command-line prompt |
| `\dt`                                | lists all tables in the current database connection          |
| `\d [table]`                         | describe a table-- columns, datatypes, properties            |

| SQL Statement                                                | Notes                                                        |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| `CREATE DATABASE sql_book`                                   | creates a new database called *sql_book*                     |
| `DROP DATABASE my_database`                                  | permanently deletes the database named *my_database* and all its data |
| ```CREATE TABLE some_table(column_1_name column_1_data_type [constraints, ...]);``` | creates a table `some_table` in the currently connected database, with columns and constraints |
| `ALTER TABLE tablename`                                      | change the table in some way... `RENAME TO new_table`, `RENAME COLUMN _ TO _`, `ALTER COLUMN _ TYPE _`, etc |

| Column Data Type          | Description                                                  |
| :------------------------ | :----------------------------------------------------------- |
| serial                    | This data type is used to create identifier columns for a PostgreSQL database. These identifiers are integers, auto-incrementing, and cannot contain a null value. |
| char(N)                   | This data type specifies that information stored in a column can contain strings of up to N characters in length. If a string less than length N is stored, then the remaining string length is filled with space characters. |
| varchar(N)                | This data type specifies that information stored in a column can contain strings of up to N characters in length. If a string less than length N is stored, then the remaining string length isn't used. |
| boolean                   | This is a data type that can only contain two values "true" or "false". In PostgreSQL, boolean values are often displayed in a shorthand format, t or f |
| integer or INT            | An integer is simply a "whole number." An example might be 1 or 50, -50, or 792197 depending on what storage type is used. |
| decimal(precision, scale) | The decimal type takes two arguments, one being the total number of digits in the entire number on both sides of the decimal point (the precision), the second is the number of the digits in the fractional part of the number to the right of the decimal point (the scale). |
| timestamp                 | The timestamp type contains both a simple date and time in YYYY-MM-DD HH:MM:SS format. |
| date                      | The date type contains a date but no time.                   |

| Action                           | Command                                                      | Notes                                                        |
| :------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| Add a column to a table          | ALTER TABLE table_name ADD COLUMN column_name data_type CONSTRAINTS; | Alters a table by adding a column with a specified data type and optional constraints. |
| Alter a column's data type       | ALTER TABLE table_name ALTER COLUMN column_name TYPE data_type; | Alters the table by changing the datatype of column.         |
| Rename a table                   | ALTER TABLE table_name RENAME TO new_table_name;             | Changes the name of a table in the currently connected to database. |
| Rename a column within a table   | ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name; | Renames a column of the specified table.                     |
| Add column constraint            | ALTER TABLE table_name ALTER COLUMN column_name SET constraint clause; | Adds a specified constraint to the specified table column.   |
| Add table constraint             | ALTER TABLE table_name ADD CONSTRAINT constraint_name constraint clause; | Adds a specified constraint to the specified table.          |
| Remove a table constraint        | ALTER TABLE table_name DROP CONSTRAINT constraint_name;      | Removes a constraint from the specified table.               |
| Remove a column constraint       | ALTER TABLE table_name ALTER COLUMN column_name DROP CONSTRAINT; | Removes a constraint from the specified column. This syntax is necessary for `NOT NULL` constraints, which aren't specifically named. |
| Remove a column from a table     | ALTER TABLE table_name DROP COLUMN column_name;              | Removes a column from the specified table.                   |
| Delete a table from the database | DROP TABLE table_name;                                       | Permanently deletes the specified table from its database.   |



### Vocab

* Unstructured data
  * Data that contains information without any structure, such as content inside meails or books or images.
* Structured data
  * Data that is stored in a structured way, such as in a table or a spreadsheet, allowing us to find the data more easily and manage it better.
* Relational database management system
  * A software application, or system, for managing relational databases.
  * Allows a user, or another application, to interact with a database by issuing commands using syntax that conforms to a certain set of conventions or standards.
* Relational database
  * A database organized according to the *relational model* of data-- defining a set of relations and describing the relationships (connections) between them in order to determine how the data stored in them can interact.
* Relation
  * A set of individual but related data entries; analogous to a database table.
* SQL Statement
  * A SQL command used to access/use the database or the data within that database via the SQL language.
* SQL query
  * A subset of a "SQL statement". A query is a way to search or lookup data within a database, as opposed to updating or changing data.
* Client-Server Architecture
  * Architecture used by most relational databases-- issue a request (or declaration) and receive a response in return.
  * With a database: we connect to the server (like a PostgreSQL server) using a client (like a PostgreSQL client). The client transmits commands to the server and the server sends the result or the data back.
  * ![Client server architecture](https://d186loudes4jlv.cloudfront.net/sql/images/interacting_with_postgresql/client-server-msg.png)
* **SQL Sub-languages**
  * DDL: Data Definition Language
    * Used to define the structure of a database and the tables and columns within it (the schema).
  * DML: Data Manipulation Language
    * Used to retrieve or modify data stored in a database. `SELECT` queries are part of DML.
  * DCL: Data Control Language
    * Used to determine what various users are allowed to do when interacting with a database.
* Database schema
  * The skeleton structure that represents the logical view of the entire database, defining how the data is organized and how the relations among them are associated. Ex.: names of tables, table columns, data types of columns, constraints on the columns.
* 



### Anki

