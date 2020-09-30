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

  * 

* Functional Scopes and Lexical Scoping

* Function Declarations and Function Expressions

* Hoisting

* Closures

### Vocab