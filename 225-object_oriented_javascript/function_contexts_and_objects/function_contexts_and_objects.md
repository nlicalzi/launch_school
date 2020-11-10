## JS225/Lesson 2: Function Contexts and Objects

### Summary

* 

### Notes

* **Introduction**
  * JavaScript has **first-class functions** which means they can be added to objects, executed in the context of those objects, removed from the objects, passed to other functions, and run in entirely different contexts.
  * First-class functions have no initial context, they receive one when the program executes them.
  * Strict mode refresher: https://launchschool.com/gists/406ba491
    * You cannot create global variables implicitly.
    * Functions won't use the global object as their implicit context.
    * Forgetting to use `this` in a method raises an error.
    * Leading zeros on numeric integers are illegal.

* **The Global Object**

  * Background

    * JavaScript creates a **global object** when it starts running, which serves as the implicit execution context.
    * *In the browser*, the global object is the `window` object. (In Node, the global object is `global`)
      * *Global values* (`Infinity`, `NaN`) and *global functions* `isNan` and `parseInt` are properties of the global object-- `window.isNan`, `window.Infinity`, etc.

  * Global Object as Implicit Context

    * The global object is the implicit context when we evaluate expressions:

      * ```javascript
        foo = 1;
        foo; // 1
        ```

      * JS gives `foo` an implicit evaluation context in the code above: the global object. Thus, the first line is the same as writing `window.foo = 1`, or assigning the property `foo` to a value of `1`.

      * Line two is equivalent to writing `window.foo`, or returning the value of the property `foo` from the global object (`window`).

  * Global Variables and Function Declarations

    * When we declare global variables with `var` or functions, JS adds them to the global object as properties.

      * ```javascript
        foo = 1;
        var moreFoo = 3;
        let evenMoreFoo = 42;
        
        function bar() { return 1; }
        
        window.foo; 				// 1, implicitly executed in global scope
        window.moreFoo; 		// 3, explicitly a global variable
        window.evenMoreFoo; // undefined, locally scoped w/ let
        window.bar 					// function bar() ...
        ```

    * You can delete global variables that you don't declare, but not declared ones.

      * ```javascript
        foo = 1;
        var moreFoo = 3;
        
        delete window.foo; 			// deleted
        delete window.moreFoo; 	// not deleted
        ```

    * Note: all variables and functions in Node programs have function scope. 

      * Node introduces an additional "module" scope-- variables in this scope are those declared at the top level (not inside a function definition or object) of a `node.js` file
      * The execution context for your top-level program in Node is the empty object `{}`

  * Strict Mode and the Global Object

    * In strict mode, we don't have access to the global object as the implicit context, preventing access to variables that have not been previously declared.

    * ```javascript
      "use strict";
      
      let color = 'blue';
      colr = 'red' // Uncaught ReferenceError: colr is not defined
      
      ```

      * Without strict mode, the above code would create a new property on the `window` object called `window.colr` and set that to `red` instead of trying to reassign `color`.

* **Implicit and Explicit Function Execution Contexts**

  * Function Execution Context

    * Every time a JS function is invoked, it has access to an object called the **execution context** of that function, accessible through the keyword `this`.
    * Which object `this` refers to depends on how a given function was invoked.
    * The rules for `this` binding are entirely different than the rules for determining the scope of a variable. While variable scope is determined at the time of writing the code, `this` gets bound based on how a function is invoked.

  * Implicit Function Execution Context

    * Implicit Function Execution Context (also called an implicit **binding** for functions) is the context for a function that you invoke without supplying an explicit context. JS binds such functions to the global object.

      * ```javascript
        function foo() {
          return 'this here is: ' + this;
        }
        
        foo(); // "this here is: [object Window]"
        ```

    * Binding a function to a context occurs **when you execute the function, not when you define it.**

      * ```javascript
        let object = {
          foo() { return 'this here is: ' + this; },
        }
        
        object.foo(); // 'this here is: [object Object]'
        
        let bar = object.foo;
        bar(); 				// 'this here is: [object Window]'
        ```

    * In strict mode, `this` in the global scope is `undefined`.

  * Implicit Method Execution Context

    * The implicit *method* execution context is the execution context for any method (i.e. function referenced as an object property) invoked without an explicit context provided.

    * JS implicitly binds methods invoked in this manner to the owning or calling object:

      * ```javascript
        let foo = {
          bar() { return this; },
        };
        
        foo.bar() === foo; // true
        ```

      * ```javascript
        let foo = {
          bar() { return this; },
        };
        
        let baz = foo.bar;
        
        baz() === foo; 		// false
        baz() === window; // true, context is bound on INVOCATION not definition
        ```

  * Explicit Function Execution Context

    * JS lets us use the `call` and `apply` methods to change a function's execution context at execution time. This allows us to explicitly bind a function's execution context to an object.

      * ```javascript
        a = 1;
        
        let object = { a: 'hello', b: 'world', };
        function foo() { return this.a; }
        
        foo(); 						// 1 			 (window.a -> context is global object)
        foo.call(object); // 'hello' (object.a -> context is object)
        ```

      * `call()` and `apply()` are identical, except apply uses an array and call uses individual args

        * ES6 solution w/ spread operator: `outputList.call(fruitsObj, ...fruitsObj.list)` does away with the need to use `apply()`

      * This allows us to 'borrow' a method from a given object to use with another object instead of copying it:

        * ```javascript
          let strings = {
            a: 'hello',
            b: 'world',
            foo() { return this.a + this.b; },
          };
          
          let numbers = {
            a: 1,
            b: 2,
          };
          
          strings.foo.call(numbers) // 3
          ```

    * ```javascript
      let iPad 	 = { name: 'iPad',   price: 40000, };
      let kindle = { name: 'kindle', price: 30000, };
      
      function printLine(lineNumber, punctuation) {
        console.log(lineNumber + ': ' + this.name + ', ' + this.price / 100 +
                   ' dollars' + punctuation);
      }
      
      printLine.call(iPad, 1, ';'); 	// => 1: iPad, 400 dollars;
      printLine.call(kindle, 2, '.'); // => 2: kindle, 300 dollars;
      ```

