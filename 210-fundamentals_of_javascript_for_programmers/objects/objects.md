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

  * Property Names and Values
    * A property name for an object can be any valid string, and a property value can be any valid expression.
  * Accessing Property Values
    * Property values can be accessed either using dot notation or bracket notation
      * Dot notation: `object.propertyName` (generally preferred)
      * Bracket notation: `object[propertyName]`
  * Adding and Updating Properties
    * Properties can be added and assigned using either dot or bracket notation
    * The reserved keyword `delete` is used to delete properties: `delete foo.a;`

* Stepping through Object Properties

  * ```javascript
    let nicknames = {
      joseph: 'Joey',
      margaret: 'Maggie',
    }
    
    for (let nick in nicknames) { // Using a for..in loop
      console.log(nick);
      console.log(nicknames[nick]);
    }
    
    // logs: 
    // joseph
    // Joey
    // margaret
    // Maggie
    ```

  * ```javascript
    let nicknames = {
      joseph: 'Joey',
      margaret: 'Maggie',
    }
    
    // use Object.keys(obj) to get names of properties in obj
    Object.keys(nicknames); // ['joseph', 'margaret']
    ```

  * ```javascript
    // How can we get the count of words in a sentence with looping?
    function wordCount(str) {
      let count = {};
      let words = str.split(' ');
      for (let idx in words) {
        let word = words[idx];
        count[word] ? count[word] += 1 : count[word] = 1
      }
      return count;
    }
    
    console.log(wordCount('box car cat bag box car')); // { box: 2, car: 2, cat: 1, bag: 1 }
    ```

* Arrays and Objects

  * When should we use an array vs an object to represent our data?

    * Arrays:
      * Use an array if data is more like a list that contains many items or maintain a specific order.
      * Most common array interactions: add elements, retrieve elements, modify elements, remove elements, and iterate over elements ("walk the list").
    * Objects:
      * Use an object if data is more like an entity, or need to access values based on names.
      * Most object interactions: "keyed" access-- using a key value to add, retrieve, modify, or delete a specific data item. Can also be called an "associative array".

  * Don't forget, however, that in JS arrays themselves are actually objects!

    * ```javascript
      let a = ['hello', 'world'];
      
      console.log(typeof a); 				// "object"
      console.log(a['1']);					// "world", using the object bracket notation
      console.log(Object.keys(a));	// ["0", "1"], the keys of the object!
      ```

    * ```javascript
      // the above is equivalent to the below, in terms of logged statements
      let a = {
        '0': 'hello',
        '1': 'world',
      };
      
      console.log(typeof a);        // "object"
      console.log(a['1']);          // "world", object's bracket notation to access value
      console.log(Object.keys(a));  // ["0", "1"], the keys of the object!
      ```

  * Arrays and the Length Property

    * A property name is an array index when it is a non-negative integer. Values that have been assigned to index properties are called **elements** of the array. All other property names and their associated values are NOT considered to be elements of the array.

      * ```javascript
        let myArray = [];
        myArray['foo'] = 'bar';
        myArray[0] = 'baz';
        myArray[1] = 'qux';
        
        console.log(myArray); // logs ['baz', 'qux', foo: 'bar']
        myArray.length; 			// returns 2 since foo: 'bar' is not an element
        ```

    * `Array.prototype.indexOf` returns `-1` if the value it is passed is not an element of the array, EVEN IF the value is associated with a non-index property.

    * The value of `length` is entirely dependent on the largest array index (that index + `1`).

    * Logging an array logs all the indexed values and every `key: value` pair that the object contains. It logs only the `value` if it's an element, otherwise it logs the `key: value` pair if it is not an element.

    * To count all of the properties in an Array object, use `Object.keys(arr).length`, DON'T USE `array.length`.

    * Setting the `array.length` property to a value equal to or smaller than the current largest array index results in `array` losing data, while setting it to a value greater than the array index results in "`empty` slots" being added.

      * `empty` slots do not count as elements, because they have not been assigned a value, they are only there to indicate gaps between the actual elements. Though they aren't elements, they are still counted for the purposes of `array.length` because they occupy indexes.
        * **NOTE:**  `array.length` is not necessarily the same as the number of elements in `array`!

  * Using Object Operations with Arrays

    * Use `Array.prototype.splice()` to remove values from arrays instead of `delete`.
    * Don't use arithmetic operators with objects, like with arrays. Implicit type coercion causes bugs.
    * Object equality, like with arrays, depends on the variables referencing the same object.

* Arrays: What is an Element?

  * Array Keys

    * All built-in Array methods ignore non-element properties (having a non-negative integer key).
    * There is no right answer to how to determine whether an array is empty-- do we care only about length? Do we care about properties? Make the decision when writing the code.

  * Sparse Arrays

    * Arrays are "sparse"-- count of elements in an array isn't equal to its length (because of `empty`)

    * Trying to access an `empty` space in an array returns `undefined`

      * However, those values aren't actually `undefined`, they're never even set (just placeholders).
      * Setting an `empty` space to have value `undefined` suddenly includes it as an element

    * How does the sparse nature of arrays effect what we consider an empty array?

    * ```javascript
      let arr = [];
      arr.length = 3;
      
      // Is arr empty?
      console.log(arr.length); 			// 3 -- not empty?
      console.log(Object.keys(arr)) // [] -- empty?
      ```

