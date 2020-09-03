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

#### Vocab

* **Index**
  * **What?** In the context of a database, an index is a mechanism that SQL engines use to speed up queries.
  * **How?** They do this by storing indexed data in a table-like structure, which can be quickly searched using particular search algorithms. The results of the search provide a link back to the record(s) to which the indexed data belongs.
  * **Why?** Using an index means that the database engine can locate column values more efficiently since it doesn't have to search through every record in a table in sequence.