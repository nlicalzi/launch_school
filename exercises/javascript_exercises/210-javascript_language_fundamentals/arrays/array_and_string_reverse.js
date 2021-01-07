function reverseArray(arr) {
  let reversedArray = [];
  for (let idx = arr.length - 1; idx >= 0; idx -= 1) {
    reversedArray.push(arr[idx]);
  }

  return reversedArray
}

function reverseStr(str) {
  let reversedString = '';

  for (let idx = str.length - 1; idx >= 0; idx -= 1) {
    reversedString += str[idx];
  }

  return reversedString;
}

function reverse(input) {
  if (Array.isArray(input)) {
    return reverseArray(input);
  } else {
    return reverseStr(input);
  }
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]