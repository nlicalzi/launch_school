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

  * Functions *close over* or *enclose* the context at their definition point, so we call them **closures**.

    * They always have access to that context, regardless of when and where the program invokes the function. 

  * ```javascript
    function makeCounter() {
      let count = 0;
      return function() {
        count += 1;
        console.log(count);
      };
    }
    
    let counter = makeCounter();
    counter(); // => 1
    counter(); // => 2
    counter(); // => 3, etc.
    ```

    * Note that the variable `count` above is private data for (enclosed in) the `makeCounter()` closure, and cannot be accessed outside of it, while the function `counter` can access/update it.

* **Objects and Closures**

  * ```javascript
    function makeList() {
      let items = [];
      
      return {
        add(item) {
          let idx = items.indexOf(item);
          if (idx === -1) {
            items.push(item);
            console.log(item + ' added!');
          }
        },
        
        clear() {
          items = [];
          console.log('all items deleted!');
        },
        
        list() {
          items.forEach(item => console.log(item));
        },
        
        remove(item) {
          let idx = items.indexOf(item);
          if (idx !== -1) {
            items.slice(idx, 1);
            console.log(item + ' removed!');
          }
        },
      };
    }
    ```

* **Garbage Collection**

  * **Garbage collection (GC)** is the runtime process responsible for freeing up memory in JS. Values are allocated memory when they are created, and eventually freed up by garbage collection when they are no longer in use.
    * An object or value is considered no longer in use when there are no variables, objects, or closures that maintain a reference to that object or value; JS then marks that memory as eligible for GC. 
  * JavaScript (and most programming languages) divides memory into two principal regions: the **stack** and the **heap**. 
    * JS stores most primitive values, as well as references (or pointers), on the stack. 
      * **Most primitive values do not get involved in garbage collection**: `undefined`, `Boolean`, `Number`, `Symbol`, `null` all go on the stack. 
    * Everything else goes on the heap. This includes `String` and `BigInt`.
  * When a function or block begins executing in a JS program, JS allocates memory on the **stack** for the variables defined in that block or function. 
    * Since the items on the stack have fixed size, JS can allocate the amount of memory it needs during the creation phase of execution (hoisting) without knowing their specific values.
    * When the block or function is done running, allocated stack memory is automatically returned.
  * New values are added to the **heap** *when they are created*, since they can be of variable sizes that aren't determined ahead of time.
    * The heap relies on garbage collection to detect when a value's reference count reaches 0.
  * Note: GC doesn't happen when a variable goes out of scope. A variable can go out of scope but there still exist persistent references to it inside closures, other objects, etc.

* **How Closures Affect Garbage Collection**

* **Partial Function Application**

* **Immediately Invoked Function Expressions (IIFEs)**

* **Creating a Private Scope with an IIFE**

* **Creating Private Data with an IIFE**

### Concepts/Vocab

* What is the difference between the concepts of **higher-order functions** and **first-class functions?**
  * https://stackoverflow.com/questions/10141124/any-difference-between-first-class-function-and-high-order-function
* What is **partial application**?
  * 