function areArraysEqual(array1, array2) {
  if (array1.length !== array2.length) return false;

  let array2Copy = array2.slice();
  for (let idx = 0; idx < array1.length; idx += 1) {
    let elementIndex = array2Copy.indexOf(array1[idx]);
    if (elementIndex >= 0) {
      array2Copy.splice(elementIndex, 1)
    } else {
      return false;
    }
  }

  return true;
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3]) === true);                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]) === true);                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']) === true);      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]) === false);               // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]) === true);            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]) === false);           // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]) === false);           // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]) === false);                 // false
console.log(areArraysEqual([1, 1, 1], [1, 1]) === false);                    // false
console.log(areArraysEqual([1, 1], [1, 1]) === true);                        // true