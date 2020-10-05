function indexOf(arr, val) {
  for (let idx = 0; idx < arr.length; idx += 1) {
    if (arr[idx] === val) {
      return idx;
    } 
  }
  
  return -1;
}

console.log(indexOf([1, 2, 3, 3], 3));  // 2
console.log(indexOf([1, 2, 3], 4));     // -1