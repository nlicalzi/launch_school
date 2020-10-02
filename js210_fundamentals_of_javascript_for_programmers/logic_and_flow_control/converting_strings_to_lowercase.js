function isUppercaseAlpha(charCode) {
  return (charCode >= 65 && charCode <= 90);
}

function toLowerCase(str) {
  let output = '';
  for (let idx = 0; idx < str.length; idx += 1) {
    let asciiNumeric = str.charCodeAt(idx);
    if (isUppercaseAlpha(asciiNumeric)) {               // if char is uppercase alpha
      output += String.fromCharCode(asciiNumeric + 32); // convert to lowercase
    } else {
      output += str[idx];                               // else append to output str
    }
  }
  return output;
}

console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"