## JS210/Lesson 5: Objects

### Notes

* Introduction to Objects

  * Standard Built-in Objects

    * JS provides built-in objects, including `String`, `Array`, `Object`, `Math`, `Date`, and so on.

    * Though some built-in objects share names with primitive datatypes, they are *not the same thing*.

      * We can only call methods on the object data type, for example (not on a primitive)-- this allows us to create strings/numbers/booleans using **literal notation** `let a = 'hi';`  instead of requiring us to write `let a = new String(hi');`

        * ```javascript
          let a = 'hi';													// Create str primitive w/ val "hi"
          typeof a;															// "string"; a is a primitive string
          
          let stringObject = new String('hi');	// create a string object
          typeof stringObject;									// "object"; this is a String object
          
          a.toUpperCase();											// "HI"
          stringObject.toUpperCase();						// "HI"
          
          typeof a;															// "string"; coercion is temporary
          typeof stringObject;									// "object"
          ```

      * However, JS temporarily coerces primitives to their object counterpart when necessary

        * `null` and `undefined` do not have object counterparts

  * Creating Custom Objects

    * There are three ways to create objects:

      * Object constructor functions: `new String('foo');`

      * Object literal notation

        * ```javascript
          let colors = {
            red: '#f00',
            orange: '#ff0',
          };
          
          typeof colors;  // "object"
          colors.red; 		// "#f00"
          colors.orange;	// "#ff0"
          ```

      * Using the `Object.create` method

  * Properties

    * Objects, like in Ruby, are containers for two things: state and behavior.

    * In JS, we call the associations between a key and a value **properties **(like Ruby attributes).

    * We can get and set the value for a key with dot notation:

      * ```javascript
        let colors = {
          red: '#f00',
          orange: '#ff0',
        };
        
        colors.red; 					// '#f00'
        colors.red = 'red';
        colors.red;						// 'red'
        ```

  * Methods

    * When functions are part of an object, we call them **methods**

    * Methods are called on objects using dot notation like other properties

      * ```javascript
        (5.234).toString();
        'pizza'.match(/z/);
        Math.ceil(8.675309);
        Date.now();
        ```

    * Custom objects using object literal notation *always use a trailing comma*

      * ```javascript
        let myObj = {
          prop1: 'sample data',
          prop2: 'sample data',
          method1: function () {},
        }
        ```

    * **Compact method syntax** was introduced in ES6

      * ```javascript
        // OLD METHOD
        let myObj = {
          foo: function (who) {
            console.log(`hello ${who}`);
          },
          
          bar: function (x, y) {
            return x + y;
          },
        }
        ```

      * ```javascript
        // NEW METHOD -- RECOMMENDED
        let myObj = {
          foo(who) {
            console.log(`hello ${who}`);
          },
          
          bar(x, y) {
            return x + y;
          },
        }
        ```

  * Capitalization (when do we capitalize a name?)

    * If speaking about a primitive type, use lowercase: `string`, `number`, `boolean`
    * If speaking about the object form of a primitive type, use caps: `String`, `Number`, `Boolean`
    * Use object to refer to objects in general-- `Array` for methods/properties from `Array`, etc
    * When creating objects, you must use capitalization to refer to prototypes: `new Date()`

* Object Properties

* Stepping through Object Properties

* Arrays and Objects

* Arrays: What is an Element?

* Mutability of Values and Objects

* Pure Functions and Side Effects

* Working with the Math Object

* Working with Dates

* Working with Function Arguments

### Vocab

### Review Questions

* What is the difference between variable declaration, initialization, and assignment? Give examples
  * *Declaration* registers a variable in the corresponding scope (variable declaration)
    * Occurs using `var`, `let`, or `const`
    * Variables can be declared with or without an *initializer* (righthand value after `=`)
  * *Initialization* allocates memory for the variable 
    * Every variable initialized using `var` is initially assigned `undefined` because of hoisting
  * *Assignment* assigns a specified value to the variable
    * Takes palce when the line of code is actually executed