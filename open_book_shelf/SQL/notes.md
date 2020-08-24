## Notes on the Intro to SQL book at LS



Source: https://launchschool.com/books/sql

Useful Resources:

* PostgreSQL (`psql`) terminal documentation 
  * https://www.postgresql.org/docs/9.0/app-psql.html
* LS180 SQL exercises
  * https://launchschool.com/exercises#180_sql_fundamentals
* More practice:
  * https://sqlbolt.com/
  * https://pgexercises.com/
  * http://sqlfiddle.com/



### Summary

* Schema
  * How to create/modify a database and tables within it (`CREATE`, `ALTER`, `DROP`)
  * Variety of data types
  * Keys and constraints
* Data
  * CRUD operations form the core of working with data in SQL: `INSERT`, `SELECT`, `UPDATE`, and `DELETE`
    * How do constraints determine what data can/cannot be added to a table?
    * How are `WHERE` clauses used to filter data?
    * How are `ORDER BY` clauses used to sort data?
    * How are `GROUP BY` clauses used to aggregate data?
    * Types of operators available: string matching, logical, comparison
    * How can we change specific data values in existing rows using `UPDATE`?
    * How can we remove entire rows using `DELETE`?
    * Why should we target only specific rows for `UPDATE` / `DELETE` queries?
* Multiple Tables
  * How can we deal with *redundancy* and *data integrity* issues in SQL?
    * What is *normalization*?
  * What is an *entity relationship diagram* / ERD?
  * What is the difference between a *Primary Key* and a *Foreign Key* and what is each used for?
  * How can we query data across multiple tables using `JOIN` statements?
    * What is a *join table*?

### Notes

* What command can we use to open the psql console and open the database 'postgres'?
  
* `psql postgres`
  
* Two types of commands you can issue from the `psql` console prompt:
  * `psql` console meta-commands
  * run SQL statements using standard SQL syntax

* How many separate sub-languages can we think of SQL as comprising, and what are they?

  * DDL: Data Definition Language
    * Deals with the level of the table structure (schema)-- columns, constraints
    * `DEFAULT`: default value used if a value is not specified for a column in an `INSERT` statement
    * Constraints: `NOT NULL`, `UNIQUE`, `CHECK`
  * DML: Data Manipulation Language
    * Add, query, change, and remove data (CRUD operations -- create/read/update/delete)
    * Data Manipulation Statements have four distinct types: `INSERT`, `SELECT`, `UPDATE`, and `DELETE`
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

* What is the general form of an `INSERT` SQL statement?

  * ```SQL
    INSERT INTO table_name (column1_name, column2_name, ...)
      VALUES (data_for_column1, data_for_column2, ...);
    ```

  * ```SQL
    /* ONE ROW: single tuple */
    INSERT INTO users (full_name, enabled)
    	VALUES ('John Smith', false);
    /* > INSERT 0 1 */
    ```

  * ```SQL
    /* MULTIPLE ROWS: comma separated tuples */
    INSERT INTO users (full_name)
    	VALUES ('Jane Smith'), ('Harry Potter');
    /* > INSERT 0 2 */
    ```

  * The tablename we wish to store data in;

  * The names of the columns we're adding data to;

  * The values we wish to store in the columns listed directly after the table name.

* How do we indicate to Postgres that we'd like to use the default function set for a column?

  * pass `DEFAULT` as the `VALUES` arg corresponding to the column name

* What does each element of the following message returned after a successful `INSERT` represent?

  * `INSERT 0 1`-- `0` is the `oid`, `1` is the number of rows inserted

* What is the Three State Boolean problem / Three Valued-logic problem?

  * What issue is potentially encountered when we don't set a `NOT NULL` constraint on a `boolean` type column?

* SQL statements are made up of *identifiers* and *keywords*. Ex.: `SELECT enabled, full_name FROM users;`

  * Identifiers: `enabled, full_name, users`
  * Keywords: `SELECT, FROM`
  * Avoid naming columns the same as keywords, to avoid errors-- if unavoidable, the *identifier* can be double-quoted in your query like so: `"year"`

* What clauses might we use with a `SELECT` query?

  * `WHERE (condition)`, `ORDER BY column_1 [ASC/DESC], column_2 [ASC/DESC], ...`
  * `LIMIT` (return `n` results), `OFFSET` (skip first `n` rows), `DISTINCT` (limit to unique results)
    * **IMPORTANT:** The `LIMIT` and `OFFSET` clauses of `SELECT` are the basis for **pagination** in apps.
  * Columns can be used by `WHERE` / `ORDER BY`, etc. even if they aren't included in `SELECT`ed columns

* What kinds of operators can we use to construct our `WHERE` clauses?

  * Comparison: `= < > <= >= !=`
  * Comparison predicates: `IS NULL`, `IS NOT NULL`, `BETWEEN`, `NOT BETWEEN`, `IS DISTINCT FROM`, `IS NOT DISTINCT FROM`
    * Not used like comparison operators (e.g. `WHERE x = NULL`, rather: `WHERE x IS NULL`)
  * Logical: `AND`, `OR`, `NOT` (not commonly used)
  * String Matching: `WHERE full_name LIKE '%Smith'` (also can use `SIMILAR TO` w/ SQL Regex)
    * `%`: multi character wildcard
    * `_`: single character wildcard

