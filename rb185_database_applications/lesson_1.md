## Lesson 1: Interacting with a Database in Code

#### What to Focus On

* Observe the progression of steps from high-level requirements to low-level implementation details
  * Think about how project requirements affect what SQL is written later.
* Understand how to dynamically generate SQL
  * We'll be creating SQL statements from Ruby. There are risks associated with this practice, so pay special attention to how this can be done safely.
* Focus on the database and not the application
  * We're building a command-line application in this lesson, but this aspect of the project hsould be considered secondary to its database interaction functionality. 

#### Summary

#### Notes

* Review of useful commands

  | Command                                       | What it does                                                 |
  | :-------------------------------------------- | :----------------------------------------------------------- |
  | `PG.connect(dbname: "a_database")`            | Create a new `PG::Connection` object                         |
  | `connection.exec("SELECT * FROM table_name")` | execute a SQL query and return a `PG::Result` object         |
  | `result.values`                               | Returns an Array of Arrays containing values for each row in `result` |
  | `result.fields`                               | Returns the names of columns as an Array of Strings          |
  | `result.ntuples`                              | Returns the number of rows in `result`                       |
  | `result.each(&block)`                         | Yields a Hash of column names and values to the block for each row in `result` |
  | `result.each_row(&block)`                     | Yields an Array of values to the block for each row in `result` |
  | `result[index]`                               | Returns a Hash of values for row at `index` in `result`      |
  | `result.field_values(column)`                 | Returns an Array of values for `column`, one for each row in `result` |
  | `result.column_values(index)`                 | Returns an Array of values for column at `index`, one for each row in `result` |



* 

#### Vocab

