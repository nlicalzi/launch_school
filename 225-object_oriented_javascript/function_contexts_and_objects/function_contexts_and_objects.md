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

  * 

* **Hard Binding Functions with Contexts**

* **Dealing with Context Loss**

* **The `this` keyword in JavaScript**

### Concepts/Vocab

* Global Object
  * Global values
  * Global functions
* 