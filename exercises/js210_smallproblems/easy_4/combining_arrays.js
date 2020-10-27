// Write a function that takes two arrays as arguments, and returns an array containing the
// union of the values from the two. There should be no duplication of values in the
// returned array, even if there are duplicates in the original arrays. You may assume that
// both arguments will always be arrays.

function union(firstArr, secondArr) {
  let result = firstArr.slice();

  secondArr.forEach(el => {
    if (!result.includes(el)) { result.push(el); }
  });

  return result;
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]