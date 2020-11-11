## JS225/Lesson 3: Closures and Function Scope

### Summary

### Notes

* **Closures and Function Review**

  * The `function` keyword creates JS functions, and there are two different syntaxes you can use:

    * **Function declaration**: `function hello() { console.log('Welcome!'); }`

    * **Function expression**: `let hello = function() { console.log('Welcome!'); };`

      * Handy when passing a function to another function as an argument or return value:

        * ```javascript
          let squares = [1, 2, 3, 4, 5].map(function(number) {
            return Math.pow(number, 2);
          });
          ```

  * All functions, regardless of syntax, obey the same lexical scoping rules:

    * They can access any variables defined within themselves.
    * They can access any variables in scope based on the context where the function was **defined**.

* **Higher-Order Functions**

* **Closures and Private Data**

* **Objects and Closures**

* **Banking with Objects and Closures**

* **Garbage Collection**

* **How Closures Affect Garbage Collection**

* **Partial Function Application**

* **Immediately Invoked Function Expressions (IIFEs)**

* **Creating a Private Scope with an IIFE**

* **Creating Private Data with an IIFE**

### Concepts/Vocab

