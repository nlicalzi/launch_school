function rot13(str) {
  const UPPER = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  const LOWER = UPPER.toLowerCase()
  let output = '';

  for (let idx = 0; idx < str.length; idx += 1) { // for each character in str
    let char = str.charAt(idx)

    if (/[A-Z]/.test(char)) {         // if character is uppercase alpha
      let loc = UPPER.indexOf(char);
      loc = (loc + 13) % 26
      output += UPPER[loc];
    } else if (/[a-z]/.test(char)) {  // else if character is lowercase alpha
      let loc = LOWER.indexOf(char);
      loc = (loc + 13) % 26
      output += LOWER[loc];
    } else {                          // if char is not alphabetical
      output += char; 
    }
  }

  return output;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// logs:
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.