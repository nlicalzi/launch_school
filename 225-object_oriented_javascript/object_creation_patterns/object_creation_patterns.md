## JS225/Lesson 4: Object Creation Patterns



### Summary

### Notes

* **Introduction**

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

* **Factory Functions**

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

* **Constructor Pattern**

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

* **Objects and Prototypes**

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

* **Prototypal Inheritance and Behavior Delegation**

  * Prototype Chain Lookup for Property Access

    * When we try to access a property or method on an object, JS searches in the object itself first, then goes up the prototype chain until it finds the property or reaches `Object.prototype`.

    * ```javascript
      let foo = { a: 1, };
      let bar = Object.create(foo);
      let baz = Object.create(bar);
      
      bar.a; // 1
      baz.a; // 1
      baz.c; // undefined
      ```

    * ```javascript
      let foo = {
        hello() {
          return 'hello ' + this.name;
        },
      };
      
      let bar = Object.create(foo);
      bar.name = 'world';
      bar.hello(); // returns 'hello world', thanks to the hello property of foo
      ```

  * Prototypal Inheritance and Behavior Delegation

    * Prototype chain lookup for properties gives us the ability to store an object's data and behaviors not just in the object itself, but anywhere on its prototype chain.

      * This can be considered JS's implementation of (top-down) **Prototypal Inheritance**, since it doesn't have true classes but we can share behaviors. This design pattern is also called **Behavior Delegation** (lower objects on the inheritance chain "delegate" requests to upstream objects).

      * ```javascript
        let dog = {
          say() { console.log(this.name + ' says Woof!'); },
        };
        
        let fido = Object.create(dog);
        fido.name = 'Fido';
        fido.say(); // 'Fido says Woof!'
        
        let spot = Object.create(dog);
        spot.name = 'Spot';
        spot.say(); // 'Spot says Woof!'
        ```

  * Overriding Default Behavior

    * Objects created from prototypes override shared behaviors by re-defining the same methods.

  * `Object.getOwnPropertyNames` and `object.hasOwnProperty`

    * When using behavior delegation, we can no longer rely on `obj.prop !== undefined` to test if a property is defined on an object or not-- that checks `prop` anywhere on the prototype chain.
      * `object.hasOwnProperty(prop)`: tests if `prop` is defined on `object` itself
      * `Object.getOwnPropertyNames(obj)`: returns array of object's own property names

  * Methods on `Object.prototype`

    * Since `Object.prototype` is in all JS objects' prototype chains, any obj can use its methods:
      * `Object.prototype.toString()`: returns a string representation of the object
      * `Object.prototype.isPrototypeOf(obj)`: tests if obj is in another object's property chain
      * `Object.prototype.hasOwnProperty('prop')`: tests if property is defined on the object itself
    * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object

* **Function Prototypes and Object Prototypes**

  * 

* **Constructors, Prototypes, and the Prototype Chain**

* **Static and Instance Properties and Methods**

* **The Pseudo-classical Pattern and the OLOO Pattern**

* **The Class Syntactic Sugar**

* **More Methods on the Object Constructor**

* **Modules**

* **Douglas Crockford Lecture- JavaScript: The Good Parts**

### Concepts/Vocab

