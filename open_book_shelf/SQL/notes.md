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
* What is the syntax for a psql console meta-command?
  * `\[command]`. Examples: `\conninfo` (connection info), `\q` (quit psql)

* How many separate sub-languages can we think of SQL as comprising, and what are they?
  * DDL: Data Definition Language
  * DML: Data Manipulation Language
  * DCL: Data Control Language



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
    * Used to define the structure of a database and the tables and columns within it.
  * DML: Data Manipulation Language
    * Used to retrieve or modify data stored in a database. `SELECT` queries are part of DML.
  * DCL: Data Control Language
    * Used to determine what various users are allowed to do when interacting with a database.



### Anki

