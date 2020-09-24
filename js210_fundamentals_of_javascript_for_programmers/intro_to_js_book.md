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
* Command Line Input
* Input in the Browser

### Functions

* Using Functions
* Return Values
* Default Parameters
* Nested Functions
* Variable Scope
* Functions vs. Methods
* Mutating the Caller
* Function Composition
* Three Ways to Define a Function
* The Call Stack

### Flow Control

* Conditionals
* Comparisons
* Logical Operators
* Short Circuits
* Truthiness
* The Ternary Operator
* Switch Statement

### Loops & Iterating

* `while` Loops
* `for` Loops
* Controlling Loops
* Array Iteration
* Recursion

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