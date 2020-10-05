function arraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) return false;
  
  for (let idx = 0; idx < arr1.length; idx += 1) {
    if (arr1[idx] !== arr2[idx]) return false;
  }

  return true;
}

console.log(arraysEqual([1], [1]) === true);                                // true
console.log(arraysEqual([1], [2]) === false);                               // false
console.log(arraysEqual([1, 2], [1, 2, 3]) === false);                      // false
console.log(arraysEqual([1, 'hi', true], [1, 'hi', true]) === true);        // true
console.log(arraysEqual([1, 'hi', true], [1, 'hi', false]) === false);      // false
console.log(arraysEqual([1, 'hi', true], [1, 'hello', true]) === false);    // false
console.log(arraysEqual([1, 'hi', true], [2, 'hi', true]) === false);       // false