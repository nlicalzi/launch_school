function crunch(str) {
  let output = '';
  let prevChar;

  for (let idx = 0; idx < str.length; idx += 1) {
    let currChar = str[idx];
    if (currChar === prevChar) {
      continue;
    } else {
      output += currChar;
      prevChar = currChar;
    }
  }

  return output;
}


console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""