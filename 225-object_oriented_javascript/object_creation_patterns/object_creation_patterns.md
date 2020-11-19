## JS225/Lesson 4: Object Creation Patterns



### Summary

### Notes

* Introduction

  * JavaScript uses the object prototype to implement the sharing of properties.

    * Many other languages instead implement behavior sharing using class-based inheritance.

  * Ryan's [video](https://www.youtube.com/watch?v=-N9tBvlO9Bo&feature=youtu.be), two approaches:

    * ```javascript
      const userFunctions = { // top-level object
        add: function() { this.points += 1; },
        login: function() { console.log("You're logged in"); },
      };
      
      function userCreator(name, points) {
        const newUser = Object.create(userFunctions);
        newUser.name = name;
        newUser.points = points;
        return newUser;
      }
      
      const user = userCreator('Ryan', 3);
      ```

    * ```javascript
      function UserCreator(name, points) { // constructor function
        // hidden UserCreator.prototype property
        this.name = name;
        this.points = points;
      }
      
      UserCreator.prototype.add = function() { // add 'add' property to prototype
        this.points += 1;
      }
      
      const user = new UserCreator('Ryan', 3); // call constructor func with 'new'
      
      Object.getPrototypeOf(user) === UserCreator.prototype;
      Object.getPrototypeOf(UserCreator.prototype) === Object.prototype;
      user.constructor === UserCreator; // constructor property of user
      ```

* Factory Functions

  * We can use functions as object factories / factory functions / the **Factory Object Creation Pattern**

    * ```javascript
      function createPerson(firstName, lastName) {
        return { // return an object literal
          firstName,
          lastName,
          fullName() {
            return (this.firstName + ' ' + this.lastName).trim();
          },
        };
      }
      
      let john = createPerson('John', 'Doe');
      let jane = createPerson('Jane');
      
      john.fullName(); // 'John Doe'
      jane.fullName(); // 'Jane'
      ```

  * What is the advantage of using a factory function?

    * A factory function allows us to create the multiple objects easily with a pre-defined template.

  * What are the disadvantages of using a factory function?

    * Every object created with a factory function has a full copy of all the methods (poss. redundant)
    * There isn't a way for us to inspect an object and know whether we created it from a factory function, making it difficult to know whether an object is of a specific 'type'.

* Constructor Pattern

  * A constructor function is **intended to be called with the `new` operator**:

    * ```javascript
      function Person(firstName, lastName = '') { // capitalize function by convention
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = function() {
          return (this.firstName + ' ' + this.lastName).trim();
        };
      }
      
      let john = new Person('John', 'Doe');
      let jane = new Person('Jane');
      
      john.constructor; // function Person(..)
      jane.constructor; // function Person(..)
      
      john instanceof Person; // true
      jane instanceof Person; // true
      ```

  * If we call a constructor function without the `new` operator, `this` points to the global object and will result in some weirdness:

    * ```javascript
      function Person(firstName, lastName = '') {
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = function () {
          return (this.firstName + ' ' + this.lastName).trim();
        };
      }
      
      Person('John', 'Doe');
      window.fullName(); // 'John Doe'
      ```

    * What happens if we assign a variable to the result of calling a constructor function (that doesn't explicitly returning a value) without the `new` operator?

      * The variable will point to `undefined`

  * When we call a function with the `new` operator, the following happens:

    1. A new object is created
    2. `this` in the function is set to point to the new object
    3. The code in the function is executed
    4. `this` is returned if the constructor doesn't explicitly return an object

  * What is **constructor invocation**?

    * Constructor invocation is performed when the `new` keyword is followed by an expresion that evaluates to a function object and `(args)`, like so: `new RegExp('\\d')`

    * ```javascript
      function Country(name, traveled) { // Constructor function caps by convention
        this.name = name ? name : 'United Kingdom';
        this.traveled = Boolean(traveled);
      }
      
      Country.prototype.travel = function() {
        this.traveled = true;
      };
      
      var france = new Country('France', false); 	// constructor invocation
      var unitedKingdom = new Country; 						// constructor invocation
      ```

  * What does `this` refer to in constructor invocation?

    * `this` is the ***newly created object*** in a constructor invocation.

* Objects and Prototypes

  * Objects' Prototypes

    * Every JS Object has a hidden property called `[[Prototype]]`

      * We can retrieve this property's value with `Object.getPrototypeOf(obj)`
      * We can set this property's value with `Object.setPrototypeOf(obj)`
        * Not recommended b/c of slowness, use `Object.create` to set prototype instead
      * We can use `Object.prototype.isPrototypeOf(obj)` to determine whether an object has a given value for its `[[Prototype]]` property.
        * `foo.isPrototypeOf(qux)`

    * When we use `Object.create` to create an object, it sets the `[[Prototype]]` property of the created object to the passed-in object:

      * ```javascript
        let foo = {};
        let qux = Object.create(foo);
        console.log(Object.getPrototypeOf(qux) === foo); // true
        
        // obj assigned to foo is the prototype object of obj assigned to qux
        // created the object `qux` with object `foo` as its prototype
        ```

  * The `__proto__` property

    * Many older programs use  `__proto__`/**dunder proto**, a deprecated version of `[[Prototype]]`

  * Prototype Chain and the `Object.prototype` Object

    * Using `Object.create` to create objects forms a prototype chain with `Object.prototype` at the end of the prototype for all JS objects:

      * ```javascript
        let foo = { a: 1, };
        Object.getPrototypeOf(foo) === Object.prototype); // true, prototype chain
        Object.prototype.isPrototypeOf(foo); // true, next level obj in chain
        ```

      * ```javascript
        let foo = { a: 1, };
        let bar = Object.create(foo);
        let baz = Object.create(bar);
        let qux = Object.create(baz);
        
        Object.getPrototypeOf(qux) === baz; // true
        Object.getPrototypeOf(baz) === bar; // true
        Object.getPrototypeOf(bar) === foo; // true
        
        foo.isPrototypeOf(qux); // true, because foo is in qux's prototype chain
        ```

      * 

* Prototypal Inheritance and Behavior Delegation

* Function Prototypes and Object Prototypes

* Constructors, Prototypes, and the Prototype Chain

* Static and Instance Properties and Methods

* The Pseudo-classical Pattern and the OLOO Pattern

* The Class Syntactic Sugar

* More Methods on the Object Constructor

* Modules

* Douglas Crockford Lecture- JavaScript: The Good Parts

### Concepts/Vocab

