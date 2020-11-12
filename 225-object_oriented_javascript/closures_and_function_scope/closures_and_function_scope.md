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

  * **Higher-order functions** either take a function as an argument or return a function when invoked.

  * ```javascript
    function timed(func) {
        return function() {
            let start = new Date();
            func();
            let stop = new Date();
            console.log((stop - start).toString() + ' ms have elapsed');
        };
    }
    
    function loopy() {
        let sum = 0;
        let i;
        
        for (i = 1; i < 1000000000; i += 1) {
            sum += 1;
        }
        
        console.log(sum);
    }
    
    let timedLoopy = timed(loopy); 	// timed(loopy) returns a function
    timedLoopy(); 									// that we can then call
    ```

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

