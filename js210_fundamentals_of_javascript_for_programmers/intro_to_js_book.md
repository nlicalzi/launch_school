

## Launch School's Introduction to JavaScript Book Notes

### Intro

* JavaScript in the browser has two main purposes:

  1. to programmatically alter web pages based on user actions
     * The DOM (Document Object Model) lets you manipulate the structure and appearance of a web page
  2. to exchange messages with a server over the network
     1. The XHR (XMLHttpRequest) interface and the Fetch API let you communicate with a server.

* Style suggestions:

  * Comments start with `//

  * **camelCase** for variable and function names

    * Constructor functions use **PascalCase**

  * `const` values should be represented with uppercase and underscore:

    * ```javascript
      const INTEREST_RATE = 0.0525;
      ```

  * All names-- variables and constants as well as functions-- should use alphabetic and numeric characters only (besides constants, which may use underscores)

  * When writing a code block with curly braces, write the opening brace on the same line as the function name or conditional expression.

    * ```javascript
      function test() {
        // do something
      }
      ```

  * Use semicolons to terminate each logical line of code unless the line ends with `{ } :`
  
* Run a `.js ` file from the command line w/ the Node interpreter like this: `$ node example.js`

* Run JavaScript in the browser by including `<script src="example.js"></script>` in the `body` of your HTML file.

  * Or by using the `Console` in Chrome's developer tools (opt + cmd + i)

* Vocab:

  * constructor
  * instance method (incl. `prototype`): `Constructor.prototype.methodName()`
  * static method: `Constructor.methodName()`

### The Basics

* Data Types

  * What **primitive data types** exist in JavaScript?

    * `String`

      * String interpolation is accomplished with backticks and wrapping the code to be evaluated in `${ }`:

        * ```javascript
          `5 plus 5 equals ${5 + 5}`; # => `5 plus 5 equals 10`
          ```

    * `Number`

      * JS has a single data type for real numbers (positive, negative, floats, integers)

    * `undefined`

      * When a variable is not defined, its value is given by `undefined` (absence of a value)
      * `console.log()` returns `undefined`

    * `null`

      * Similar to `undefined`, `null` represents the intentional absence of a value 
      * Note-- `typeof null` returns `object`, a *mistake* made when the language was written (it is actually a primitive)

    * `Boolean`

  * How can we return the string representation of what data type a particular value has?

    * What does the `typeof` operator return?

* Operations

  * `+ - / *` all behave normally
  * `%` does remainder division, *not modulo*. Use modulo/remainder only with positives to avoid errors.
    * Remainder operations return a positive integer when the first operand is positive, and a negative integer when the first operand is negative.
    * Modulo operations return a positive integer when the second operand is positive, and a negative integer when the second operand is negative.
  * `NaN` stands for "Not a Number", and `NaN === NaN # => false`
    * Use `Number.isNaN` or `Object.is` to detect `NaN` values
  * There is also an `Infinity` value-- such as `1 / 0 # => Infinity`
  * Equality comparison is performed with three equals signs: `===`
  * String concatenation is performed with `+`, performing **implicit type coercion**

* Explicit Coercion

  * Numbers: `Number('1')`, `parseFloat('12.f')`, `parseInt(20.44)`
  * Strings: `String(20)`