* When would we use `IS DISTINCT FROM` instead of `!=`?

  * `IS DISTINCT FROM` excludes `NULL` values automatically

* What kinds of SQL functions are commonly used?

  * String: 
    * `length`: `SELECT length(full_name)`,
    * `trim`: (can be used to delete whitespace) `SELECT trim(leading ' ' from full_name)`
  * Date/Time:
    * `date_part` selects y/m/d/h/s: `SELECT full_name, date_part('year', last_login) FROM users;`
    * `age` calculates `datetime` elapsed: `SELECT full_name, age(last_login) FROM users;`
  * Aggregate: `count`, `sum`, `min`, `max`, `avg`
    * Typically used with **GROUP BY** clauses
      * `SELECT enabled, count(id) FROM users GROUP BY enabled;`

* How do we update data in an existing record?

  * ```sql
    /* set columns to these values when an expression evaluates to true */
    /* without a WHERE clause, every record will be updated -- test w/ a SELECT first */
    UPDATE table_name SET [col1 = val1, ...]
    WHERE (expression);	
    ```

* What statement would we write if we wanted to set the entire `enabled` column in a table `users` to `false`?

  * ```sql
    UPDATE users SET enabled = false; /* no WHERE clause-- every record updated */
    ```

* How do we delete existing records?

  * ```sql
    DELETE FROM table_name WHERE (expression);
    ```

  * ```sql
    DELETE FROM users
    WHERE full_name='Harry Potter' and id > 3;
    ```

* What is the core difference between `UPDATE` and `DELETE` statements?

  * `UPDATE` can update individual columns within multiple rows, `DELETE` deletes entire rows

  * ```sql
    UPDATE table_name SET col1 = NULL
    WHERE (expression);
    ```

* What do we call the process of splitting up data across multiple tables, creating relationships between them, in order to remove redundancy/duplication and improve data integrity?

  * What is *normalization* in the context of SQL / table relations?

* What is the reason for normalizing a database?

  * Reducing data redundancy and improving data integrity.

* What is the mechanism by which we normalize a database?

  * Arranging data in multiple tables and defining relationships between them.

* What are the two high-level components of the database design process?

  * Defining **entities** and designing **relationships** between them.

* What is an **Entity Relationship Diagram (ERD)**?

  * What do we call a commonly used tool within database design, consisting of a graphical representation of entities and their relationships to each other?

* What do we call a special type of constraint used to establish relationships and uniqueness in database?

  * What is a database **key**?

* What is the difference between a **Primary Key** and a **Foreign Key**?

  * What do we call a key that acts as a unique identifier for a row of data? What do we call a key that allows us to associate a row in one table to a row in another table?

* What two other constraints combined are essentially identical to making a column a Primary Key?

  * What other constraint is mimicked by adding `NOT NULL` and `UNIQUE` constraints to a given column?

* How do we establish a column as the primary key for a table?

  * ```sql
    ALTER TABLE users ADD PRIMARY KEY (id);
    ```

* How do we set a column in a table as a Foreign Key, referencing another table's Primary Key column?

  * ```sql
    FOREIGN KEY (fk_col_name) REFERENCES target_table_name(pk_col_name);
    ```

* What is **referential integrity**?

  * What do we call the assurance that a column value within a record must reference an existing value, throwing an error if it does not.

* How is **referential integrity** enforced in PostgreSQL?

  * Why will PostgreSQL not allow you to add a value to the Foreign Key column of a table if the Primary Key column of the table it is referencing does not already contain that value?

* What is *modality* in the context of entity relationships?

  * [N/A]

