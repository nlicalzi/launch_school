function oddElementsOf(arr) {
  let oddElements = [];
  for (let idx = 1; idx < arr.length; idx += 2) {
    oddElements.push(arr[idx]);
  }

  return oddElements;
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(oddElementsOf(digits));    // returns [8, 16, 42]

function mirroredArray(arr) {
  return arr.concat(arr.slice().reverse());
}

digits = [4, 8, 15, 16, 23, 42];
console.log(mirroredArray(digits));  // returns [4, 8, 15, 16, 23, 42, 42, 23, 16, 15, 8, 4]

function sortDescending(arr) {
  return arr.slice().sort((a, b) => b - a);
}

let array = [23, 4, 16, 42, 8, 15];
let result = sortDescending(array);  // returns [42, 23, 16, 15, 8, 4]
console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
console.log(array);                  // logs    [23, 4, 16, 42, 8, 15]

function matrixSums(arrays) {
  let totals = [];
  for (let idx = 0; idx < arrays.length; idx += 1) {
    const reducer = (accumulator, currentVal) => accumulator + currentVal
    totals.push(arrays[idx].reduce(reducer));
  }

  return totals;
}
console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]

function uniqueElements(arr) {
  let uniques = [];
  for (let idx = 0; idx < arr.length; idx += 1) {
    if (!uniques.find(element => element === arr[idx])) {
      uniques.push(arr[idx]);
    }
  }
  return uniques;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]