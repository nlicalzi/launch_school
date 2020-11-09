/*
Write a function that computes the difference between the square of the sum of the first
n positive integers and the sum of the squares of the first n positive integers.
*/

function sumSquareDifference(n) {
  let integers = [...Array(n+1).keys()];
  integers.shift(); // remove the first element (0)
  let squareSum = Math.pow(integers.reduce((a, b) => a + b), 2);
  let sumSquares = integers.map(el => Math.pow(el, 2)).reduce((a, b) => a + b);
  return squareSum - sumSquares;
}

console.log(sumSquareDifference(3) === 22);      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10) === 2640);     // 2640
console.log(sumSquareDifference(1) === 0);      // 0
console.log(sumSquareDifference(100) === 25164150);    // 25164150