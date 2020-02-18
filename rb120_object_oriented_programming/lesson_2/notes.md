## RB120 Lesson 2 Notes

* What is the difference between #p and #puts in the context of printing a class object/instance?
  * We can use #p to print the object so that #inspect is called, which lets us view the instance variables and their values along with the object.
* Every class has a `#to_s` method. `puts` calls `#to_s` method for every argument it gets passed to convert the value to an appropriate string representation. Knowing this, we can override `#to_s` for any class to produce any useful output we need.
* Protected methods are very similar to private methods. The main difference between them is protected methods allow access between class instances, while private methods don't. If a method is protected, it can't be invoked from outside the class. This allows for controlled access, but wider access between class instances.