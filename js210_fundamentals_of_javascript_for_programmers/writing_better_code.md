## JS210/Lesson 6: Writing Better Code



### Notes

**Douglas Crockford: And then there was JavaScript**

* Link: https://www.youtube.com/watch?v=RO1Wnu-xKoY

**Douglas Crockford's "JavaScript: The Good Parts"**

* Link: https://www.youtube.com/watch?v=hQVTIJBZook

* The good parts:
  * Lambda
  * Dynamic Objects
  * Loose Typing
  * Object Literals
* Prototypal inheritance
  * JS is class-free, objects inherit from other objects
  * An object contains a link to another object: delegation / differential inheritance
* Douglas wrote JSLint, which defines a "professional subset" of JavaScript
  * Use it to check/format your code to avoid using the bad parts of JS

**AirBNB JS Style Guide**

* Link: https://github.com/airbnb/javascript

* Use named function expressions instead of function declarations

  * Too easy to get mixed up with hoisted function declarations

  * ```javascript
    let read = function read(pages) {
      console.log('You started reading.');
      for (let page = 0; page < pages; page += 1) {
        let message = 'You read page ' + String(page);
        console.log(message);
      }
    };
    
    read(400);
    ```

**Strict Mode**: https://launchschool.com/gists/406ba491

* What does strict mode do?
  * Eliminates some silent errors that occur in sloppy mode by changing them to throw errors
  * Prevents some code that can inhibit JS's ability to optimize a program to run faster
  * Prohibits using names and syntax that may conflict with future versions of JS
* How do we enable strict mode?
  * Add `"use strict";` as the first line of your function or file
  * Once enabled, strict mode follows lexical scope-- either global or function, etc.
* How does strict mode interact with hoisting?
  * Strict mode sets the default execution context to `undefined` instead of the *global object*.
  * The program will raise an error if one tries to assign a value to an undeclared variable.
    * Helps identify misspelled names, helps deal with "context loss"
* What are the semantic changes that occur when using strict mode?
  * You cannot create global variables implicitly.
  * Functions won't use the global object as the implicit context.
  * Forgetting to use `this` in a method raises an error.
  * Leading zeros on numeric integers are illegal (to avoid errors with octals)

**Syntactic Sugar**: https://launchschool.com/gists/2edcf7d7

* **Concise Property Initializers:**

  * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer

  * ```javascript
    function xyzzy(foo, bar, qux) {
      return {
        foo,					// concise initializer
        bar,					// concise initializer
        answer: qux,  // can mix ordinary initializers in
      };
    }
    ```

* **Concise Methods:**

  * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer

  * ```javascript
    let obj = {
      foo() { // instead of foo: function()
        // do something
      },
    
      bar(arg1, arg2) { // instead of bar: function()
        // do something else with arg1 and arg2
      },
    }
    ```

* **Object Destructuring:**

  * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#Object_destructuring

  * A shorthand syntax that lets you perform multiple assignments in a single expression.

  * ```javascript
    let obj = {
      foo: "foo",
      bar: "bar",
      qux: 42,
    };
    
    // Old form:
    let foo = obj.foo;
    let bar = obj.bar;
    let qux = obj.qux;
    
    // New form: 
    let { foo, bar, qux } = obj;
    ```

* **Array Destructuring:**

  * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#Array_destructuring

  * ```javascript
    let foo = [1, 2, 3];
    let [ first, second, third ] = foo;
    
    // if you don't need all of the elements, you can skip them
    let bar = [1, 2, 3, 4, 5, 6, 7];
    let [ first, , , fourth, fifth, , seventh ] = bar;
    ```

  * ```javascript
    let one = 1;
    let two = 2;
    
    [ one, two ] =  [two, one]; // swap values. L: destructuring, R: array literal
    
    console.log(one);   // 2
    console.log(two);   // 1
    ```

* **Spread Syntax**

  * Uses `...` to spread the elements of an array or object into separate items

  * ```javascript
    function add3(item1, item2, item3) {
      return item1 + item2 + item3;
    }
    
    let foo = [3, 7, 11];
    add3(...foo); // => 21
    ```

  * Similar to Ruby's splat operator `*`

  * Use cases:

    * Cloning an array or object:
      * `let foo = [1, 2, 3]; let bar = [...foo];`
      * `let foo = { qux: 1, baz: 2 }; let bar = { ...foo };`
    * Concatenating arrays:
      *  `let foo = [1, 2, 3]; let bar = [4, 5, 6]; let qux = [...foo, ...bar]`
    * Inserting an array into another array
      * `let foo = [1, 2, 3]; let bar = [...foo, 4, 5, 6, ...foo];`

### Vocab

* **Pragma**
  * A language construct that tells a compiler/interpreter to process the code in a different way
  * One example of a pragma is `"use strict";`
* **Spread syntax** vs. **Rest syntax**
  * Spread syntax, when used in function calls or array declarations
    * Spreads an array out into separate items
  * Rest parameters, when used in a function definition (allow it to take an arbitrary # of parameters)
    * Collects multiple items into an array or object
    * [developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters]()

