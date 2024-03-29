## Lesson 2: Relational Data and JOINs

#### What to Focus On

* Focus on how to work with multiple tables using `JOIN`
  * There are several types of `JOIN`s. Spend most of your time working with the types we cover in this lesson.
* SQL has a lot of optional keywords
  * We generally prefer a very explicit style of SQL, which is what is shown in this course. Using this style will help you read and comprehend what a given SQL statement does. You will see a variety of styles on the internet, however.
* Think about how schemas change over time
  * Many of the assignments in this lesson include changing both a database's schema and the data held within it. When solving problems, consider if it's possible with the current schema or if a schema change will be required.

#### Summary

* *Relational databases* are called relational because they persist data in a set of *relations*, or, as they are more commonly called, *tables*.
* A *relationship* is a connection between entity instances, or rows of data, usually resulting from a relationship between what those rows of data represent.
* The three levels of schema are *conceptual*, *logical*, and *physical*.
* A *conceptual schema* is a high-level design focused on identifying entities and their relationships.
* A *physical schema* is a low-level database-specific design focused on implementation.
* *Cardinality* is the number of objects on each side of the relationship.
* The *modality* of a relationship indicates if that relationship is required or not.
* *Referential integrity* is a data property that requires every value in one column of a table to appear in a column of (usually) another table.



#### Notes

* Levels of schema (abstraction) in database diagrams: *conceptual*, *logical*, and *physical*

  * Conceptual: focus on **ENTITIES**

    * A high-level design focused on identifying entities and their relationships.

    * Same thing as an Entity-Relationship Diagram (**ERD**).

    * Two kinds of connections at the conceptual level: **one** and **many** (`-` and `-<` )

    * <left><img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-08-31 at 3.33.10 PM.png" style="zoom:50%"/>        <img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-08-31 at 3.38.35 PM.png" style="zoom:40%"/></left>

      

  * Logical: list of attributes and datatypes, but not specific to the database. 

    * Mostly something you won't actually end up working with. Combination of the two others.

  * Physical: focus on **IMPLEMENTATION**

    * A low-level database-specific design focused on implementation. 
    * Attributes: **P** (primary key), **N** (not null), **F** (foreign key)
    * ![Screen Shot 2020-08-31 at 3.33.32 PM](/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-08-31 at 3.33.32 PM.png)
      * Primary key `id` from `contacts` connects to the foreign key (with a `NOT NULL` constraint) `contact_id` in `calls`.
      * `contacts` has a `one to many` relationship with `calls` (`primary key :: foreign key`)

* Why are there more tables than entities in the following diagram?

  <left><img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-08-31 at 3.45.19 PM.png" style="zoom:50%"/>

  * Because of the `many to many` relationship between `books` and `categories`-- any `M:M` relationship will have a new table that exists between the two relations, usually called **join tables**.
    * Each row in `books_categories` represents a single relationship between a book from `books` and a category from `categories`.
  * The number of entities you will have in a conceptual schema **<u>does not</u>** necessarily match the number of tables you will have in a lower level/physical schema. 

* Can you tell if a there is a `1:1` or `1:M` relationship between two relations from just the conceptual schema? What about the physical schema? Why?

  * One can determine if the relationship is `1:1` or `1:M` from the conceptual schema because it should include modality symbols.
  * One cannot determine if a relationship is `1:1` or `1:M` from a physical schema alone, because the modality is not specified.

* A review of `JOIN`s (always be explicit about the type you are using, even if database will auto-populate)

  * (left/full/right) `INNER`: Rows from one or both tables that are unmatched in the other are not returned.
  * (left/full/right) `OUTER`: Unmatched rows in one or both tables can be returned.
  * (left/full/right) `CROSS`: Cross product-- all possible combinations of rows from each table

