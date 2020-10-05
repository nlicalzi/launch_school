function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}

function splice(arr, start, removeCount) {
  let removedVals = [];
  for (let idx = start; idx < arr.length; idx += 1) {
    if (idx < start + removeCount) {
      push(removedVals, arr[idx])
    }

    arr[idx] = arr[idx + removeCount];
  }

  arr.length = arr.length - removedVals.length;
  return removedVals;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));   // [ 3, 4, 5, 6, 7 ]
console.log(count);                 // [ 1, 2, 8 ]