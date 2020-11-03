## Lesson 3: Optimization

#### What to Focus On

* **Optimization is something to be aware of.**
  * A database-backed application can be slow for a variety of reasons. In general, an application that makes fewer queries will be faster than one that makes more, but optimizing application performance is a complex topic that is beyond the scope of this course
  * You should be aware of the concept of optimizing the way an application interacts with a database after completing this lesson.
  * You should be able to describe what N+1 queries are and how they can be addressed.

#### Summary

In this lesson, we learned about:

* How N+1 queries are the result of performing an additional query for each element in a collection
* How to move business logic from Ruby into the database by adding to a query's select list
* How making database interactions more efficient often involves making SQL queries more specialized

#### Notes



#### Vocab

* **N+1 Query**
  * This antipattern happens when a subsequent query is executed for every result of a previous query, in order to load additional data.
  * The total number of queries is equal to the number of elements (`N`) on the screen, plus one for the original query.
  * LS: "It's where an application issues one query to retrieve data for a parent record, and then an additional query for each child record associated with that parent."