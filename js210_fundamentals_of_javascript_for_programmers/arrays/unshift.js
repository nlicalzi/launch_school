function unshift(arr, val) {
  for (let idx = arr.length; idx > 0; idx -= 1) {
    arr[idx] = arr[idx - 1]
  }

  arr[0] = val;
  return arr.length;
}

let count = [1, 2, 3];
console.log(unshift(count, 0));   // 4
console.log(count);               // [0, 1, 2, 3]