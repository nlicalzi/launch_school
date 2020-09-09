## Lesson 1: Schema, Data, and SQL

#### What to Focus On

* Learn the SQL and relational database features mentioned in this lesson
* Spend some time with parts of the documentation
* Learn the difference between data and schema



#### Summary

* **SQL** is a **special-purpose**, **declarative language** used to manipulate the structure and values of datasets stored in a **relational database**.

* SQL is comprised of three sublanguages:

  * | sub-language                          | controls                       | SQL Constructs                         |
    | :------------------------------------ | :----------------------------- | :------------------------------------- |
    | **DDL** or data definition language   | relation structure and rules   | `CREATE`, `DROP`, `ALTER`              |
    | **DML** or data manipulation language | values stored within relations | `SELECT`, `INSERT`, `UPDATE`, `DELETE` |
    | **DCL** or data control language      | who can do what                | `GRANT`                                |

* SQL code is made up of statements, which must be terminated by a semicolon.

* PostgreSQL provides many data types. We've looked at the following subset of types it supports in this lesson: 

  * | Data Type                   | Type      | Value                             | Example Values          |
    | :-------------------------- | :-------- | :-------------------------------- | :---------------------- |
    | `varchar(length)`           | character | up to `length` characters of text | `canoe`                 |
    | `text`                      | character | unlimited length of text          | `a long string of text` |
    | `integer`                   | numeric   | whole numbers                     | `42`, `-1423290`        |
    | `numeric`                   | numeric   | floating-point numbers            | `24.563`, `-14924.3515` |
    | `decimal(precision, scale)` | numeric   | arbitrary precision numbers       | `123.45`, `-567.89`     |
    | `timestamp`                 | date/time | date and time                     | `1999-01-08 04:05:06`   |
    | `date`                      | date/time | only a date                       | `1999-01-08`            |
    | `boolean`                   | boolean   | true or false                     | `true`, `false`         |

* `NULL` is a special value that represents the absence of any other value.
* `NULL` values must be compared using `IS NULL` or `IS NOT NULL`.
* Database dumps can be loaded using `psql -d database_name < file_to_import.sql`
* Table columns can have default values, which are specified using `SET DEFAULT`.
* Table columns can be disallowed from storing `NULL` values using `SET NOT NULL`.
* `CHECK` constraints are rules that must be met by the data stored in a table.
* A **natural key** is an existing value in a dataset that can be used to uniquely identify each row of data in that dataset.
* A **surrogate key** is a value that is created solely for the purpose of identifying a row of data in a database table.
* A **primary key** is a value that is used to uniquely identify the rows in a table. It cannot be `NULL` and must be unique within a table. They are created using `PRIMARY KEY`.
* `serial` columns are typically used to create auto-incrementing columns in PostgreSQL.
* `AS` is used to rename tables and columns within a SQL statement.



#### Notes

* What operator is used to concatenate strings in SQL?

  * `||`

* How do we deal with strings that include `'` or `"` in a valid way in SQL?

  * Cancel any `'` by writing `''`, and just wrap `"` normally
  * `"weren''t"` || `'"no way!"'`

* What SQL functions do we know so far?

  * `lower()`
  * `upper()`
  * `trunc()`: convert a float to an integer by removing decimal places
  * `pi()`

* Style guide notes:

  * For tables, use a collective name or, less ideally, a plural form. For example (in order of preference) `staff` and `employees`

  * Always use uppercase for the reserved keywords like `SELECT` and `WHERE`, etc.

  * Spaces should be used to line up the code so that the root keywords all <u>end</u> on the same character boundary

    * ```sql
      (SELECT f.species_name,
              AVG(f.height) AS average_height, AVG(f.diameter) AS average_diameter
         FROM flora AS f
        WHERE f.species_name = 'Banksia'
           OR f.species_name = 'Sheoak'
           OR f.species_name = 'Wattle'
        GROUP BY f.species_name, f.observation_date)
      ```

  * Always include newlines: before `AND` or `OR`, after semicolons, after keyword definitions, etc.

* Prefer `text` type to `varchar(x)` 

* When dealing with `NULL` values, ALWAYS use the `IS NULL` or `IS NOT NULL` constructs or they won't appear properly. `NULL = NULL` returns `NULL` instead of `true` in Postgres, as does `SELECT NULL;`

* What is the difference between `integer`, `decimal`, and `real` numeric data types?

  * `integer`: non-fractional numbers
  * `real`: floating point (can include fractional) numbers
  * `decimal`: can contain non-floating-point fractional values with a limited precision

