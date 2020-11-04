## Summary Notes on RB180: Database Foundations

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

