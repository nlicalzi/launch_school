function firstElementOf(arr) {
  return arr[0];
}

console.log(firstElementOf(['U', 'S', 'A']) === 'U');  // returns "U"


function lastElementOf(arr) {
  return arr[arr.length - 1];
}

console.log(lastElementOf(['U', 'S', 'A']) === 'A');   // returns "A"

function nthElementOf(arr, idx) {
  return arr[idx];
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(nthElementOf(digits, 3) === 16);   // returns 16
console.log(nthElementOf(digits, 8) === undefined);   // returns undefined

function firstNOf(arr, count) {
  return arr.slice(0, count);
}

console.log(firstNOf(digits, 3));    // returns [4, 8, 15]

function lastNOf(arr, count) {
  if (count > arr.length) return arr.slice();
  return arr.slice(arr.length - count);
}

digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3));    // returns [16, 23, 42]
console.log(lastNOf(digits, 11));    // returns [4, 8, 15, 16, 23, 42]

function endsOf(beginningArr, endingArr) {
  let firstElement = beginningArr[0];
  let secondElement = endingArr[endingArr.length - 1];
  return [firstElement, secondElement];
}

console.log(endsOf([4, 8, 15], [16, 23, 42]));  // returns [4, 42]
