function missing(arr) {
  let first = arr[0];
  let last = arr[arr.length - 1];
  let missingValues = [];

  for (let val = first; val < last; val += 1) {
    if (!arr.find(el => el === val)) {
      missingValues.push(val);
    }
  }
  return missingValues;
}

console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []