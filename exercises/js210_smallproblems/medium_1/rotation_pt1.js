// Write a function that rotates an array by moving the first element to the end of the
// array. Do not modify the original array.
// * If the input is not an array, return undefined.
// * If the input is an empty array, return an empty array.

/*
P
  In: Array, Out: New Array
  For a given input array
  Return undefined if the input is not an array (guard clause)
  Return an empty array if the input isn't an array with a length of at least 1 (guard clause)
  Return a new (non-mutated) array consisting of:
    [...latterElements, firstElement] from the original array
E
*/
console.log(rotateArray([7, 3, 5, 2, 9, 1]));       // [3, 5, 2, 9, 1, 7]
console.log(rotateArray(['a', 'b', 'c']));          // ["b", "c", "a"]
console.log(rotateArray(['a']));                    // ["a"]
console.log(rotateArray([1, 'a', 3, 'c']));         // ["a", 3, "c", 1]
console.log(rotateArray([{ a: 2 }, [1, 2], 3]));    // [[1, 2], 3, { a: 2 }]
console.log(rotateArray([]));                       // []

// return `undefined` if the argument is not an array
console.log(rotateArray());                         // undefined
console.log(rotateArray(1));                        // undefined

// the input array is not mutated
const array = [1, 2, 3, 4];
console.log(rotateArray(array));                    // [2, 3, 4, 1]
console.log(array);                                 // [1, 2, 3, 4]
/*
D
  Use an array, but make sure it's a slice of the original (non-mutating)
A
  Given an input:
  Return undefined if the input is not of type 'array'
  Return [] if the input does not have length > 0
C
*/
function rotateArray(input) {
  if (!Array.isArray(input)) { return undefined };
  if (input.length === 0) { return [] };

  let [ first, ...last ] = input;
  return [...last, first];

  // return input.slice(1).concat(input[0]);
}