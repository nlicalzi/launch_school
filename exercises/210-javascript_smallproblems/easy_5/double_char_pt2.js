// Write a function that takes a string, doubles every consonant character in the string,
// and returns the result as a new string. The function should not double vowels
// ('a','e','i','o','u'), digits, punctuation, or whitespace.

function doubleConsonants(str) {
  let regex = /[bcdfghjklmnpqrstvwxyz]/i
  return str.split('').map(char => {
    return regex.test(char) ? char.repeat(2) : char;
  }).join('');
}

console.log(doubleConsonants('String') === 'SSttrrinngg');          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!') === 'HHellllo-WWorrlldd!');    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th') === 'JJullyy 4tthh');        // "JJullyy 4tthh"
console.log(doubleConsonants('') === '');                // ""