* What is the difference between a foreign key column and a foreign key constraint? How do we create each?

  * A foreign key column is a column that represents a relationship between two rows by pointing to a specific row in another table using its primary key.
  * A foreign key constraint enforces certain rules about what values are permitted in foreign key relationships.
  * To create a foreign key column, just create a column of the same type as the primary key column it will point to. 
  * To create a foreign key constraint, there are two options:
    * In a `CREATE TABLE` statement, include: `[fkey] [dtype] REFERENCES [table] (col)`
      * `product_id integer REFERENCES products (id)`
    * Alter the table: `ALTER TABLE t1 ADD CONSTRAINT c FOREIGN KEY (col) REFERENCES t2(col)`
      * `ALTER TABLE orders ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);`

* Does a foreign key constraint prevent `NULL` values from being stored in a column? What are the implications of this?

  * No, foreign key columns allow `NULL` values. As a result, it is often necessary to use `NOT NULL` and a foreign key constraint together.

* How can we reference a column that shared a name with a SQL keyword without having an error occur?

  * Wrap the column name in `""` when you refer to it.

* What is the concatenation operator in SQL?

  * `||` -> `(contacts.first_name || ' ' || contacts.last_name)`

* How can we use enumerated type columns? Add a new one? Update an existing one?

  * ```sql
    CREATE TYPE mood AS enum ('sad', 'ok', 'happy');
    CREATE TABLE person (
      name text,
      current_mood mood
    );
    ```

  * ```sql
    ALTER TABLE stars
    DROP CONSTRAINT stars_spectral_type_check;
    
    CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');
    
    ALTER TABLE stars
    ALTER COLUMN spectral_type TYPE spectral_type_enum
                               USING spectral_type::spectral_type_enum;
    ```

* 

  

#### Vocab

* **Relation**: usually another way to say "table". If you can `SELECT` something `FROM` something, it's probably a relation.
* **Relationship**: an association between the data stored in those relations. A connection between entities (rows of data), usually resulting from what those entities represent and how they are related to one another.
* **Entity-relationship model** (ERD-iagram)
* **Schema**
  * **Physical schema**
    * A low-level database-specific design focused on implementation.
  * **Conceptual schema**
    * A high-level design focused on identifying entities and their relationships.
* **Cardinality**
  * The number of objects on each side of a given relationship (`1:1`, `1:M`, `M:M`).
* **Modality**
  * Whether a given relationship is required (at least `1` instance of a given entity) or optional (`0`).
  * Lower bound of how many instances there can be in a given relationship.
  * Crow's foot notation: <img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-08-31 at 4.15.45 PM.png" style="zoom:30%"/>
    * **One - optional**: This side of a relationship can have 0 or 1 instances of the entity.
    * **One - required**: This side of a relationship will have 1 and only 1 instance of the entity.
    * **Many - optional**: This side of a relationship can have 0 or more instances of the entity.
      * **Many - required**: This side of a relationship will have at least 1, maybe more instances of the entity.
* **Foreign key column**
  * A column that represents a relationship between two rows by pointing to a specific row in another table using its **primary key**.
* **Foreign key constraint**
  * A constraint that enforces certain rules about what values are permitted in these foreign key relationships. 
* **Update anomaly**
  * A data inconsistency that results from data redundancy (a poorly normalized database) and a partial update.
  * If a contact is duplicated, and the name or number needs to be changed, we'd have to update every row that contains information about that contact, otherwise the database would *contain more than one answer for a given question*. E.G. what is the phone number for `user_id` = 3?
* **Insertion anomaly**
  * The inability to add data to a database due to absence of other data.
  * For ex.: we can't store the information for a contact without first having placed a call to them, if we're only using one table `calls` instead of creating relations/relationships and normalizing our database.
* **Deletion anomaly**
  * The unintended loss of data due to the deletion of other data.
  * What if we want to drop a specific call that someone made, but that was the only call in their records and then we just lose them from the database completely?
* **Normalization**
  * The process of designing schema that mimimize or eliminate the possible occursence of the three aforementioned anomalies (update, insertion, and deletion).
  * The basic procedure of normalization involves extracting data into additional tables by concern (working back to the ERD model of entities) and using foreign keys to tie it back to its associated data in the other relations.
* **Denormalized**
  * A database having duplicated data, sometimes desirable because it can make certain retrieval operations much more efficient.
* **Enumerated type**
  * A data type that comprise a static, ordered set of values; think of a stoplight-- 'r', 'y', 'g'.