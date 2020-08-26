## Notes on RB180: Database Foundations

### Useful Links

* Postgres Documentation: https://www.postgresql.org/docs/12/

* SQL Style Guide: https://www.sqlstyle.guide/



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
* 