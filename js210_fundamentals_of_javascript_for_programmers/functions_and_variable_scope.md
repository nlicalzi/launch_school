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

* Closures

### Vocab