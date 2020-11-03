// Write a function that takes any two version numbers in this format and compares them,
// with the result of this comparison showing whether the first is less than, equal to,
// or greater than the second version:
//    * If version1 > version2, we should return 1.
//    * If version1 < version2, we should return -1.
//    * If version1 === version2, we should return 0.
//    * If either version number contains characters other than digits and the . character,
//      we should return null.

// P
  // Given two string inputs, compare them in order to return 0, -1, or 1, based on whether
  // the first string is equal to, less than, or greater than, the second. Equality can be
  // determined by the first substring (from left to right) of each string that is unequal
// E
console.log(compareVersions('1.1e8.2', '13.37'));
// console.log(compareVersions('0.1', '1') === -1);
// console.log(compareVersions('1', '1.0') === 0);
// console.log(compareVersions('1.0', '1.1') === -1);
// console.log(compareVersions('1.1', '1.2') === -1);
// console.log(compareVersions('1.2', '1.2.0.0') === 0);
// console.log(compareVersions('1.2.0.0', '1.18.2') === -1);
// console.log(compareVersions('1.18.2', '13.37') === -1);
// D
  // We'll split the input strings into iterable ARRAYS based on the '.' delimiter
// A
  // Split each input string into an array, using '.' as a delimiter, and map to a Numnber
  // If one array is shorter than the other
    // Push Array(lenDifference).fill(0) to the shorter array, and flatten it
  // For each number from 0 to the length of the arrays:
    // if arr1[idx] < arr2[idx] return -1
    // else if arr1[idx] > arr2[idx] return 1
  // if we didn't return a value in the above for loop, finally return 0

// C

function compareVersions(version1, version2) {
  // check for any non-digit or '.' characters and use a guard clause to return null
  let regex = /[^0-9.]/i
  if (regex.test(version1) || regex.test(version2)) return null;

  let first = version1.split('.').map(el => Number(el));
  let second = version2.split('.').map(el => Number(el));

  // if there is an array length imbalance, fill the shorter array with 0s
  if (first.length > second.length) {
    let lenDiff = first.length - second.length;
    second.push(Array(lenDiff).fill(0));
    second = second.flat();
  } else if (first.length < second.length) {
    let lenDiff = second.length - first.length;
    first.push(Array(lenDiff).fill(0));
    first = first.flat();
  }

  // iterate through the arrays, return if there is element inequality at an index
  for (let idx = 0; idx < first.length; idx += 1) {
    let firstEl = first[idx];
    let secondEl = second[idx];

    if (firstEl > secondEl) {
      return 1;
    } else if (firstEl < secondEl) {
      return -1;
    }
  }

  // if there were no element inequalities, return 0
  return 0;
}