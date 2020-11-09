function shift(arr) {
  if (arr.length === 0) return undefined;
  let shiftedValue = arr[0];
  for (let idx = 0; idx < arr.length; idx += 1) { 
    arr[idx] = arr[idx + 1];
  }

  arr.length -= 1;
  return shiftedValue;
}

function unshift(arr, ...values) {
  arr.length += values.length;
  for (let idx = values.length - 1; idx > 0; idx -= 1) {
    arr[idx + 1] = arr[idx];
    arr[0] = values[idx];
  }
  return arr.length;
}


console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

const testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]