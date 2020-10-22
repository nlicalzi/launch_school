// Write a function that takes a string argument, and returns true if all of the alphabetic
// characters inside the string are uppercase; false otherwise. Ignore characters that are
// not alphabetic.

function isUppercase(text) {
  let alphaChars = text
                    .replace(/[^a-z]/ig, '')
                    .split('');

  return alphaChars.every(char => char === char.toUpperCase());
}

console.log(isUppercase('t') === false);              // false
console.log(isUppercase('T') === true);               // true
console.log(isUppercase('Four Score') === false);     // false
console.log(isUppercase('FOUR SCORE') === true);      // true
console.log(isUppercase('4SCORE!') === true);         // true
console.log(isUppercase('') === true);                // true