

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

  * An array is a zero-indexed, ordered list of elements, each having a value of any type (heterogeneity)

* Modifying Arrays

  * It is possible to add and replace elements in an array with `[]` and the assignment operator `=`

  * ```javascript
    let array = [1, 2, 3];
    array[1] = 4; // assignment by element index
    console.log(array); // => [1, 4, 3]
    ```

  * ```javascript
    array[array.length] = 10;
    console.log(array); // => [1, 4, 3, 10]
    ```

  * The elements in a `const` array can be modified (see: variables as pointers), but `Object.freeze` will make the array immutable (working only one level deep in the array)

  * `Array.push()` adds one or more elements to the end of an array (returns the length of the array)

  * `Array.concat()` is similar to `push`, but it returns a new array (not mutating the caller)

  * `Array.pop` removes and returns the last element of the caller array

  * `Array.splice()` lets you remove one or more elements from anywhere in an array

* Iteration Methods

  * What is a callback function?

    * What do we call a function that you pass to another function as an argument?

  * `Array.forEach()` provides a simple way to iterate over arrays

    * `forEach` is called on an array and requires the passing of a **callback** function as an argument 

    * ```javascript
      let array = [1, 2, 3];
      array.forEach(function (num) {
        console.log(num);
      }); // => returns undefined, outputs 1 \n 2 \n 3
      
      // SAME AS
      array.forEach(num => console.log(num));
      // like Ruby arr.each { |num| puts num }
      ```

  * `Array.map()` transforms an array's elements, returning the new modified array

    * ```javascript
      let numbers = [1, 2, 3, 4];
      let squares = numbers.map(num => num * num);
      console.log(squares) // => [1, 4, 9, 16]
      ```

  * `Array.filter()` returns a new array including all elements from the calling array for which the callback returns a truthy value.

    * ```javascript
      let numbers = [1, 2, 3, 4, 5, 6, 7, 8]
      numbers.filter(num => num > 4) // => [5, 6, 7, 8]
      ```

  * `Array.reduce()` takes two arguments: a callback function and a value initializing an accumulator

    * ```javascript
      let arr = [2, 3, 5, 7];
      arr.reduce((accumulator, element) => accumulator + element, 0) // => 17
      ```

* Arrays Can Be Odd

  * Array indexes start at `0`
  * `Array.length` returns an integer that is `1` greater than the highest index position in the array
  * Arrays are objects
    * `typeof arr` returns `object`, use the boolean predicate `Array.isArray` instead
  * If you change an array's `length` to a new, smaller value the *array gets truncated*
  * If you change an array's `length` property to a new, larger value, the array expands to the new size.
    * The new elements **do not get initialized**, leading to some potentially strange behavior
  * Since arrays are objects (like JSON), you can add properties using negative or non-numeric indices
    * `arr["cat"] = 'Fluffy'` // `arr[-1] = 'negative'`
    * Only index values count toward array length, but all elements/properties show up as keys
  * Since arrays are objects, you can use the `Object.keys` method to return an array's keys

* Nested Arrays

  * Arrays can contain anything, even other nested arrays

* Array Equality

  * JS treats two arrays/objects as equal when they occupy the same spot in memory
    * See: variables as pointers

* Other Array Methods

  * `Array.includes()` determines whether an array includes a given element

  * `Array.sort()` returns a sorted array, opposite of `Array.reverse()`

  * `Array.slice()` extracts and returns a portion of an array

    * ```javascript
      let fruits = ['mango', 'orange', 'banana', 'pear', 'apple']
      fruits.slice(1, 3) // => ['orange', 'banana']
      ```

### Objects

* What are Objects?

  * Objects store a collection of key-value pairs (aka properties) (think of a parsed JSON string)

  * An object's keys are strings, but their corresponding values can be any type (even other objects)

  * We can create objects using the **object literal** syntax:

    * ```javascript
      let person = {
        name: 'Jane',
        age: 37,
        hobbies: ['photography', 'genealogy'],
      };
      // OR
      let person = { name: 'Jane', age: 37, hobbies: ['photography', 'genealogy'] }
      ```

  * Object values are accessed with dot notation (`person.name`) or bracket notation `person['name']`

    * We can create properties with either: `person.height = '5 ft'`, `person['gender'] = 'female'`

  * What keyword can we use to remove a property from an existing object, returning true if successful?

    * `delete person.age` // `delete person['gender']`

  * Objects can also be declared with `const`, preventing the variable from being reassigned (or pointing) to another location in memory, but allowing the properties to be modified

    * Need to use `Object.freeze` to freeze the properties as well: `const MyObj = Object.freeze({ foo: "bar", qux: "xyz" })`

* Objects vs. Primitives

  * JS has two categories of data types: **primitives** and **objects**
    * Primitives are *immutable* (or **atomic**) and include: number, string, boolean, null, undefined
    * Objects are *mutable* and include: simple objects, arrays, date objects, functions

* Prototypes

  * Objects can **inherit** from other objects.

  * If object `a` inherits from object `b`, we say that `b` is the **prototype** of `a`

  * The static method `Object.create` allows us to create a new object (child) inheriting from an existing one (parent)

    * ```javascript
      let bob = { name: 'Bob', age: 22 };
      let studentBob = Object.create(bob);
      studentBob.year = 'Senior';
      
      studentBob.name // => 'Bob'
      ```

