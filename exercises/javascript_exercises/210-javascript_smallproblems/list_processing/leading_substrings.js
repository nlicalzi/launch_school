// Write a function that takes a string argument, and returns a list of all substrings
// that start from the beginning of the string, ordered from shortest to longest.

function leadingSubstrings(str) {
  let arr = str.split('')
  return arr.map((el, idx) => arr.slice(0, idx + 1).join(''));
}

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]