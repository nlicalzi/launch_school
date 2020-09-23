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

### The Basics

* Data Types
* Operations
* Explicit Coercion
* Data Structures
* Expressions and Return Values
* Statements

### Variables

* Variables and Variable Names
* Declaring and Assigning Variables
* Declaring Constants
* Variable Scope
* A Common Gotcha

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