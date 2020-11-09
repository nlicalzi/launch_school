// Write a function that returns a list of all substrings of a string that are palindromic.
// That is, each substring must consist of the same sequence of characters forwards as
// backwards. The substrings in the returned list should be sorted by their order of
// appearance in the input string. Duplicate substrings should be included multiple times.

function palindromes(str) {
  let allSubstrings = substrings(str);
  return allSubstrings.filter(isPalindrome);
}

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

function reverse(str) {
  return str.split('').reverse().join('');
}

function isPalindrome(str) {
  return (str === reverse(str)) && str.length > 1
}

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]
console.log(palindromes('knitting cassettes'));