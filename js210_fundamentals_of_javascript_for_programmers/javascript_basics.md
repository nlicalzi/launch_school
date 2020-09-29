## JS210/Lesson 1: JavaScript Basics

### What to Focus On

This course is an Introduction to JavaScript for those who have already programmed in another language. Since you already know the fundamentals of programming, this course will focus more on the specifics of the JavaScript language than on programming in general. This course covers the following:

* Language grammar, syntax, and data types
* Functions and higher-order functions
* Arrays and Objects as data structures
* Core built-in methods
* Writing idiomatic and stylistic code

### Summary

### Notes

* JavaScript Versions
  * Current JS spect is ECMAScript 2019 (or ES10)
  * ECMAScript 2015 (ES6) represented a huge improvement, so modern JS is known as ES6+
  * Use a compatability table to determine what browsers support what features:
    * http://kangax.github.io/compat-table/es2016plus/
  * Or use a tool like Babel to transpile modern JS to run in older browsers:
    * https://babeljs.io/
  * Chrome generally adopts new features fastest, then Firefox then MSFT.
  
* Resources
  * Launch School's [Intro to Programming with JavaScript](https://launchschool.com/books/javascript) book
  * MDN's [JavaScript documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
  
* Running Your Code

  * Use either of the two options below in an HTML file:

    * ```html
      <body>
        <script>
          console.log('I run automatically!');
        </script>
      </body>
      
      <!-- OR -->
      
      <script src="my_javascript.js"></script>
      
      ```

* Code Style

  * Variable names should start with a lowercase letter
  * Variables with multiple words in their name should use camelCase
  * Constants use SCREAMING_SNAKE_CASE
  * Function names use camelCase, except constructor functions which use PascalCase
  * Declare constants at the top of your program to avoid repetition/make changes easier
    * e.g. declare `const NUMBER_CARDS_IN_HAND = 2;` at the top for a game of Texas Hold'em
  * Indent with 2 spaces, not tabs
  * Use one `let` declaration per variable instead of multiple assignment

* Data Types

  * Primitives:
    * `number`
      * All numbers are represented by a floating point systen, use the smallest possible relevant unit instead of fractional numbers to avoid errors (`¢` instead of `$`, `s` instead of `h`)
      * `Infinity`, `-Infinity`, `NaN` are special number values
    * `boolean`
    * `string`
    * `null` (`typeof null` returns `object` but this is a bug)
    * `undefined`
    * `symbols`
    * `big integers`
  * Compound data type:
    * `object` (incl. arrays)

* More on Strings

  * Special Characters:

    * | Code | Character       |
      | :--- | :-------------- |
      | `\n` | New line        |
      | `\t` | Tab             |
      | `\r` | Carriage return |
      | `\v` | Vertical tab    |
      | `\b` | Backspace       |

  * String concatenation is performed using  `+`

  * Character Access

    * ```javascript
      'hello'.charAt(1); // "e"
      
      // OR
      
      'hello'[1] // "e"
      ```

    * Note: bracket notation in JS is an operator; not syntactic sugar for a method like in Ruby

* Primitive Values are Immutable

* Variables

  * When possible, use `let` or `const` to declare a variable instead of `var` for scoping purposes

  * Variables can be initialized without a value or have their declaration combined with an **initializer**

    * ```javascript
      let number; // variable declared, default value is undefined
      number = 3; // THIS IS ASSIGNMENT
      
      // VERSUS
      
      let number = 3; // THIS IS NOT ASSIGNMENT, it's an initializer
      ```

  * `const` variables must be declared with an initializer, since they can't be reassigned

  * JS is dynamically typed-- variables may refer to any data type and be reassigned to any other

* Operators

  * Arithmetic operators: `+ - / * %` (this is a remainder, NOT a modulo)
  * Assignment operator: `=`
    * Compound assignment operators: `+= -= *= /= %=`
  * Comparison operators: `== != === !== > >= < <=`
    * Default to using `=== !==` (strict in/equality) instead of the other forms (loose in/equality)
  * String operators: `< <= > >=` for by-character comparison, `+ +=` for concatenation
  * Logical operators: `&& || !`