* Data Structures

  * Arrays are ordered lists, consisting of square brackets `[ ]` surrounding comma-delimited values
    * Array elements can be accessed via index `arr[2]`, indices start with `0` then increment up
    * Attempting to access an element in an array via an index that is out of bounds will return `undefined`, not an error
  * Objects
    * A collection of key-value pairs (equivalent to a Python `dict` or Ruby `hash`)
    * Can be declared using object literals: `{ dog: 'barks' }

* Expressions and Return Values

  * Anything that JavaScript can evaluate to a value is known as an **expression**, almost everything you write in JS is an expression.

* Statements

  * Statements refer to *a syntactic unit of code that expresses an action for the computer to perform.*

  * What's the difference between expressions and statements?

    * Expressions are generally evaluated to *produce a value*.

    * Statements are generally executed to *make something happen*.

    * ```markdown
      JavaScript distinguishes expressions and statements. An expression produces a value and can be written wherever a value is expected, for example as an argument in a function call. Each of the following lines contains an expression:
          myvar
          3 + x
          myfunc("a", "b")
      Roughly, a statement performs an action. Loops and if statements are examples of statements. A program is basically a sequence of statements (we’re ignoring declarations here). Wherever JavaScript expects a statement, you can also write an expression. Such a statement is called an expression statement. The reverse does not hold: you cannot write a statement where JavaScript expects an expression. For example, an if statement cannot become the argument of a function. -- https://2ality.com/2012/09/expressions-vs-statements.html
      ```

  * Statements always evaluate as `undefined`

  * Statements can be used for control flow (`break`, `if..else`, `switch`, `try...catch`), declarations (`var`, `let`, `const`), iteration (`do..while`, `for`, `for each...in`, `while`), etc.

### Variables

* Variables and Variable Names

  * What does a JavaScript **identifier** refer to?
    * Variable names declared by `let` and `var`
    * Constant names declared by `const`
    * Property names of objects
    * Function names
    * Function parameters
    * Class names

* Declaring and Assigning Variables

  * What do we call a statement that asks the JavaScript engine to reserve space for a variable with a particular name and **initializes** it with a value?
    * What is variable declaration?
  * What is the preferred method in modern JavaScript of declaring a variable?
    * What is the `let` keyword used for?

* Declaring Constants

  * How do we declare and initialize **constant** identifiers?
    * What is the `const` keyword used for?
  * What type of variable is used to store values that remain the same throughout the execution of a program, a block within the program, or a function?
    * What are `constants` used for?

* Variable Scope

  * What scope do variables declared with `let` or `const` have?

    * What variables have **block** scope?

  * What is a **block**?

    * What do we call a related set of JS statements and expressions between a pair of opening and closing curly braces?

    * ```javascript
      if (expression) { // block starts at {
        doSomething();  // block body
      }									// block ends here
      ```

  * Are variables declared inside a block and having block scope available from outside of that block?

    * No.

    * ```javascript
      if (1 === 1) {
        let a = 'foo'
      }
      
      console.log(a); // ReferenceError: a is not defined
      ```

* A Common Gotcha

  * Always declare your variables, using `let`, `const`, or `var`, because all undeclared variables have global scope. 

### Input/Output

* Command Line Output

  * `console.log()` prints to `stdout`

* Command Line Input

  * Node.js has an API called **readline** that lets JS programs read input from the command line

    * `npm install readline-sync --save` installs package to `./node_modules`

    * ```javascript
      let rlSync = require('readline-sync'); // Treat library as an object
      let name = rlSync.question("What's your name?\n");
      console.log(`Good Morning, ${name}!`);
      ```

* Input in the Browser

  * `prompt()` and popups

### Functions

* Using Functions

  * Define a function using `function [name]() {[function_body]}`

  * ```javascript
    function say() {
      console.log('Hi!'); // this is known as the function body
    }
    ```

  * Arguments are passed into a function, in the spaces held for them by parameters in the function definition (same language as Ruby).

* Return Values

  * All JavaScript function calls/invocations evaluate to a value. By default, that value is `undefined`. 
  * By using a `return` statement in a function, you can return a specific value that is not `undefined`
  * Functions that always return a boolean value are called **predicates**

* Default Parameters

  * ```javascript
    function say(words = 'hello') {
      console.log(words + '!');
    }
    
    say('Howdy'); // argument -> logs Howdy!
    say(); 				// no arguments -> logs hello!
    ```

* Nested Functions

  * ```javascript
    function foo() {
      function bar() {
        console.log("BAR");
      }
      
      bar(); // BAR
      bar(); // BAR
    }
    
    foo();
    bar(); // ReferenceError: bar is not defined
    ```

  * The private function `bar()` gets created and destroyed each time `foo()` runs

* Variable Scope

  * There are two types of variables in JS based on where they're accessible
    * **local var**: any variable initialized inside a function or block is a local variable
    * **global var**: everything else is a global variable, and can be reassigned from within functions

* Functions vs. Methods

  * What is the difference between invoking a function and invoking a method?
    * Functions are called/invoked by themselves: `printUpperCase('xyzzy');`
    * Methods are called/invoked on variables or values: `'xyzzy'.toUpperCase();`

* Mutating the Caller

  * What does it mean for a method to mutate its caller?

    * What do we call it when a method permanently alters the object that invoked it?

  * ```javascript
    let name = 'Pete Hanson';
    console.log(name.toUpperCase()); // logs 'PETE HANSON'
    console.log(name); // logs 'Pete Hanson', i.e. `toUpperCase()`` is NON-MUTATING
    
    let oddNumbers = [1, 3, 5, 7, 9];
    oddNumbers.pop();
    console.log(oddNumbers); // logs [1, 3, 5, 7], i.e. `pop()` is MUTATING
    ```

  * **Primitive values are immutable**

  * **Arrays/objects are mutable**

  * JS, therefore, is pass-by-value for primitives and pass-by-reference for objects and arrays.

* Function Composition

  * What is meant by **function composition**?
    * What do we call the process by which JS lets us use a function call as an argument to another function?
  * Most obvious example is passing a function as an arg. to `console.log()`: `console.log(add(5, 5))`

* Three Ways to Define a Function

  * **Function declaration**:

    * ```javascript
      function functionName(zeroOrMoreArguments...) {
        // function body
      }
      ```

  * **Function expression**:

    * Any function definition that doesn't have the word `function` at the very beginning of a statement is a function expression.

    * ```javascript
      let greetPeople = function() {
        console.log('Good Morning');
      };
      
      greetPeople();
      ```

  * **Arrow function**:

    * Arrow functions are similar to function expressions, but they use a different syntax (and have some other differences to be covered later).

      * ```javascript
        let greetPeople = () => console.log('Good Morning!');
        greetPeople();
        ```

    * Return statements can be omitted only *when the function body contains one expression*

      * ```javascript
        let add = (a, b) => a + b;
        ```

    * What are two major differences between a function declaration and a function expression?

    * Functions that are defined using a function expression are saved to a variable. This is possible because JS functions are **first-class functions** (meaning they can be treated like any other value-- assigned to variables, passed to other functions, returned from function calls, etc.)

    * Functions that have been defined with a function declaration can be called before they are declared, while functions that have been defined using a function expression cannot.

* The Call Stack

  * What is **the call stack**?
    * What do we call a mechanism for an interpreter to keep track of its place in a script that calls multiple functions?
  * What does the call stack do?
    * What helps JS keep track of what function is executing, as well as where execution should resume when the function returns?
  * What is the only item on the call stack when a JS program begins/ends running?
    * When is `main` the only item on the call stack?
  * When are items pushed to/popped from the call stack?
    * Each time a function is invoked it is pushed to the call stack before being popped from the stack once it returns a value.

### Flow Control

* Conditionals

  * Built using a combination of `if/else` statements and comparison/logical operators: 

  * ```javascript
    if (condition1) {
      // block x;
    } else if (condition2) {
      // block y;
    } else {
      // block z;
    }
    ```

* Comparisons

  * Comparison operators return a boolean value: `true` or `false`

  * Comparison operators: `< > <= >= == === != !==`
    * `===`: the **strict equality operator** or the **identity operator**
      * Returns `true` when the operands have the same type *and* value, else `false`
      * For strict inequality, use `!==`
    * `==`: the **non-strict equality operator** or the **loose equality operator** 
      * If operands have different types, `==` coerces one of the operands to the other's type
      * For non-strict inequality, use `!=`
      * Non-strict in/equality operators are *to be avoided*, mostly. 

* Logical Operators

  * `&& (and) || (or) ! (not)`
  * The double-bang operator can be used to convert something to its boolean value `!!`
  * The return value of an `&&` or `||` expression is the value of the **operand evaluated last**
    * `3 && 'foo'` => `'foo'`, while `0 && 'foo'` => `0`
    * `3 || 'foo'` => `3`, while `0 || 'foo'` => `'foo'`

* Short Circuits

  * Both `&&` and `||` use **short circuit evaluation** to evaluate their operands
    * If the left operand in a `&&` expression is false, the second expression isn't evaluated
    * If the left operand in a `||` expression is true, the second expression isn't evaluated

* Truthiness

  * What values are **falsey** (evaluate to false in a boolean context) in JS?
    * `false`
    * `0`, `-0`, `0n`
    * `''` (empty string)
    * `undefined`
    * `null`
    * `NaN`

* Operator Precedence

  * From highest precendence to lowest:
    * `<= < > >=`: comparison
    * `=== !==`: equality
    * `&&`: logical AND
    * `||`: logical OR
  * However, we can use parentheses to override the precedence using the usual algebraic order

* The Ternary Operator

  * The structure of a ternary operator is an expression, so it has an advantage over an `if/else` statement because it can be used to return a value
  * Format: `1 == 1 ? 'this is true' : 'this is not true'`

* Switch Statement

  * `switch` statements use the reserved words `switch`, `case`, `default`, and `break`

  * ```javascript
    let a = 5;
    
    switch (a) {
      case 5:
        console.log('a is 5');
        break; // without this break statement, execution continues to next clause
      case 6:
        console.log('a is 6');
        break; // without this break statement, execution continues to next clause
      default:
        console.log('a is neither 5, nor 6');
        break; // without this break statement, execution continues to next clause
    }
    // logs "a is 5" to the console
    ```

### Loops & Iterating

* `while` Loops

  * ```javascript
    let counter = 1;
    while (counter <= 10) {
      console.log(counter);
      counter++;
    }
    ```

  * Made possible by the increment operator (`++`) and decrement operator (`--`)

    * Increment operator can come either before (pre-increment operator: `++x`, returns new value) or after the variable (post-increment operator: `x++`, returns original value
    * Many developers suggest avoiding these, in favor of `+=` or `-=` instead

  * Looping over arrays with `while`

    * ```javascript
      let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];
      let upperNames = [];
      let index = 0;
      
      while (index < names.length) {
        let upperCaseName = names[index].toUpperCase();
        upperNames.push(upperCaseName);
        index += 1;
      }
      
      console.log(upperNames); // ['CHRIS', 'KEVIN', etc...]
      ```

    * Do/`while` loops

      * ```javascript
        let answer;
        do {
          answer = prompt("Do you want to do that again?");
        } while (answer === 'y');
        ```

* `for` Loops

  * ```javascript
    for (initialization; condition; increment) {
      // loop body
    }
    ```

  * ```javascript
    let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];
    let upperNames = [];
    
    for (let index = 0; index < names.length; index +=1) {
      let upperCaseName = names[index].toUpperCase();
      upperNames.push(upperCaseName);
    }
    
    console.log(upperNames); // ['CHRIS', 'KEVIN', etc...]
    ```

* Controlling Loops

  * JS uses the keywords `continue` and `break` to provide more control over loops:

    * `continue` lets you start a new iteration of the loop (skipping the current one)

      * As an alternative to using `continue` in a loop, we can use a negated `if` conditional:

        * ```javascript
          if (names[index] === 'Naveed') continue;
          // VERSUS
          if (names[index] !== 'Naveed') { ... }
          ```

    * `break` lets you terminate a loop early (skip all remaining iterations)

* Array Iteration

  * `Array.forEach()` is an **array looping abstraction**

    * ```javascript
      let names = ['Chris', 'Kevin', 'Naveed', 'Pete', 'Victor'];
      
      names.forEach(function (name) { // passing an anonymous function to forEach()
        console.log(name);
      });
      
      // SAME AS
      names.forEach(name => console.log(name));
      ```

* Recursion

  * Recursive functions are functions that call themselves.

  * Every recursive function has a **baseline condition** thatmarks the end of the recursion (`number < 2` in our Fibonacci solution below), and some code that recursively calls the function with a new argument.

  * ```javascript
    function fibonacci(number) {
      if (number < 2) return number; // 0 if number is 0, 1 if number is 1
      return fibonacci(number - 1) + fibonacci(number - 2);
    }
    
    console.log(fibonacci(6)); // should log 8
    console.log(fibonacci(20)); // should log 6765
    ```

### Arrays

* What is an Array?
* Modifying Arrays
* Iteration Methods
* Arrays Can Be Odd
* Nested Arrays
* Array Equality
* Other Array Methods

### Objects

* What are Objects?
* Objects vs. Primitives
* Prototypes
* Iteration
* Common Operations
* Objects vs. Arrays

### More Stuff

* Variables as Pointers
* Method Chaining
* Regex
* The Math Object
* Dates
* Exceptions
* Stack Traces
* ES6 and Beyond