* What is the difference between the `timestamp` and `date` data types?

  * `timestamp`: includes a date and a time of day
  * `date`: only includes the date (and no time of day)

* Two main ways to load SQL files into a Postgres database:

  * ```bash
    bash $ psql -d my_database < file_to_import.sql
    ```

  * ```sql
    /* psql */ my_database=# \i ~/some/files/file_to_import.sql
    ```

* What is the result of using an operator on a `NULL` value?

  * The operator will return `NULL` (unknown)

* What Postgres program can be used to create a SQL file that contains the commands needed to recreate the current structure and data of a given table?

  * `pg_dump -d [database] -t [table] --inserts > dump.sql`
    * `--inserts` flag means that multiple `INSERT INTO` statements are used to insert the data
    * Without `--inserts`, the data is inserted with a `COPY FROM stdin` statement

* What does `string_agg()` do? Why is it useful?

* What are the steps PostgreSQL goes through when executing a `SELECT` query?

  * Rows are collected into a virtual derived table
    * A new temporary table using the data from all tables listed in the `FROM` clause (incl. `JOIN`s)
  * Rows are filtered using `WHERE` conditions
  * Rows are divided into groups (if a `GROUP BY` clause is present)
  * Group are filtered using `HAVING` conditions
    * `HAVING` conditions are like `WHERE` conditions, except applied only to values used to create groups, and not individual rows
    * A column mentioned in a `HAVING` clause should almost always appear in a `GROUP BY`/aggregate function
  * Compute values to return using select list (executing functions, etc.)
  * Sort results (in execution order, unless an `ORDER BY` clause is present)
  * Limit results (if `LIMIT` or `OFFSET` clauses are included in the query)

* 



#### Vocab

* **SQL**

  * A language used to manipulate the structure and values of datasets stored in a relational database.

* **Special purpose language**

  * A programming language designed to solve a finite class of problems.
  * Applicable to SQL because it is exclusively for interacting with relational databases.
  * Synonym of "Domain-specific language"
  * Opposite of a "general purpose language", like Ruby/Python/JavaScript, etc.

* **Declarative language**

  * Describes what needs to be done, but does not detail how to accomplish this objective.
  * Opposite of "imperative"
  * Relate to **declarative** (expresses the logic of a computation without describing its control flow see: `Array.select{}`) vs. **imperative**  (using a loop counter or explicit iterator) programming

* **DDL / DML / DCL**

  * What three sub-languages make up SQL? 
  * **DDL**: Data definition language
    * Defines relation structure and rules
    * `CREATE`, `DROP`, `ALTER`
  * **DML**: Data manipulation language
    * Manipulates values stored within relations 
    * `SELECT`, `INSERT`, `UPDATE`, `DELETE`
  * **DCL**: Data control language
    * Controls who can do what
    * `GRANT`, `REVOKE`

* **SQL statement**

* **SQL expression**

* **Key**

  * Uniquely identifies a single row in a database table. Main types: **natural key**, and **surrogate key**

* **Natural key**

  * An existing value in a dataset that can be used to uniquely identify each row of data in that dataset.
  * Issue: many seemingly good fits for a natural key actually often are not. Phone numbers can change hands, only some people have social security numbers, products can have the same product number but be on different iterations, etc.

* **Composite key**

  * Combining two or more existing values in a dataset to uniquely identify each row of data in that set. 
  * Issue: typically just defers the problems with natural keys, rather than solving them.

* **Surrogate key**

  * A value that is created solely for the purpose of identifying a row of data in a database table (like a UID), thereby avoiding many of the problems associated with natural keys.

  * Most common surrogate key: auto-incrementing integer, added to rows in a table on creation.

  * ```sql
    /* This statement: */
    CREATE TABLE colors (id serial, name text);
    
    /* is actually interpreted as if it were this one: */
    CREATE SEQUENCE colors_id_seq;
    CREATE TABLE colors (
      id integer NOT NULL DEFAULT nextval('colors_id_seq'),
      name text
    );
    ```

* **Serial column**

  * Short hand for a column definition that creates a sequence.

* **Sequence**

  * A special kind of relation that generates a series of numbers, remembering the last number that it generated and using it to inform the generation of the next one.

* **Primary key**

  * By specifying `PRIMARY KEY` as a constraint (similarly to how we would specify `NOT NULL`), Postgres will create an index on that column that enforces it holding unique values in addition to preventing the column from holding `NULL ` values.

* **UUID (Universally Unique Identifier)**

  * A very large number that is ues to identify individual objects, or database rows when working with a database. Often represented using hexadecimal strings with dashes (`f47ac10b-58cc-4372-a567-0e02b2c3d479`)

