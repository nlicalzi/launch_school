function shift(arr) {
  if (arr.length === 0) return undefined;

  let shiftVal = arr[0];
  for (let idx = 0; idx < arr.length; idx += 1) {
    arr[idx] = arr[idx + 1];
  }
  arr.length -= 1;
  return shiftVal;
}

let count = [1, 2, 3, 4, 5];
console.log(shift(count));  // 1
console.log(count);         // [2, 3, 4, 5]