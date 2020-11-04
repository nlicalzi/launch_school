function trim(str) {
  if (str.length === 0) return '';

  let first_nonspace_idx;
  for (let i = 0; i < str.length; i+= 1) {
    if (str[i] === ' ') {
      continue;
    } else {
      first_nonspace_idx = i;
      break;
    }
  }

  if (first_nonspace_idx === undefined) return ''; // guard clause if all chars are spaces

  let last_nonspace_idx;
  for (let i = 0; i < str.length; i+= 1) {
    if (str[i] !== ' ') {
      last_nonspace_idx = i;
    }
  }

  let output = '';
  for (let i = first_nonspace_idx; i <= last_nonspace_idx; i+= 1) {
    output += str[i];
  }
  return output;
}

console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""

  // trim spaces forwards from str[0] until hitting a character
    // return '' if str.length === 0
    // initialize variable: first_nonspace_idx
    // increment through str from str[0] up to str[str.length - 1]
      // set first_nonspace_idx to first index position that doesn't match ' '
      // return '' if loop ends without hitting a non-space char
    // initialize variable: last_nonspace_idx
      // increment through str from str[0] up to str[str.length - 1]
        // set last_nonspace_idx to each index position if it doesn't match ' '
    // initialize new variable 'output'
    // iterate through str from first_nonspace_idx to last_nonspace_idx, concatenating to str 'output
  // return output
