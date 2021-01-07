// Write a function that takes a string, doubles every character in the string, and
// returns the result as a new string.

function repeater(str) {
  return str.split('').map(el => el.repeat(2)).join('');
}

console.log(repeater('Hello') === 'HHeelllloo');        // "HHeelllloo"
console.log(repeater('Good job!') === 'GGoooodd  jjoobb!!');    // "GGoooodd  jjoobb!!"
console.log(repeater('') === '');             // ""