function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}

function concat(arr1, arr2) {
  let arrOut = [];

  for (let idx = 0; idx < arr1.length; idx += 1) {
    push(arrOut, arr1[idx]);
  }

  for (let idx = 0; idx < arr2.length; idx += 1) {
    push(arrOut, arr2[idx]);
  }

  return arrOut;
}

console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]
