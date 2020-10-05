function lastIndexOf(arr, val) {
  let idxMatch = -1;

  for (let idx = 0; idx < arr.length; idx += 1) {
    if (arr[idx] === val) {
      idxMatch = idx;
    }
  }

  return idxMatch
}

console.log(lastIndexOf([1, 2, 3, 3], 3)); // 3
console.log(lastIndexOf([1, 2, 3], 4));    // -1