* Iteration

  * We are able to iterate over an object's properties in several ways:

    * `for/in` loop

      * ```javascript
        let person = { name: 'Bob', age: 30, height: '6 ft' };
        
        for (let prop in person) {
          console.log(person[prop]);
        } // => logs 'Bob', '30', '6 ft'
        ```

    * `hasOwnProperty` allows us to limit iteration to an object's own properties (i.e. not inherited)

      * ```javascript
        let obj1 = { a: 1, b: 2 };
        let obj2 = Object.create(obj1);
        obj2.c = 3;
        obj2.d = 4;
        
        for (let prop in obj2) {
          if (obj2.hasOwnProperty(prop)) {
            console.log(obj2[prop]);
          }
        } // => logs '3', '4'
        ```

    * `Object.keys` returns an object's keys as an array that we can iterate over

      * ```javascript
        let person = { name: 'Bob', age: 30, height: '6 ft' };
        
        let personKeys = Object.keys(person); // returns ['name', 'age', 'height']
        
        personKeys.forEach(key => console.log(person[key]));
        // => 'Bob', '30', '6 ft'
        ```

* Common Operations

  * `Object.values` extracts the values from every own property in an object to an array

    * ```javascript
      let person = { name: 'Bob', age: 30, height: '6 ft' };
      let personValues = Object.values(person);
      console.log(personValues); // logs ['Bob', 30, '6 ft']
      ```

  * `Object.entries` returns an array of nested arrays, each containing a single k/v pair

    * ```javascript
      let person = { name: 'Bob', age: 30, height: '6 ft' };
      console.log(Object.entries(person));
      // logs [['name', 'Bob'], ['age', 30], ['height', '6 ft']]
      ```

  * `Object.assign` merges two or more objects into a single object (mutating the first object passed)

    * ```javascript
      let objA = { a: 'foo' };
      let objB = { b: 'bar' };
      Object.assign({}, objA, objB); 	// => { a: 'foo', b: 'bar' }
      ```

* Objects vs. Arrays

  * How do we choose between using an object or an array?
    * Do the individual values have names or labels?
      * If yes, use an object
      * If the data doesn't have a natural label, an array should suffice
    * Does order matter?
      * If yes, use an array
    * Do I need a *stack* or *queue* structure?
      * Arrays are good at mimicking simple "last-in-first-out" stacks and "first-in-first-out" queues

### More Stuff

* Variables as Pointers

  * Variables point to/reference objects in memory
  * Primitives are immutable and passed by value, while objects are mutable and passed by reference
  * Reassignment is non-mutating, but index-based reassignment in an array is mutating

* Method Chaining

  * Methods can be called on the return value of other methods (comparable to function composition)

* Regex

  * ```javascript
    /o/.test('bobcat') 			// => true
    "bobcat".match(/bct/g) 	// => ['b', 'b', 'c', 't']
    "bobcat".match(/bct/) 	// => [ 'b', index: 0, input: 'bobcat', groups: undefined ]
    ```

  * The `match` method for strings returns more detailed information than `Regex.test`

    * When called without a flag, `match` returns extra info:
      *  `index`: the position in string where the match begins
      *  `input`: the original string
      * `groups`: used for named groups
    * the `/g` flag (global match) returns an array containing each instance of a matching substring
    * `match` returns `null` if a match doesn't occur-- a falsy value well suited for conditionals

* The Math Object

  * `Math.sqrt()`
  * `Math.PI`

* Dates

  * ```javascript
    let date = new Date('December 25, 2012')l
    date.getDay() // => 2 (Tuesday, Sunday is 0)
    ```

* Exceptions

  * JS **raises an error** or **throws an exception** when an error isn't silent (i.e. returns `NaN`/`null`, etc)

  * We can use `try/catch` for **exception handling**

    * ```javascript
      try {
        // operation that may produce an error
      } catch (exception) {
        // what to do if error occurs
        // perhaps log it
      } finally {
        // optional: executes even if an exception occurs
      }
      ```

    * ```javascript
      let names = ['bob', 'joe', 'steve', undefined, 'frank'];
      
      names.forEach(name => {
        try {
          console.log(`${name}'s name has ${name.length} letters in it.`);
        } catch (exception) {
          console.og('Something went wrong');
        }
      });
      
      // Log Output
      // bob's name has 3 letters in it.
      // joe's name has 3 letters in it.
      // steve's name has 5 letters in it.
      // Something went wrong
      // frank's name has 5 letters in it.
      ```

  * We can also raise **custom exceptions** using the `throw` keyword

    * ```javascript
      function foo(number) {
        if (typeof number !== "number") {
          throw new TypeError("expected a number");
        }
        
        // handle case where the argument really is a number
      }
      ```

  * `SyntaxError`s occur when the code can't be handled as valid JS, and are detected before execution

* Stack Traces

  * **Stack traces** report the type of error that occured, where it occured, and how it got there.

* ES6 and Beyond

  * Many key features were introduced in **ES6** / **ES2015**
    * Block Scopes
    * `let` and `const`
    * Arrow functions (to solve the **lost execution context**/ **context loss** problem)
  * Programs like **Babel** let us write modern code then translate it to function in previous versions of JS