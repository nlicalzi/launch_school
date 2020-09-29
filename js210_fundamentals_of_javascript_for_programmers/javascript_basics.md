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

* Operators

* Expressions and Statements

* Input and Output

* Explicit Primitive Type Coercions

* Implicit Primitive Type Coercions

* Conditionals

* Looping and Iteration

### Vocab

