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

  * What are the two ways JS uses the term "prototype"?

    * Object prototype: The next object in the lookup for property access
    * Function prototype: A property of functions

  * Every function in JS has a **function prototype**.

    * It is by default assigned an object that instances created by the constructor can delegate to.

    * All objects a constructor function constructs have this object set as their prototype.

    * ```javascript
      let Foo = function() {};
      let obj = Foo.prototype;
      
      let bar = new Foo();
      let baz = new Foo();
      
      Object.getPrototypeOf(bar) === obj; // true
      Object.getPrototypeOf(baz) === obj; // true
      
      bar.constructor === Foo; 	// true, bar is created from Foo
      bar instaceof Foo; 				// true, bar is an instance of Foo
      
      baz.constructor === Foo; 	// true, baz is created from Foo
      baz instaceof Foo; 				// true, baz is an instance of Foo
      ```

    * Both objects in the above code (`bar` and `baz`) delegate to (have their prototype set to) the object `obj` that is assigned to the `prototype` property of `Foo`.

    * ![Delegation in action](https://d3905n0khyu9wc.cloudfront.net/images/constructor_prototypes_1.png)

  * What is an example of using the **Prototype Pattern** of object creation?

    * ```javascript
      let Dog = function() {};
      
      Dog.prototype.say = function() { console.log(this.name + ' says woof!'); }
      Dog.prototype.run = function() { console.log(this.name + ' runs away.'); }
      
      let fido = new Dog();
      fido.name = 'Fido';
      fido.say(); // delegates to Dog.prototype and logs Fido says woof!
      fido.run(); // delegates to Dog.prototype and logs Fido runs away.
      ```

  * What is a brief way of describing the prototype pattern of object creation?

    * Defining shared behaviors on the constructor's `prototype` property.

* **Constructors, Prototypes, and the Prototype Chain**

  * What is the main reason we would prefer to use constructor functions over object factories? Consider the following code:

    * ```javascript
      function Dog(name, weight) {
        this.name = name;
        this.weight = weight;
        this.bark = function() { console.log(this.weight > 20 ? 'Woof!' : 'Yip!'); };
      }
      
      let maxi   = new Dog('Maxi', 32);
      let dexter = new Dog('Dexter', 50);
      
      maxi.bark === dexter.bark; // false
      ```

    * Each time we create a new `Dog` object, we create a new `bark` method so we can add it to the object, and the methods are distinct from one another which is why the last line returns `false`.

    * We would prefer to create the `bark` method once rather than once for each copy of `Dog`.

  * Method Delegation to Prototypes

    * We can use prototypes in conjunction with constructors to let objects delegate method calls:

      * ```javascript
        function Dog(name, weight) {
          Object.setPrototypeOf(this, Dog.myPrototype);
          this.name = name;
          this.weight = weight;
          // no need to include a `bark` property and method, b/c of prototype obj
        }
        
        Dog.myPrototype = {
          bark() { console.log(this.weight > 20 ? 'Woof!' : 'Yip!'); }
        };
        
        let maxi = new Dog('Maxi', 32);
        maxi.bark(); // Woof!
        
        maxi.hasOwnProperty('bark'); // false
        Object.getPrototypeOf(maxi).bark === DogPrototype.bark; // true
        ```

      * In the code above, the `bark` method is defined not on the individual objs but on the object referenced by their `[[Prototype]]` property, `DogPrototype`

  * The Constructor `prototype` Property

    * Every JS function has a `prototype` property, but JS only uses it when the function is called as a constructor (paired with the `new` keyword):

    * ```javascript
      function Dog(name, weight) {
        this.name = name;
        this.weight = weight;
      }
      
      Dog.prototype.bark = function() { // assign Dog.prototype's `bark` property
        console.log(this.weight > 20 ? 'Woof!' : 'Yip!');
      };
      
      let maxi = new Dog('Maxi', 32); // constructor, uses the prototype & inherts bark
      maxi.bark(); // 'Woof!'
      
      let biggie = new Dog('Biggie', 9);
      biggie.bark(); // 'Yip!'
      ```

    * ![Diagram](https://dbdwvr6p7sskw.cloudfront.net/images/js120/constructor-prototype-map.png)

    * Therefore, we can update our earlier understanding of what happens when `new` is used. For a given constructor function `Foo`, when we call it with `new`:

      1. JS creates an entirely new object.
      2. It sets `Foo.prototype` as the prototype for the new object. That is, the new object inherits from the object referenced by `Foo.prototype`.
      3. It sets the execution context (`this`) for the function to point to the new object.
      4. It invokes the function.
      5. It returns the new object *unless* the function returns another **object**.

    * As with `instanceof`, the `constructor` property lets us determine the type of an object:

      * ```javascript
        let maxi = new Dog('Maxi', 32);
        maxi.constructor === Dog;
        ```

      * Keep in mind, the `constructor` property can be reassigned so be careful!

  * Overriding the Prototype

    * ```javascript
      let maxi = new Dog('Maxi', 32);
      let dexter = new Dog('Dexter', 50);
      
      dexter.bark = function() {
        console.log('WOOF!')
      }
      
      maxi.bark(); 		// Woof!
      dexter.bark(); 	// WOOF!, overriding the `bark` method from `Dog.prototype`
      ```

    * Because JS finds a `bark` property on `dexter` it can call the method that it points to, unlike in `maxi` where it has to go back to the prototype object to find `bark`.

* **Static and Instance Properties and Methods**

  * What is an **instance** in OOP?

    * An instance is an individual object of a specific data type. For example, `maxi` and `dexter` in the above code are instance objects created from the `Dog` constructor.

  * Instance Properties / Instance Methods

    * Instance properties are properties that belong to a specific instance of some type-- attempting to access properties with those names on the constructor won't work.
    * Instance methods typically shouldn't be created/stored directly in instances, but rather in the instance's prototype in order to avoid unncessarily repeated computation at runtime.
      * We usually refer to methods in the prototype as instance methods as well, because of this.

    * *Any* *method* defined in *any* *prototype* in the prototype chain of an object is considered to be an instance method of that object.

  * Static Properties

    * **Static properties** are defined & accessed directly on the constructor, not instance/prototype.

    * ```javascript
      function Dog(name, breed) {
        this.name = name;
        this.breed = breed;
        Dog.allDogs.push(this); // push newly created instance to Dog.allDogs
      }
      
      Dog.allDogs = []; // static property tracking all instances of constructor
      ```

  * Static Methods

    * We can also have static properties that reference methods:

      * Ex. `Object.assign`, `Array.isArray`, `Date.now` are all static methods on constructors

    * ```javascript
      Dog.showSpecies = function() {
        console.log(`Dogs belong to the species ${Dog.species}`);
      };
      
      Dog.showSpecies();
      ```

* **The Pseudo-classical Pattern and the OLOO Pattern**

  * Having learned about factory functions, constructors, and prototypes, we can now get into two best-practice patterns for object creation in JS: the **Pseudo-classical pattern** and the **OLOO (Object Linking to Other Object) pattern**

  * The Pseudo-classical Pattern

    * Solves the factory pattern's type determination problem by replacing the factory function with a *constructor function* (relying on the keyword `new`) to create new objects.

    * ```javascript
      let pointA = new Point(30, 40);
      ```

  * The OLOO (Objects Linked to Other Objects) Pattern

    * Create objects directly from other objects instead of using constructor functions, and using explicit (`init`) initialization with a method rather than implicit initialization (with `new`).

    * ```javascript
      let pointA = Object.create(Point).init(30, 40);
      ```

  * Further Reading:

    * [Comparison of different object-oriented JavaScript patterns](https://john-dugan.com/object-oriented-javascript-pattern-comparison/)
    * Recap and mental model of two of our students on the JavaScript design patterns we covered:
      - [JavaScript Design Patterns: Building a Mental Model](https://medium.com/launch-school/javascript-design-patterns-building-a-mental-model-68c2d4356538)
      - [JavaScript Weekly: Fundamental Object Design Patterns](https://medium.com/launch-school/javascript-weekly-fundamental-object-design-patterns-31453f68427f)

* **The Class Syntactic Sugar**

  * ES6 introduced the `class` keyword, which is really just syntactic sugar that wraps around the pseudo-classical pattern:
    * ![img](https://d3905n0khyu9wc.cloudfront.net/images/class_vs_pseudo_classical.png)
  * The main differences between using `class` and the base pseudo-classical pattern are:
    1. The use of the keyword `class` instead of `function`.
    2. Parameters are defined and states are set within the explicit `constructor` function, which automatically runs whenever an object is created.
    3. All methods defined within the `class` definition are defined on the prototype object automatically rather than added later, with the exception of `constructor`.
  * A Couple of Caveats:
    1. All code in `class` executes in strict mode.
    2. Class declarations are not hoisted (unlike function declarations).
    3. Invoking the class constructor without using the `new` keyword raises an error.

* **More Methods on the Object Constructor**

  * `Object.create` and `Object.getPrototypeOf`

    * We can create a prototype chain that mimics classical inheritance by using `Object`'s  `getPrototypeOf` method in conjunction with its `create` method.

    * The code below will add a method to the `ExtendedArray` object, which is otherwise identical to `Array`, so `ExtendedArray` will be able to delegate all normal array Array methods to `Array.prototype` while also having the special ability to respond to `first` properly:

    * ```javascript
      Object.getPrototypeOf([]) === Array.prototype; // true
      
      function ExtendedArray() {}
      ExtendedArray.prototype = Object.create(Object.getPrototypeOf([]));
      
      ExtendedArray.prototype.first = function() {
        return this[0];
      };
      
      let enhancedArr = new ExtendedArray();
      let oldArr 			= new Array();
      
      enhancedArr.push(5);
      oldArr.push(5);
      
      console.log(enhancedArr.first()); // 5
      console.log(oldArr.first()); // undefined
      ```

  * `Object.defineProperties`

    * We can use the `defineProperties` method on `Object` to provide properties and values and set whether each property can be changed or not.

    * We use this to create a read only property on an object in the code below:

    * ```javascript
      let obj = { name: 'Obj', };
      
      Object.defineProperties(obj, {
        age: {
          value: 30,
          writable: false, 	// the `age` property of `obj` is now read-only
        },
      });
      
      console.log(obj.age); // 30
      obj.age = 32;					// this won't have any effect
      console.log(obj.age); // 30, the line above didn't manage to reset the property
      ```

    * ```javascript
      function newPerson(name) {
        return Object.defineProperties({ name: name}, {
          log: { 																	// add property `log` that points to
            value() { console.log(this.name); }, 	// this function
            writable: false												// and set it to be read-only
          },
        });
      }
      ```

  * `Object.freeze`

    * We can use the `freeze` method on `Object` to ensure that all property values (that aren't objects, since the object references will be frozen but the references within those objects are still mutable) are immutable. (Note: objects cannot be unfrozen once frozen.)

    * ```javascript
      let frozen = {
        integer: 4,
        string: 'String',
        array: [1, 2, 3],
        object: { foo: 'bar', },
      }
      
      Object.freeze(frozen); 		// occurs in-place
      
      frozen.integer = 8; 			// doesn't work
      console.log(frozen.integer);      // => 4
      
      frozen.string = 'Number';	// doesn't work
      console.log(frozen.string);       // => String
      
      frozen.array.pop(); 			// does work, array elements are mutable
      console.log(frozen.array);        // => [1, 2]
      ```

* **Modules**

  * Benefits of Modules

    * Modules allow us to split up large programs into smaller, atomic pieces that are easier to comprehend individually and as a system.
    * Modules also facilitate the reusability of code, separation of concerns, and the use of private data and encapsulation.

  * CommonJS Modules (aka Node modules)

    * Using CommonJS Modules

      * When using Node, we can **require/import** code from modules like `readline-sync` into a given program using the **CommonJS module syntax**:

        * ```javascript
          const readline = require('readline-sync');
          let choice = readline.question("Run this program? (y/n)");
          ```

      * CommonJS modules aren't supported in browsers because they are loaded *synchronously*, and therefore take too long to load to be applicable for the browser environment.

        * Transpilers like [Babel](https://babeljs.io/) can transpile code using CommonJS modules into a browser compatible format.

    * Creating CommonJS Modules

      * To create a module, we just have to add some extra code to export our items for use:

        * ```javascript
          function logIt(string) { console.log(string); }
          module.exports = logIt; // this is what gets exported/imported
          
          const logIt = require('./logit'); // use in a new file, specifying path
          logIt('You rock!'); // => 'You rock!'
          ```

      * We can export any values in whatever amount we'd like:

        * ```javascript
          let prefix = '>> ';
          
          function logIt(str) { console.log(`${prefix}${str}`); }
          function setPrefix(newPrefix) { prefix = newPrefix; }
          
          module.exports = {
            logIt, 			// export function logIt
            setPrefix,	// export function setPrefix
          };
          
          // unpack our imports in a new file using object destructuring
          const { logIt, setPrefix } = require('./logit');
          logIt('You rock!'); // >> You rock!
          setPrefix('++ ');
          logIt('You rock!'); // ++ You rock!
          ```

    * CommonJS Variables

      * In Node, all code is part of a CommonJS module, including your main program.
      * Each module provides variables you can use in your code:
        * `module`: an object that represents the current module
        * `exports`: the name(s) exported by the module (same as `module.exports`)
        * `require(moduleName)`: the function that loads a module
        * `__dirname`: the absolute pathname of the directory that contains the module
        * `__filename`: the absolute pathname of the file that contains the module

  * JS Modules (aka ES modules or ECMAScript modules)

    * Some History

      * Loading modules synchronously in the browser would result in a full request/response cycle of loadtime: request the resource, wait for server's response, convert the body, then load the module into JS.
      * Early workarounds to this included RequireJS and Browserify, which allowed for the pre-downloading and bundling of JS files. 
      * However, ES6 has added native module support for JS using `export` and `import`, so these workarounds are no longer necessary.
        * Note: if it's important to support older browers, it's recommended to use tools like Babel or Webpack these days.
          * **Babel**: transpiles ES6 code to ES5 code.
          * **Webpack**: consolidates all of the modules you need into a single file.

    * Using JS Modules

      * Exporting is as simple as preceding each declaration with the word `export`.

      * Consider an example codebase that uses the three following files:

        * ```javascript
          // bar.js
          export let items = [];
          export let counter = 0;
          
          export function bar() {
            counter += 1;
            items.push(`item ${counter}`);
          }
          
          export function getCounter() { return counter; }
          ```

        * ```javascript
          // foo.js
          import { bar } from './bar';
          
          let xyz = 1
          
          export function foo() {
            console.log(xyz);
            xyz += 1;
            bar();
          }
          ```

        * ```javascript
          // main.js
          
          import { foo } from './foo';
          import { bar, getCounter, items, counter } from './bar';
          
          foo();
          console.log(items); 				// ['item 1']
          console.log(getCounter()); 	// 1
          console.log(counter);				// 1
          
          bar();
          console.log(items); 				// ['item 1', 'item 2']
          console.log(getCounter()); 	// 2
          console.log(counter);				// 2
          ```

* **Douglas Crockford Lecture- JavaScript: The Good Parts**

  * 

### Concepts/Vocab

* Scope-safe constructor
* Ryan Schaul's JS OOP Vid:
  * https://www.youtube.com/watch?v=-N9tBvlO9Bo
* A shallow dive into the constructor property in JS:
  * https://medium.com/@patel.aneeesh/a-shallow-dive-into-the-constructor-property-in-javascript-b0a89747058b