* What types of entity relationships do we have?

  * **One to One**

    * A one-to-one relationship between two entities exists when a particular entity instance exists in one table, and it can have only one associated entity instance in another table.

      * Ex. A user can have only one email address, and an email address belongs to only one user (a bit contrived/simplified-- users can have more than one email address)

    * Implemented in a db like so: the `id` that is the `PRIMARY KEY` of table 1 is used as both the `FOREIGN KEY` *and*  the `PRIMARY KEY` of table 2.

      * ```sql
        CREATE TABLE addresses (
        /* ... */
          PRIMARY KEY (user_id),
          FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
        );
        ```

    * What does `ON DELETE CASCADE` do?

      * If the row being referenced is deleted, the row referencing it is also deleted.
      * There are alternatives to `CASCADE` such as `SET NULL` or `SET DEFAULT`

  * **One to Many**

    * A one to many relationship exists between two entities if an entity instance in one of the tables can be associated with multiple records (entity instances) in the other table.

      * The opposite relationship (many to one) does not exist; that is, each entity instance in the second table can only be associated with one entity instance in the first table. 
      * **Ex.**: a review belongs to only one book. A book has many reviews.

    * ```sql
      CREATE TABLE books (
        id serial,
        /* ... */
        PRIMARY KEY (id) /* referenced as FOREIGN KEY below */
      );
      
      CREATE TABLE reviews (
        id serial,
        book_id integer NOT NULL,
        /* ... */
        PRIMARY KEY (id),
        FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE /* books ID */
        /*
        since book_id is foreign, not bound by UNIQUE constraint of PRIMARY KEY
        that means that the id from books can reappear (1 book : many reviews)
        */
      );
      ```

    * ![One-to-Many schema](https://d186loudes4jlv.cloudfront.net/sql/images/table_relationships/one-to-many.png)

  * **Many to Many**

    * A many-to-many relationship exists between two entities if for one entity instance there may be multiple records in the other table, and vice versa. (Can be thought of as two one to many relationships, e.g. `checkouts` and `users`, `checkouts` and `books`, etc.)

      * **Ex.**: A user can check out many books. A book can be checked out by many users (over time).
      * ![Many-to-Many cross-reference table](https://d186loudes4jlv.cloudfront.net/sql/images/table_relationships/checkouts-table-references.png)

    * ```sql
      CREATE TABLE checkouts (
        id serial,
        user_id int NOT NULL,
        book_id int NOT NULL,
        checkout_date timestamp,
        return_date timestamp,
        PRIMARY KEY (id),
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
        FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
      );
      ```

* What is a SQL Join?

  * Clauses in SQL statements that link two tables together, usually based on the keys that define the relationship between those two tables.

* What are the kinds of SQL joins?

  * `INNER JOIN`: a result set containing the common elements of the tables (intersection where they match on the joined condition); the default assumption in PSQL if join type isn't specified

    * ```sql
      SELECT users.*, addresses.*
      FROM users
      INNER JOIN addresses
      ON (users.id = addresses.user_id);
      ```

  * `LEFT JOIN` / `RIGHT JOIN`: takes all the rows from one table (either left or right) and joins it with a second table, even if there are no matching rows in the second table (will just fill the empty values with `NULL`)

    * ```sql
      SELECT users.*, addresses.*
      FROM users
      [LEFT/RIGHT] JOIN addresses
      ON (users.id = addresses.user_id);
      ```

  *  `FULL JOIN`: both a `LEFT` and `RIGHT` join simultaneously-- less common

  * `CROSS JOIN`: aka a Cartesian JOIN, returns all combinations of table rows (or the *cross product*), doesn't need an `ON` clause since it involves every record.

* What is the general syntax of a `JOIN` statement?

  * ```sql
    SELECT [table1.col1, table1.col2, ...] FROM table1
    join_type JOIN table2 ON (join_condition);
    ```

  * ```sql
    SELECT colors.color, shapes.shape
    FROM colors JOIN shapes
    ON colors.id = shapes.color_id;
    ```

* What is a **join table**?

* How can we join more than two tables together?

  * ```sql
    SELECT users.full_name, books.title, checkouts.checkout_date
    FROM users
    INNER JOIN checkouts ON (users.id = checkouts.user_id)
    INNER JOIN books ON (books.id = checkouts.book_id);
    ```

* What is **aliasing** in the context of SQL?

  * What do we call specifying another name for a column or table, then using that name in later parts of a query to allow for a more concise syntax?

  * ```sql
    SELECT u.full_name, b.title, c.checkout_date
    FROM users AS u /* Table Alias */
    INNER JOIN checkouts AS c ON (u.id = c.user_id)
    INNER JOIN books AS b ON (b.id = c.book_id);
    ```

  * ```sql
    SELECT count(id) AS "Number of Books Checked Out" /* Column Alias */
    FROM checkouts;
    ```

* What is a **subquery**?

  * What is it called when we nest queries in order to use the results of a given query as a condition in another one?

* How do we craft/use **subqueries** in Postgres?

  * ```SQL
    SELECT u.full_name FROM USERS u
    WHERE u.id NOT IN (SELECT c.user_id FROM checkouts c); /* subquery */
    ```

* What subquery expressions are provided in Postgres?

  * `IN`, `NOT IN`, `ANY`, `SOME`, `ALL`

* Subqueries and `JOIN`s can often be used interchangably, but `JOIN`s are typically more performant.

* 

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
| `ALTER TABLE tablename`                                      | change the table in some way... `RENAME TO new_table`, `RENAME COLUMN _ TO _`, `ALTER COLUMN _ TYPE _`, `DROP CONSTRAINT`, etc |
| `INSERT INTO table_name (column1_name, column2_name, ...) VALUES (column1_data, column2_data, ...);` | create new record in `table_name` with specified columns and values, possibility to add multiple records by adding comma separated tuples after `VALUES` |
| `SELECT [*, (col1, col2)] FROM table_name WHERE (condition);` | select statement/read; the **R** in **CRUD**                 |

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