* **Hard Binding Functions with Contexts**

  * `Function.prototype.bind()` lets us permanently bind a function to an execution context (read: add a new `this` value).

    * Unlike `call` or `apply`, `bind` doesn't execute a function. Instead, it creates and returns a new Function and permanently binds it to a given object. Since the binding is permanent, we can pass the function around without concern that its context will change.

    * ```javascript
      let object = {
        a: 'hello',
        b: 'world',
        foo() {
          return this.a + ' ' + this.b;
        },
      };
      
      let bar = object.foo;
      bar(); // "undefined undefined", because `this` in foo now references `bar`
      
      let baz = object.foo.bind(object); // "hello world", `this` references `object`
      
      let object2 = { a: 'hi', b: 'there', };
      baz.call(object2); // "hello world", `this` is still `object` here
      ```

  * Example of using `bind` can be for localization purposes:

    * ```javascript
      let greetings = {
        morning: 'Good morning, ',
        afternoon: 'Good afternoon, ',
        evening: 'Good evening, ',
        
        greeting(name) {
          let currentHour = (new Date()).getHours();
          
          if (currentHour < 12) {
            console.log(this.morning + name);
          } else if (currentHour < 18) {
            console.log(this.afternoon + name);
          } else {
            console.log(this.evening + name);
          }
        },
      };
      
      let spanishWords = {
        morning: 'Buenos dias, ',
        afternoon: 'Buenas tardes, ',
        evening: 'Buenas noches, '
      };
      
      let spanishGreeter = greetings.greeting.bind(spanishWords);
      // when we call spanishGreeter(), JS will use spanishWords as the `this` value
      
      spanishGreeter('Jose');
      spanishGreeter('Juan');
      ```

  * Example: Changing Function Context

    * ```javascript
      let temperatures = [53, 86, 12, 43];
      
      function average() {
        let total = 0;
        let i;
        for (i = this.length - 1; i >= 0; i -= 1) {
          total += this[i];
        }
        
        return total / this.length;
      }
      
      console.log(average.call(temperatures)); // => 48.5, `this` points to average
      
      temperatures.average = average; // assign temp's `average` property to average()
      console.log(temperatures.average()); // => 48.5
      ```

