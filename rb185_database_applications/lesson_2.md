## Lesson 2: Database-backed Web Applications

#### What to Focus On

* **What schema does an application require?**
  * Being able to map the data used by a project to a database schema is an important skill.
* **Project setup is secondary**
  * We do a lot of configuration in this lesson to get the application connecting to a database, logging out queries, etc. You aren't expected to be able to do these things off the top of your head-- they are great examples of concepts you should be aware of, but can easily look up if and when you need to implement them.

#### Summary

* 

#### Notes

* **Current** flow of todo-list app (before adding database functionality):

  * <left><img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-09-11 at 3.32.08 PM.png", style="zoom:40%"/>

* **Intermediate, updated** flow of todo-list app (after extracting SessionPersistance functionality as a class from Sinatra app):

  * <left><img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-09-11 at 3.35.56 PM.png", style="zoom:40%"/>

* **Final** flow state of todo-list app (after changing dependence on SessionPersistance/cookies to DatabasePersistance/a database):

  * <left><img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-09-11 at 3.42.50 PM.png", style="zoom:40%"/>

* Extracting **SessionPersistance**, then implementing **DatabasePersistance** is an application of the Abstractor pattern-- allowing the Sinatra application to use the same API, but changing the implementation of the datastore.

#### Vocab

