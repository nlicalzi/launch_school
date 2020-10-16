## JS215 Lesson 1: List Processing & Functional Abstractions

### What to Focus On

* Thinking logically: analysing the problem and solutions paths, the center and edge cases
* Thinking procedurally and from the bottom up; imperative solution expressions
* Thinking abstractly and from the top down; declarative solution expressions
* Common problem-solving patterns

### Summary

### Notes

* **Passing Functions as Arguments**

  * Functions are first-class values in JavaScript

    * You can store them in variables and pass them as arguments to other functions.

    * We compose programs by combining multiple simple Functions to build complex behaviors.

    * ```javascript
      function iterate(array, callback) {
        for (let i = 0; i < array.length; i += 1) { // for each element in the Array
          callback(array[i]);												// invoke callback and pass element
        }
      }
      
      function logger(number) {
        console.log(number);
      }
      
      let count = [1, 2, 3, 4, 5];
      iterate(count, logger); // logs 1 2 3 4 5
      ```

  * Behavior as arguments to allow abstractions

    * ```javascript
      function oddOrEven(array) {
        array.forEach(number => { // per element in array, perform arrow function
          if (number % 2 === 0) {
            console.log('even');
          } else {
            console.log('odd');
          }
        });
      }
      ```

* 

### Vocab