* **Dealing with Context Loss**

  * The most common ways a function can lose its context:

    * **Method Losing Context when Take Out of Object**

      * If you remove a method from its containing object and execute it, it loses its context.

        * ```javascript
          let john = {
            firstName: 'John',
            lastName: 'Doe',
            greetings() {
              console.log('hello, ' + this.firstName + ' ' + this.lastName);
            },
          };
          
          let foo = john.greetings;
          foo(); // => hello, undefined undefined
          ```

      * Solution: **hard binding** with `bind` often works:

        * ```javascript
          function repeatThreeTimes(func) {
            func();
            func();
            func();
          }
          
          function foo() {
            let john = {
              firstName: 'John',
              lastName: 'Doe',
              greetings() {
                console.log('hello, ' + this.firstName + ' ' + this.lastName);
              },
            };
            
            repeatThreeTimes(john.greetings.bind(john)); // hard bind the context
          }
          
          foo(); // 3x => hello, John Doe
          ```

    * **Internal Function Losing Method Context** (well known issue among developers, JS flaw)

      * ```javascript
        let obj = {
          a: 'hello',
          b: 'world',
          foo() {
            function bar() {
              console.log(this.a + ' ' + this.b);
            }
            
            bar();
          },
        };
        
        obj.foo(); // => undefined undefined, `this` points to the global object here
        ```

      * Solution 1: Preserve Context with a Local Variable in the Lexical Scope

        * A.K.A. the `let self = this` or `let that = this` fix.

        * ```javascript
          let obj = {
            // ...
            foo() {
              let self = this;
              function bar() { console.log(self.a + ' ' + self.b); }
              bar();
            }
          };
          
          obj.foo(); // => 'hello world'
          ```

      * Solution 2: Pass the Context to Internal Functions

        * Pass the context object to the function with `call` or `apply`

        * ```javascript
          let obj = {
            // ...
            foo() {
              function bar() { console.log(this.a + ' ' + this.b); }
              bar.call(this);
            }
          };
          ```

      * Solution 3: Bind the Context with a Function Expression

        * Use `bind` when you define the function to provide a permanent context to `bar`. Note: you must call `bind` with a function expression, function declaration throws an error.

        * ```javascript
          let obj = {
            // ...
            foo() {
              let bar = function() {
                console.log(this.a + ' ' + this.b);
              }.bind(this);
              bar();
              bar();
            }
          };
          ```

      * Solution 4: Use an Arrow Function

        * Define `bar` using an arrow function, since the value of `this` when using an arrow function is based on lexical scoping rules.

        * ```javascript
          let obj = {
            // ...
            foo() {
              let bar = () => console.log(this.a + ' ' + this.b);
              bar();
            }
          };
          ```

    * **Function as Argument Losing Surrounding Context**

      * ```javascript
        let obj = {
          a: 'hello',
          b: 'world',
          foo() {
            [1, 2, 3].forEach(function(number) {
            	console.log(String(number) + ' ' + this.a + ' ' + this.b);
          	});
          },
        };
        
        obj.foo(); // 3x => 1 undefined undefined, etc.
        ```

      * Solution 1: Use a local variable in the lexical scope to store this

        * ```javascript
          let obj = {
            // ...
            foo() {
              let self = this; // local variable pointing to `this`
              [1, 2, 3].forEach(function(number) {
                console.log(String(number) + ' ' + self.a + ' ' + self.b);
              });
            },
          };
          ```

      * Solution 2: Bind the argument function with the surrounding context

        * ```javascript
          let obj = {
            // ...
            foo() {
              [1, 2, 3].forEach(function(number) {
                console.log(String(number) + ' ' + this.a + ' ' + this.b);
              }.bind(this)); // bind to `this` explicitly
          }
          ```

      * Solution 3: Use the optional thisArg argument

        * ```javascript
          let obj = {
            // ...
            foo() {
              [1, 2, 3].forEach(function(number) {
                console.log(String(number) + ' ' + this.a + ' ' + this.b);
              }, this); // forEach takes an optional `thisArg`
            },
          }//
          ```

      * Solution 4: Use arrow function for the callback

        * ```javascript
          let obj = {
            // ...
            foo() {
              [1, 2, 3].forEach((number) => {
                console.log(String(number) + ' ' + this.a + ' ' + this.b);
              });
            },
          };
          ```

* **The `this` keyword in JavaScript**

### Concepts/Vocab

* First-class Function
* Global Object
  * Global values
  * Global functions
* Execution Context
* `Function.prototype.call()`
  * The `call()` method calls a function with a given `this` value and arguments provided individually.
  * **C**all: **C**ount the **C**ommas (you have to count the number of args to match called function)
* `Function.prototype.apply()`
  * The `apply()` method calls a function with a given `this` value, and `arguments` provided as an array.
  * **A**pply: **A**rguments as **A**rray

* Variable initialization with `var` vs. `let` and `const`
  * Global `var` properties create properties on the global object, but `let` and `const` create variables that don't actually belong to any object.

* `Function.prototype.bind()`
  * Creates a new function that, when called, has its `this` keyword set to the provided value, with a given sequence of arguments preceding any provided when the new function is called.
  * Can a function bound to a context using `bind()` have its context change later, using `call()` or `apply()`? 
    * No! Once a function has been bound to an execution context with `bind`, its context can't be changed, even explicitly.
  * What is **hard binding**?