// Write a function that takes a non-empty string argument, and returns the middle
// character(s) of the string. If the string has an odd length, you should return exactly
// one character. If the string has an even length, you should return exactly two characters.

function centerOf(str) {
  // return the middle char of str if str.length is odd, two middle if even
  let mid = (str.length / 2) - 1;

  return (mid % 1 === 0) ? str.slice(mid, mid + 2) : str[Math.round(mid)];
}

console.log(centerOf('I Love JavaScript') === 'a'); // "a"
console.log(centerOf('Launch School') === ' ');     // " "
console.log(centerOf('Launch') === 'un');            // "un"
console.log(centerOf('Launchschool') === 'hs');      // "hs"
console.log(centerOf('x') === 'x');                 // "x"