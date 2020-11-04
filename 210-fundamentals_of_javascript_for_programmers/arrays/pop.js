function pop(arr) {
  if (arr.length === 0) return undefined;

  let newLen = arr.length - 1;
  let poppedVal = arr[newLen];
  arr.length = newLen; // setting a new array length either fills with empty or truncates
  return poppedVal;
}

let count = [1, 2, 3];
console.log(pop(count));  // 3
console.log(count);       // [1, 2]