* Mutability of Values and Objects

  * What is the difference between Objects and Primitive values with respect to mutability?
    * Primitives (strings, numbers, booleans, `null`, and `undefined`) are immutable.
      * Operations on primitive values return a new value of the same type.
    * Objects are mutable-- you can modify them without changing their identity (repointing).

* Pure Functions and Side Effects

  * **Side Effects**

    * Functions having unexpected side effects is a major source of bugs.

    * A function call that performs any of the following actions (when used as intended) is said to have side effects:

      * It reassigns any non-local variable.
      * It mutates the value of any object referenced by a non-local variable.
      * It reads from or writes to any data entity (files, network connections, etc.) that is non-local to your program.
      * It raises an exception.
      * It calls another function that has side effects.

    * Side Effects through Reassignment

      * Occurs when a function reassigns any variable that is not declared inside the function.

      * ```javascript
        let number = 42;
        function incrementNumber() {
          number += 1; // side effect: the number is defined in an outer scope
        }
        ```

    * Side Effects through Mutation

      * Occurs when a function mutates any variable not declared inside the function.

      * ```javascript
        let letters = ['a', 'b', 'c'];
        function removeLast(array) {
          array.pop(); // side effect: alters the passed-in array
        }
        
        removeLast(letters);
        ```

    * Side Effects through Input/Output

      * Anything that causes JS to look outside the program for data to read/write is a side effect.

      * ```javascript
        let readLine = require("readline-sync");
        
        function getName() {
          let name = readLine.question("Enter your name: ") // side effect: I/O
          console.log(`Hello, ${name}!`); // side effect: output to console
        }
        ```

    * Side Effects through Exceptions

      * A function that can raise an exception without catching and handling it has a side effect.

      * ```javascript
        function divideBy(numerator, denominator) {
          if (numerator === 0) {
            throw new Error("Divide by zero!"); // side effect: raises an exception
          }
          
          return numerator / denominator;
        }
        ```

    * Side Effects through Other Functions

      * If a function invokes another function that has a side effect outside of the calling function, however this can be dealt with by using `.slice()` to make a copy of the array in question.

      * ```javascript
        function insertNumberInOrder(arrayOfNumbers) {
          arrayOfNumbers = arrayOfNumbers.slice(); // creates a copy of an array
          arrayOfNumbers.push(arrayOfNumbers); // not a side effect, array was copied
          arrayOfNumbers.sort((a, b) => a - b); // sort has no side effects in func
          return arrayOfNumbers; // function has no side effect
        }
        ```

  * Mixing Side Effects and Return Values

    * **MOST functions should EITHER return a useful value OR have a side effect, not both.**
    * There are exceptions to this, like reading or writing something from a database or input, but largely the rule holds true. Use your own discretion!

  * **Pure Functions**

    * Pure functions are functions that:
      1. Have no side effects
      2. Always return a value that is solely dependent on the arguments it is passed.
      3. Given the same set of arguments, the function returns the same value during its **lifetime**.
    * A function's **lifetime** begins when the function is created, and ends when it is destroyed.
      * For ex. consider a function nested within an outer function-- it is created each time the outer function is called, and has the lifespan of a single execution of the outer function

* Working with the Math Object

* Working with Dates

  * JS has four ways to create a `Date` object:
    1. `new Date();`
    2. `new Date(value);`
    3. `new Date(dateString);`
    4. `new Date(year, month[, date[, hours[, minutes[, seconds[, milliseconds]]]]]);`

* Working with Function Arguments

  * The Traditional Approach

    * Omitted arguments to a function take on the value of `undefined` within the function

    * Functions ignore any excess arguments

    * The `arguments` object is an *Array-like* local variable that is available inside all Functions.

      * It contains the arguments passed to the function, no matter how many were provided.

      * ```javascript
        function logArgs(a) {
          console.log(arguments[0]);
          console.log(arguments[1]);
          console.log(arguments.length);
        }
        
        locArgs(1, 'a');
        
        // logs: 1 a 2
        ```

    * You can create an array from the `arguments` object with the following code:

      * ```javascript
        let args = Array.prototype.slice.call(arguments);
        ```

  * The Modern Approach

    * ES6 introduced a new way to access an arbitrary number of arguments: **rest parameters**

      * ```javascript
        function logArgs(...args) {
          console.log(args[0]);
          console.log(args[1]);
          console.log(args.length);
        }
        
        logArgs(1, 'a');
        // logs 1 a 2
        ```

    * Unlike the `arguments` object, the array in a rest parameter is an actual array (not Array-like)

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
* How can we use a negative index to access an array value? Why do we have to do this?
  * `Array.prototype.slice(start, end)` allows us to use a negative index to `start`
  * `array[-1]` is actually accessing the property named `'-1'` of `array`, since array elements are exclusively non-negative integers and arrays are objects!