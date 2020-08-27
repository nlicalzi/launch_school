## Notes on RB180: Database Foundations

### Useful Links

* Postgres Documentation: https://www.postgresql.org/docs/12/
  * All datatypes in Postgres: https://www.postgresql.org/docs/current/datatype.html

* SQL Style Guide: https://www.sqlstyle.guide/



#### Postgres Meta Commands

| Meta Command | Description                                     | Example               |
| :----------- | :---------------------------------------------- | :-------------------- |
| `\c $dbname` | **C**onnect to database `$dbname`.              | `\c blog_development` |
| `\d`         | **D**escribe available table relations          |                       |
| `\d $name`   | **D**escribe table relation `$name`             | `\d users`            |
| `\?`         | List of console commands and options            |                       |
| `\h`         | List of available SQL syntax **H**elp topics    |                       |
| `\h $topic`  | SQL syntax **H**elp on syntax for `$topic`      | `\h INSERT`           |
| `\q`         | **Q**uit                                        |                       |
| `\l`         | **L**ist all databases available to connect to. |                       |

#### Postgres Data Types

| Data Type                                      | Type      | Value                             | Example Values          |
| :--------------------------------------------- | :-------- | :-------------------------------- | :---------------------- |
| `varchar(length)`                              | character | up to `length` characters of text | `canoe`                 |
| `text`                                         | character | unlimited length of text          | `a long string of text` |
| `integer`                                      | numeric   | whole numbers                     | `42`, `-1423290`        |
| `real`                                         | numeric   | floating-point numbers            | `24.563`, `-14924.3515` |
| `decimal(precision, scale)` (ALIAS: `numeric`) | numeric   | arbitrary precision numbers       | `123.45`, `-567.89`     |
| `timestamp`                                    | date/time | date and time                     | `1999-01-08 04:05:06`   |
| `date`                                         | date/time | only a date                       | `1999-01-08`            |
| `boolean`                                      | boolean   | true or false                     | `true`, `false`         |



## Lesson 1: Schema, Data, and SQL

#### What to Focus On

* Learn the SQL and relational database features mentioned in this lesson
* Spend some time with parts of the documentation
* Learn the difference between data and schema



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
* 