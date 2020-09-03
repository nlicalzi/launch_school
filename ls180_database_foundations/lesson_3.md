## Lesson 3: Optimizing SQL Queries

#### What to Focus On

* Optimization is something to be aware of.
  * A database backed application can be slow for a variety of reasons. In general, an application that makes fewer queries will be faster than one that makes more, but optimizing application performance is a complex topic that is beyond the scope of this course.
  * You should understand what indexes are, how to implement them, and the trade-offs involved in using them.
  * You should be aware of the concept of comparing different SQL statements.
* Subqueries can be useful.
  * You should know what a subquery is and how to use it, but you aren't expected to know everything  about them. Many queries can be accomplished using `JOIN`s *or* subqueries, and knowing which is the best requires understanding a lot about the specific scenario being considered. This isn't something you are expected to master at this point in your studies.

#### Summary

#### Notes

* When should we use an index?

  * Indexes are best used in cases where sequential reading is inadequate. 
    * For example: columns that aid in mapping relationships (such as Foreign Key columns), or columns that are frequently used as part of an `ORDER BY` clause, are good candidates for indexing.
  * They are best used in tables and/or columns where the data will be read much more frequently than it is created or updated.

* What are some types/examples of indexes within Postgres?

  * B-tree, Hash, GiST, and GIN

* How are indexes created?

  * Defining a `PRIMARY KEY` or `UNIQUE` constraint will automatically create an index on that column.

  * ```sql
    CREATE INDEX [index_name] ON table_name (field_name);
    ```

* What are some of the most important types of indexes?

  * (Non-)Unique Index

    * When an index is created via `PRIMARY KEY` or `UNIQUE` constraints, the index created is a unique index.
    * When an index is unique, multiple table rows with equal values for that index are not allowed.
    * Non-unique instances, where we don't enforce uniqueness, allow for the same value to occur multiple times in a given indexed column.

  * Single/Multi-Column Index

    * Only certain index types support multi-column indexes, and there is a limit to the number of columns that can be combined in an index.

    * ```sql
      CREATE INDEX [index_name] ON table_name (field_name_1, field_name_1);
      ```

  * Partial Index

    * Partial indexes are built from a subset of the data in a table, defined by a conditional expression, and the index contains entries only for the rows from the table where the value in the indexed column satisfies the condition.
    * Partial indexes can be useful in certain situations, but most of the time we'll be using single- or multi-column indexes.

* How can we delete indexes that have been created?

  * By using a `DROP INDEX` statement.
  * We can use the `/di` `psql` console command to list all indexes for the current database.

* What is the `EXPLAIN` command in `psql` used to accomplish?

  * `EXPLAIN` gives a step by step analysis of how the query will be run internally by Postgres.
  * The values that `EXPLAIN` outputs are estimates, based on the planner's knowledge of the schema and assumptions based on Postgres system statistics.

* What should we look for when using `EXPLAIN` statements to analyze/compare query execution times?

  * One of the key pieces of information to look out for in order to compare queries is the estimated 'total cost' value of the top-most node in an `EXPLAIN` statement.

* If the values that `EXPLAIN` outputs are just estimates of how long a given statement will take to run, how can we actually output the real runties to compare them?

  * By adding the `ANALYZE` option to an `EXPLAIN` command:

    * ```sql
      EXPLAIN ANALYZE SELECT books.title FROM books
      JOIN authors ON books.author_id = authors.id
      WHERE authors.name = 'William Gibson';
      ```

* 

#### Vocab

* **Index**

  * **What?** In the context of a database, an index is a mechanism that SQL engines use to speed up queries.
  * **How?** They do this by storing indexed data in a table-like structure, which can be quickly searched using particular search algorithms. The results of the search provide a link back to the record(s) to which the indexed data belongs.
  * **Why?** Using an index means that the database engine can locate column values more efficiently since it doesn't have to search through every record in a table in sequence.

* **Query Plan**

  * In order to execute each query that it receives, Postgres devises an appropriate query plan.

  * We are able to access and view this plan for a given statement by using the `EXPLAIN` command:

    * ```sql
      EXPLAIN SELECT * FROM books;
      ```

* 