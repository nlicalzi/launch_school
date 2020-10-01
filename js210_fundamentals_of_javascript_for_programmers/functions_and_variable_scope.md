## JS210/Lesson 2: Functions and Variable Scope



### Notes

* Defining Functions

  * What are the component pieces of a function declaration?

    1. The `function` keyword
    2. The name of the function (below: `triple`)
    3. A list of comma separated parameters (below: `number`)
    4. A block of statements that make up the function body (below: lines 2 and 3)

    ```javascript
    function triple(number) {
      console.log('tripling in progress...');
      return number + number + number;
    }
    ```

  * What is the difference between a parameter and an argument?

    * Parameters are used in function definition, while arguments are used in function invocation.

* Function Invocations and Arguments

  * What is the most common/standard way to invoke a function in JS?
    * By appending `()` to its name: e.g. `startle()`
  * Function names in JS are just local variables that happen to have a function as a value.
  * What happens in JS when we call a function with too few arguments?
    * Calling a function with too few arguments **does not raise an error** in JS.
    * Within a function, an argument that wasn't provided in the call will have the value `undefined`

* Nested Functions

  * You can nest functions inside other functions:

  * ```javascript
    function circumference(radius) {
      function double(number) {			// nested function declaration
        return 2 * number;
      }
      
      return 3.14 * double(radius); // call the nested function
    }
    ```

