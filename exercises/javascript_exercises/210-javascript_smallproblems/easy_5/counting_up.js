// Write a function that takes an integer argument, and returns an array containing all
// integers between 1 and the argument (inclusive), in ascending order.
// You may assume that the argument will always be a positive integer.

function sequence(num) {
  let arr = '1'.repeat(num).split('');
  return arr.map((el, idx) => idx + 1);
}

console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]