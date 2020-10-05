## JS210 Lesson 4: Arrays

### Notes

* Arrays

  * Arrays are the basic collection type used in JS, holding a list of values that are indexed (and ordered) by a non-negative integer value. 

  * How can we create arrays?

    * Using the Array literal syntax: `[]`
    * Using the `Array` constructor: `new Array()`

  * How can we iterate through an array?

    * Using `for` loops:

      * ```javascript
        let count = [1, 2, 3, 4];
        for (let idx = 0; idx < count.length; idx += 1) {
          console.log(count[idx]); // BRACKET NOTATION IS AN OPERATOR, NOT A METHOD
        }
        ```

  * We can access and assign elements in an array using bracket notation

  * What happens to indexes in an array where we don't explicitly assign a value?

    * JS designates those elements as empty, and they'll return `undefined` if accessed

  * What does `typeof [];` return and what does it mean about Arrays?

    * `object`; Arrays are actually Objects in JS instead of their own datatype

  * How can we determine whether a value is an array, if arrays are actually of type `object`?

    * ```javascript
      Array.isArray([]); // true
      Array.isArray('array'); // false
      ```

* Array Operations

  * `push`, `pop`, `shift`, and `unshift`
  * `indexOf` and `lastIndexOf`
  * `slice`, `splice`, `concat`, and `join`

* Array Methods

* Arrays and Operators

### Vocab

