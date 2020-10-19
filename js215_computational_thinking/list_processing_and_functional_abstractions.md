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

* **Iteration**: do something once for each element in an Array.

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

* **Filtering / Selection**: create a new Array using a specific subset of an existing array.

  * ```javascript
    let count = [1, 2, 3, 4, 5];
    let filtered = count.filter((number, idx, array) => number % 2 === 0);
    console.log(filtered); // logs [ 2, 4 ]
    ```

  * Syntax

    * ```javascript
      let newArr = arr.filter(callback(currentValue[, index[, [array]]) {
      	// return element for newArr, if true
      });
      ```

    * `callback`: predicate function to test each element of the array, coerces to `true/false`

      * `currentValue`: the current element being processed in the array
      * `index`: the index of the current element being processed in the array
      * `array`: the array that `filter` was called upon

  * Return Value

    * `filter` returns a new Array containing the elements for which the callback returned `true`

  * Build It to Understand It

    * ```javascript
      function myFilter(array, func) {
        let filteredArr = [];
        array.forEach(value => {
          if (func(value)) {
            filteredArr.push(value);
          }
        });
      
        return filteredArr;
      }
      ```

  * Examples

    * ```javascript
      function isMultipleOfThreeOrFive(value) {
        return value % 5 === 0 || value % 3 === 0;
      }
      
      function multiplesOfThreeOrFive(values) {
        return myFilter(values, isMultipleOfThreeOrFive);
      }
      ```

* **Transformation**: create a new Array using values calculated from values in an original Array.

  * ```javascript
    let count = [1, 2, 3, 4, 5];
    let doubled = count.map((number, index, array) => number * 2); // double each element
    console.log(doubled); // logs [ 2, 4, 6, 8, 10 ]
    ```

  * Syntax

    * ```javascript
      let newArr = arr.map(callback(currentValue[, index[, array]]) {
      	// return element for newArr, after executing something
      })
      ```

    * `callback`

      * `currentValue`: the current element being processed
      * `index`: the index of the current element in the calling array
      * `array`: the calling array

  * Return Value

    * `map` returns a new array, with each element being the result of the callback function

  * Build It to Understand It

    * ```javascript
      function myMap(array, func) {
        let mappedArray = [];
        array.forEach(element => mappedArray.push(func(element)));
        return mappedArray;
      }
      ```

  * Examples

    * ```javascript
      let plusOne = n => n + 1;
      console.log(myMap([1, 2, 3, 4], plusOne)); // [ 2, 3, 4, 5 ];
      ```

* **Reducing**: process a source Array in some order using a callback function to build up a return value.

  * ```javascript
    const reducer = (accumulator, currentValue) => accumulator + currentValue;
    let count = [1, 2, 3, 4, 5];
    
    count.reduce(reducer); // 15
    ```

  * Syntax

    * ```javascript
      arr.reduce(callback( accumulator, currentValue[, index[, array]]) {
      	// return result from executing something for accumulator or currentValue
      }[, initialValue]);
      ```

    * `callback`

      * `accumulator`: the accumulator accumulates subsequent return values from `callback`
      * `currentValue`: the current element being processed in the array
      * `index`: the index of the current element
      * `array`: the calling array for `reduce()`

    * `initialValue`: a value to use as the first argument for `callback`, otherwise the first element in the array will act as the initial value for `accumulator` and be skipped as `currentValue`

  * Return Value

    * `reduce` returns the value returned by the final callback invocation (final `accumulator`)

  * Build It to Understand It

    * ```javascript
      function myReduce(array, func, initial) {
        let copiedArray = array.slice();
      
        if (initial === undefined) {
          let initial = copiedArray.shift();
        }
      
        copiedArray.forEach(element => initial = func(initial, element));
        
        return initial;
      }
      ```

  * Examples

    * ```javascript
      function longestWord(words) {
        return myReduce(words, longest);
      }
      
      function longest(result, currentWord) {
        return currentWord.length >= result.length ? currentWord : result;
      }
      
      longestWord(['abc', 'launch', 'targets', '']);
      
      // OR USE INLINE STYLE (using a function expression as our callback argument)
      
      function longestWord(words) {
        return myReduce(words, function (result, currentWord) {
          return currentWord.length >= result.length ? currentWord : result;
        })
      }
      ```

* **Interrogation**: determine how many of a given Array's elements satisfy a condition.

  * ```javascript
    function odd(number) {
      return number % 2 === 1;
    }
    
    let count = [1, 2, 3, 4, 5];
    count.some(odd);   // true: some numbers are odd
    count.every(odd);  // false, every number is not odd
    ```

  * Syntax

    * ```javascript
      arr.every(callback(element[, index[, array]]));
      arr.some(callback(element[, index[, array]]));
      ```

    * `callback`: a function to test for each element, taking three arguments

      * `element`: the current element being processed in the array
      * `index`: the index of the current `element` (optional)
      * `array`: the calling array (optional)

  * Return Value

    * `Array.prototype.some` returns `true` if the callback evaluates to `true` for at least one element
    * `Array.prototype.every` returns `true` if the callback evaluates to `true` for all elements

  * Build It to Understand It

    * ```javascript
      function myOwnEvery(array, func) {
        for (let i = 0; i < array.length; i += 1) {
          if (!func(array[i])) return false;
        }
      
        return true;
      }
      ```

  * Examples

    * ```javascript
      function areAllNumbers(array) {
        return myOwnEvery(array, isANumber);
      }
      
      function isANumber(value) {
        return typeof value === 'number' && !Number.isNaN(value);
      }
      
      areAllNumbers([1, 5, 6, 7, '1']);		// false
      areAllNumbers([1, 5, 6, 7, 1]);			// true
      areAllNumbers([1, 5, 6, 7, NaN]);		// false
      ```

* **Sort**

### Vocab

* Callback
* Imperative vs. Declarative

