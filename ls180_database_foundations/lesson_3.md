## Lesson 3: Optimizing SQL Queries

#### What to Focus On

* Optimization is something to be aware of.
  * A database backed application can be slow for a variety of reasons. In general, an application that makes fewer queries will be faster than one that makes more, but optimizing application performance is a complex topic that is beyond the scope of this course.
  * You should understand what indexes are, how to implement them, and the trade-offs involved in using them.
  * You should be aware of the concept of comparing different SQL statements.
* Subqueries can be useful.
  * You should know what a subquery is and how to use it, but you aren't expected to know everything  about them. Many queries can be accomplished using `JOIN`s *or* subqueries, and knowing which is the best requires understanding a lot about the specific scenario being considered. This isn't something you are expected to master at this point in your studies.

#### Summary

* How indexes can be used as part of database optimization
* Comparing the performance of SQL statements
* Using subqueries as an alternative to joins

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

* How can we talk about the results of an `EXPLAIN [ANALYZE]` statement?

  * **REFER TO HERE https://launchschool.com/exercises/27dac993 AND HERE https://launchschool.com/exercises/549674f5**
    * The first `EXPLAIN` statement contains a fair amount of information. Each row represents an operation taken. The following items are listed in each row of information.
      1. The name of the node used to perform the SQL statement. A node represents some operation taken to run the SQL statement. An example would be the name in the first row of our query plan, `Hash Join`
      2. The estimated startup cost and estimated total cost. These can be seen here: `Hash Join (cost=33.38..62.84 rows=635 width=32)` The first number after `cost` is the estimated startup cost, and the second is the estimated total cost.
      3. The estimated number of rows to be shown when the SQL statement we are explaining is run. This is the number right after `rows=` above.
      4. The width is the estimated amount in bytes taken up by rows for the SQL statement we are explaining.
    * Next, let's take a look at the information that was added when we used the `ANALYZE` option. The information here is mostly the same: cost, rows, and width are still there. But there is one other bit of information that has been added to each node: the `actual_time` required for the startup and execution of that node. At the end of our query plan, the planning and execution time have also been added: these represent the total time required to set up the SQL statement along with the total time it took to execute that SQL statement.

* What are the different types of subquery expressions we have access to?

  * `EXISTS`: check whether any rows at all are returned by the nested query, returning a boolean.
  * `IN`: checks every row in the subquery result for inclusion of an evaluated expression, returning a boolean.
  * `NOT IN`: same as in, but inverted. If an equal row is **not** found, returns `true`.
  * `ANY` / `SOME`: used along with an operator (`= < >`, etc.), returning a boolean
    * When used with `=`, an `ANY`/`SOME` statement is equivalent to `IN`.
  * `ALL`: same as `ANY`/`SOME`, but checks for all results rather than at least one.
    * When used with `<>` or `!=`, an `ALL` statement is equivalent to `NOT IN`.

* How should we pick between using a subquery or a `JOIN` statement?

  * When first formulating your queries (i.e. not yet at the optimization stage where performance becomes a factor) the decision over whether to use a subquery over a join will often come down to personal preference.
  * There are valid arguments to say that subqueries are more readable/make more logical sense in some situations:
    * If you want to return data from one table conditional on data from another table, but don't need to return any data from the second table, use a subquery.
  * One at the optimization stage, use `EXPLAIN` / `EXPLAIN ANALYZE` to benchmark each option!

* What are some examples of subqueries?

  * ```sql
    SELECT name AS "Bid on Items" FROM items
    WHERE id IN (SELECT DISTINCT item_id FROM bids);
    ```

  * ```sql
    SELECT name AS "Not Bid On" FROM items
    WHERE id NOT IN (SELECT DISTINCT item_id FROM bids);
    ```

  * ```sql
    SELECT name FROM bidders
    WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
    ```

  * ```sql
    SELECT MAX(bid_counts.count) FROM
      (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;
    ```

* How can we use `ROW` comparison to find a given record without using `AND` statements?

  * ```sql
    -- construct two virtual rows and compare them
    SELECT id FROM items
    WHERE ROW('Painting', 100.00, 250.00) = 
      ROW(name, initial_price, sales_price);
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

* **Scalar subquery**

  * A scalar subquery is an ordinary `SELECT` query in parentheses that returns exactly one row with one column.

  * ```sql
    SELECT
      name,
      (SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
    FROM items;
    ```

  * 