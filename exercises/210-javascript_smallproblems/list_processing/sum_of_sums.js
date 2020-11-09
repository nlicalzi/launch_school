// Write a function that takes an array of numbers, and returns the sum of the sums of
// each leading subsequence for that array. You may assume that the array always contains
// at least one number.

function sumOfSums(numbers) {
  return numbers.map((num, idx) => numbers.slice(0, idx + 1)
                                          .reduce((agg, val) => agg + val))
                .reduce((agg, val) => agg + val);
}

console.log(sumOfSums([3, 5, 2]) === 21);        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]) === 36);     // 36
console.log(sumOfSums([4]) === 4);               // 4
console.log(sumOfSums([1, 2, 3, 4, 5]) == 35);   // 35