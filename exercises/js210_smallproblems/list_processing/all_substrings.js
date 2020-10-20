// Write a function that returns a list of all substrings of a string. Order the returned
// list by where in the string the substring begins. This means that all substrings that
// start at position 0 should come first, then all substrings that start at position 1,
// and so on. Since multiple substrings will occur at each position, return the substrings
// at a given position from shortest to longest.

function leadingSubstrings(str) {
  let arr = str.split('')
  return arr.map((el, idx) => arr.slice(0, idx + 1).join(''));
}

function substrings(str) {
  let strings = [];
  for (let idx = 0; idx <= str.length; idx += 1) {
    let substr = str.slice(idx);
    strings.push(leadingSubstrings(substr));
  }

  return strings.flat();
}

console.log(substrings('abcde'));