## RB120 Lesson 1: OO Readings

#### Major Topics:

* What is the relationship between a class and an object?
* How do classes group behaviors (methods?)



#### Object Level

* Objects of a given class *do not* share states with other objects of that class
* Objects of a given class *do* share behaviors with other objects of that class

#### Class Level

* Classes also have behaviors that act on the class (`self`)-- not for objects created by it

#### Inheritance

* Sub-classing from parent class
  * How many parent, or *super*, classes can a given class have? (one-- used to model hierarchical relationships. think of a dendrogram to help visualize)
* Mixing in modules
  * How many modules can be mixed in? (as many as needed-- **multiple inheritance**)
* How do sub-classing and mixing in modules affect the method lookup path?