* Expressions and Statements

  * An **expression** is any valid code that resolves to a value.

    * Most common types: arithmetic (evaluate to a number), string (evaluate to a string), or logical (resolves to a boolean)

  * Using `++a / a++` or `--a / a--` doesn't make a difference as a standalone expression

    * ```javascript
      let a = 1;
      a++; // 2
      ++a; // 3
      ```

  * But results differ if the expression is part of a more complicated one: `b = a++;` vs. `b = ++a;`

    * If the operator appears after the operand, the expression returns the original value
    * If the operator appears before the operand, the expression returns the modified value

  * JS uses short-circuit evaluation to evaluate expressions containing `&&` or `||`

  * A **statement** evaluated to `undefined`, and typically controls execution of a program

* Input and Output

  * The `prompt` method can be used to get input text from a user

    * ```javascript
      let name = prompt('What is your name?');
      ```

  * `alert` displays a dialog with a message and an `OK` button

  * `console.log` outputs a message to the JS console

* Explicit Primitive Type Coercions

  * We can use `Number ` to coerce a string to a number or return `NaN`: `Number('1')`
    * `parseInt` and `parseFloat` can coerce a string to specific formats of number
    * Note: `parseInt` takes an optional `radix` argument which sets the base for the number, it's recommended to always specify the parameter for clarity and predictability (use 10)
  * How can we convert a number to a string?
    * We can use `String` to coerce a number to its string representation: `String(123);`
    * We can also call the `toString` method on numbers: `(123).toString();`
  * How can we convert a boolean to a string?
    * `String(true);`
    * `true.toString();`
  * How can we convert a string to a boolean?
    * Use comparison: `str === 'true';` or `str === 'false';`
  * How can we convert values to boolean based on their truthiness?
    * Use either the double bang `!!` operator or `Boolean(val)`

* Implicit Primitive Type Coercions

  * Avoid automatic type coercions as much as possible in your own code.
  * The unary plus operator converts a value into a number: `+('123')`
  * The binary plus operator is addition for numbers and concatenation for strings
    * If an operand is a string the other will be coerced to a string
    * Otherwise both operands are coerced to numbers
      * `undefined` to `NaN`, `null` and `false` to `0`, `true` to `1`
  * Other arithmetic operators `- * / %` are only defined for numbers, JS will convert operands
  * The strict in/equality operators only return true if both operands have the same value and type
    * The loose in/equality operators will coerce operands to the same type, avoid using them
  * The relational operators `< <= > >=` will perform string comparison if both are strings, otherwise both operands are converted to numbers before being compared
  * **Always use explicit type conversions and strict equality operators**

* Conditionals

  * JS supports two conditional statements: `if...else` and `switch`

    * `if...else`

      * ```javascript
        if (condition1) {
          // statements
        } else if (condition2) {
          // statements
        } else {
          // statements
        }
        ```

    * `switch`

      * Use `break` statements to prevent execution "falling through" to subsequent case branches

      * Provide a `default` clause that executes if none of the case branch conditionals are truthy

      * ```javascript
        let reaction = 'negative';
        
        switch (reaction) {
          case 'positive':
            console.log('The sentiment of the market is positive');
            break;
          case 'negative':
            console.log('The sentiment of the market is negative');
            break;
          default: 
            console.log('The market has not reacted enough');
        }
        ```

  * JS will use the truthiness of an expression in an `if` statement to determine what block to execute

    * What are the falsey values in JS?
      * `false`, `null`, `undefined`, `0`, `NaN`, `''`
    * Are empty objects or arrays truthy or false in JS?
      * Truthy.

  * What is the best way to compare a value with `NaN`?

    * Use `Number.isNaN(value)` or `Object.is(value, NaN)`

* Looping and Iteration

### Vocab