* Functional Scopes and Lexical Scoping

  * In JS, every function or block creates a new variable scope.
  * Types of scope:
    * **Global Scope**: small JS programs with no functions or blocks exist entirely in the global scope
    * **Local Scope**: both function and block scope are also called local scopes
      * **Function Scope**: functions create a new function (inner/local) scope, and the code within an inner scope an access any variables in the same or surrounding outer scopes
      * **Block Scope**: as with function scope, the code inside a block scope can access any variables declared in the surrounding (outer) scope(s).
  * JS uses **lexical scoping** to resolve variables: using the structure of the code to determine scope.
    * Code in a lower scope can **shadow** a variable with the same name in a higher scope.
  * There are a number of ways to create a variable in the current scope:
    * Use the `let` or `const` keywords
    * Use the `var` keyword
    * Define parameters for a function- each parameter is a local variable
    * A function declaration creates a variable with the same name as the function
    * A class declaration creates a variable with the same name as the class
  * Why do we declare variables using `let` or `const` as opposed to without those keywords?
    * How do we ensure that new variables we create are properly scoped (don't have global scope)?
  * What does JS do if it can't find a variable anywhere in the scope hierarchy?
    * When does JS throw a `ReferenceError` exception?

* Function Declarations and Function Expressions

  * A **function declaration** (aka "function statement") defines a variable whose type is `function` and that obeys general scoping rules for variables by using the keyword `function` before the function name.

    * ```javascript
      function hello() {
        return 'hello world!';
      }
      ```

  * A **function expression** defines a function as part of a larger expression syntax (like variable assignment), and is typically used with anonymous functions.

    * ```javascript
      let hello = function () {
        return 'hello world!';
      }
      ```

  * It is possible to name function expressions, making the name available within the function and this is useful for debugging and recursion

    * ```javascript
      let hello = function foo() {
        console.log(typeof foo);
      };
      
      hello(); // => logs 'function'
      foo(); // Uncaught ReferenceError: foo is not defined
      ```

  * **Arrow functions** are a shorthand way to write function expressions.

    * Arrow functions are useful as **callback functions** (functions passed to other functions).

    * ```javascript
      // plain arrow function
      const multiply = (a, b) => a * b;
      
      // callback form
      [1, 2, 3].map(element => 2 * element); // returns [2, 4, 6]
      ```

  * How can we differentiate between a function declaration and a named function expression?

    * If a statement starts with the keyword `function`, it's a declaration; otherwise it's an expression.

  * When should we use each type of function?

    * Use arrow functions for callbacks.
    * Pick a primary form between function declarations or function expressions for other functions.

* Hoisting

  * What are the two main phases in which JS engines operate?

    * A **creation phase** and an **execution phase**.

  * What occurs during the creation phase of a JS engine's operation?

    * The engine finds all of the variable, function, and class *declarations*, **hoisting** them to the top of their respective functions or blocks a.k.a their defined scope. (This is a bit imprecise: what  happens is that they're loaded into memory, the code doesn't actually physically move.)

  * What occurs during the execution phase of a JS engine's operation?

    * The program runs code line by line.

  * What is **hoisting**, in the context of JS?

    * What do we call it when the JS engine finds all of the variable, function, and class declarations in a program and moves them to the top of their defined scope (their respective functions or blocks)?

  * What is the **temporal dead zone** in the context of JS?

    * Where do unset `let` or `const` variables go after hoisting, in the context of JS execution?

  * What are the effects of hoisting on `let`, `const`, and `var` variables?

    * `var` variables are assigned an initial value of `undefined` when they are hoisted.
    * `let` and `const` variables are left in an "unset" state, or stuck in the "temporal dead zone"
      * `Uncaught ReferenceError: Cannot access 'foo' before initialization`

  * What are the hoisting rules for function expressions?

    * Since function expressions often involve assigning a function to a declared variable, they follow the hoisting rules for variable declarations.

  * What best practices do we have to avoid hoisting confusion?

    * Whenever possible, use `let` or `const` instead of `var` to avoid confusion

    * If you must use `var`, declare all of your variables at the top of the scope

      * ```javascript
        function foo() {
          var a = 1;
          var b = 'hello';
          var c;
          // ...
        }
        ```

    * If you can use `let` and `const`, declare them as close to their first usage as possible

      * ```javascript
        function foo(bar) {
          console.log("Hello world!");
          
          let result;
          if (bar) {
            let squaredBar = bar * bar;
            result = squaredBar + bar;
          } else {
            result = "bar hasn't been set";
          }
          
          return result;
        }
        
        console.log(foo(3)); 					// 12
        console.log(foo(undefined));  // bar hasn't been set
        ```

    * Declare functions before calling them

      * ```javascript
        function foo() {
          return 'hello';
        }
        ```

  * **HOISTING PRACTICE PROBLEMS**

    * ```javascript
      function hello() {
        a = 'hello';
        console.log(a);
        
        if (false) {
          var a = 'hello again';
        }
      }
      
      hello();				// Why does this log 'hello'
      console.log(a); // Why does this throw an Uncaught ReferenceError: a is not defined?
      
      // MORE: https://launchschool.com/lessons/7cd4abf4/assignments/1d43f233
      ```

    * ```javascript
      // How is this different from the above code?
      function hello() {
        a = 'hello';
        console.log(a);
      
        if (false) {
          let a = 'hello again';
        }
      }
      
      hello();				// Why does this log 'hello'?
      console.log(a); // Why does this log 'hello'?
      ```

* Closures

  * What is a closure? What is in a closure?

    * What do we call the combination of a function and the lexical environment within which that function was defined?
    * What do we call a function combined with all of the variables in its lexical scope, including function and class names?

  * When is a closure created? What is the relationship between closures and scope?

    * Closures are created when you define a function or a method, essentially closing over its environment (what's in scope), and bringing along with it the references to those variables.

  * What do we mean when we say that closures are defined lexically?

    * When you invoke a function is unimportant; where you define the function is. A closure includes all the variables that are in scope where you defined the function.

  * What is partial function application?

    * What do we call the creation of a function that can call a second function with fewer arguments than the second function expects by supplying the remaining arguments?

  * When is partial function application useful?

    * What is most useful when you need to pass a function to another function that won't call the passed function with enough arguments, letting you create a function that fills in the gaps by supplying the missing elements?

  * What are some examples of closures in use?

    * ```javascript
      // Functions that returns functions are very powerful examples of closures
      function foo() {
        let name = "Pete";
        return function() {
          console.log(name);
        };
      }
      
      let printPete = foo();
      printPete(); // Pete
      ```

    * ```javascript
      function add(first, second) {
        return first + second;
      }
      
      function makeAdder(firstNumber) { // PARTIAL FUNCTION APPLICATION
        return function(secondNumber) {
          return add(firstNumber, secondNumber);
        };
      }
      
      let addFive = makeAdder(5);
      let addTen = makeAdder(10);
      
      console.log(addFive(3));  // 8
      console.log(addFive(55)); // 60
      console.log(addTen(3)); 	// 13
      console.log(addTen(55)); 	// 65
      ```

  * What are closures good for?

    * Callbacks
    * Partial function application
    * Creating private data
    * Currying (a special form of partial function application)
    * Emulating private methods
    * Creating functions that can only be executed once
    * Memoization (avoiding repetitive resource-intensive operations)
    * Iterators and generators
    * The module pattern (putting code and data into modules)
    * Asynchronous operations

### Vocab