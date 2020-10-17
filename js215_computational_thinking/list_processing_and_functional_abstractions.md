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

* **Declarative Programming with Abstractions**

  * Imperative Style

    * ```javascript
      let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      let newArray = [];
      
      for (let i = 0; i < array.length; i += 1) {
        if (array[i] % 2 === 1) {
          newArray.push(array[i]);
        }
      }
      
      console.log(newArray);
      ```

    * The above code is purely imperative: it focuses on the steps/mechanics of solving the problem.

  * Imperative Style with Function Abstractions

    * ```javascript
      let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      let newArray = [];
      
      for (let i = 0; i < array.length; i += 1) {
        if (isOddNumber(array[i])) { // function's name explains the conditional
          newArray.push(array[i]);
        }
      }
      
      console.log(newArray);
      
      function isOddNumber(number) {
        return number % 2 === 1;
      }
      ```

    * Raising the abstraction level of the program by focusing on "what we need" instead of "how to"

  * Iteration Focused Abstraction

    * ```javascript
      let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      let newArray = [];
      
      array.forEach(element => { // implicit, rather than explicit iteration
        if (isOddNumber(element)) {
          newArray.push(element);
        }
      });
      
      console.log(newArray);
      
      function isOddNumber(number) {
        return number % 2 === 1;
      }
      ```

    * Code further abstracted by letting us focus on "what to do as we iterate through the array"

  * Filter Abstraction that Truly Reflects the Purpose of the Code

    * ```javascript
      let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      let oddNumbers = array.filter(element => isOddNumber(element));
      console.log(oddNumbers);
      
      function isOddNumber(number) {
        return number % 2 === 1;
      }
      ```

    * Benefits of the above code:

      * More readable, since it fits our mental model of the program
      * More concise, since the code is shorter
      * More robust, since we use a built-in abstraction (`filter`) instead of writing a new function

* **List Processing Abstractions**

  * | Abstraction         | Returns       | Array Methods            |
    | :------------------ | ------------- | ------------------------ |
    | Iteration           | `undefined`   | `forEach`                |
    | Filtering/Selection | new Array     | `filter`                 |
    | Transformation      | new Array     | `map`                    |
    | Ordering            | sorted Array  | `sort`                   |
    | Reducing/Folding    | single value  | `reduce` / `reduceRight` |
    | Interrogation       | boolean value | `every`, `some`          |

  * Each of the above Array methods takes a Function as an argument. Because the methods "call back" the Function, we often refer to this Function as a *callback*

* **Iteration**

  * ```javascript
    let names = ['Eunice', 'Lucas', 'Mariana'];
    names.forEach((name, index, array) => console.log(name, index, array[index]));
    
    // logs: 
    // Eunice 0 Eunice
    // Lucas 1 Lucas
    // Mariana 2 Mariana
    ```

  * Syntax

    * ```javascript
      arr.forEach(callback(currentValue[, index[, array]]) {
      	// execute something
      })
      ```

    * `callback`: function to execute on each element, accepts between 1 and 3 arguments:

      * `currentValue`: the current element being processed in the array
      * `index`: the index of `currentValue` in the array
      * `array`: the array that `forEach()` was called upon

  * Return Value

    * `forEach` returns `undefined`, which means that `forEach` must have side effects to be useful

  * Build It to Understand It

    * ```javascript
      function myForEach(array, func) {
        for (let idx = 0; idx < array.length; idx += 1) {
          func(array[idx], idx, array);
        }
      }
      ```

* **Filtering / Selection**

* **Transformation**

* **Reducing**

* **Interrogation**

* **Sort**

### Vocab

* Callback
* Imperative vs. Declarative

