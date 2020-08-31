## Lesson 2: Relational Data and JOINs

#### What to Focus On

* Focus on how to work with multiple tables using `JOIN`
  * There are several types of `JOIN`s. Spend most of your time working with the types we cover in this lesson.
* SQL has a lot of optional keywords
  * We generally prefer a very explicit style of SQL, which is what is shown in this course. Using this style will help you read and comprehend what a given SQL statement does. You will see a variety of styles on the internet, however.
* Think about how schemas change over time
  * Many of the assignments in this lesson include changing both a database's schema and the data held within it. When solving problems, consider if it's possible with the current schema or if a schema change will be required.

#### Summary

#### Notes

* Levels of schema (abstraction) in database diagrams: *conceptual*, *logical*, and *physical*

  * Conceptual: focus on **ENTITIES**

    * High-level design focused on identifying entities and their relationships.

    * Same thing as an Entity-Relationship Diagram (**ERD**).

    * Two kinds of connections at the conceptual level: **one** and **many** (`-` and `-<` )

    * <left><img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-08-31 at 3.33.10 PM.png" style="zoom:50%"/>        <img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-08-31 at 3.38.35 PM.png" style="zoom:40%"/></left>

      

  * Logical: list of attributes and datatypes, but not specific to the database. 

    * Mostly something you won't actually end up working with. Combination of the two others.

  * Physical: focus on **IMPLEMENTATION**

    * Low-level database-specific design focused on implementation. 
    * Attributes: **P** (primary key), **N** (not null), **F** (foreign key)
    * ![Screen Shot 2020-08-31 at 3.33.32 PM](/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-08-31 at 3.33.32 PM.png)
      * Primary key `id` from `contacts` connects to the foreign key (with a `NOT NULL` constraint) `contact_id` in `calls`.
      * `contacts` has a `one to many` relationship with `calls` (`primary key :: foreign key`)

* Why are there more tables than entities in the following diagram?

  <left><img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-08-31 at 3.45.19 PM.png" style="zoom:50%"/>

  * Because of the `many to many` relationship between `books` and `categories`-- any MTM relationship will have a new table that exists between the two relations, usually called **join tables**.
    * Each row in `books_categories` represents a single relationship between a book from `books` and a category from `categories`.
  * The number of entities you will have in a conceptual schema **<u>does not</u>** necessarily match the number of tables you will have in a lower level/physical schema.

* 



#### Vocab

* **Relation**: usually another way to say "table". If you can `SELECT` something `FROM` something, it's probably a relation.
* **Relationship**: an association between the data stored in those relations. A connection between entities (rows of data), usually resulting from what those entities represent and how they are related to one another.
* **Entity-relationship model** (ERD-iagram)
* 