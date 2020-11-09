function stringToInteger(intString) {
  const DIGITS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  let convertedNumber = 0;
  let place = 1;

  for (let idx = intString.length - 1; idx >= 0; idx -= 1) {
    let char = intString[idx];
    convertedNumber += (DIGITS[char] * place);
    place *= 10;
  }

  return convertedNumber;
}

function stringToSignedInteger(intString) {
  switch (intString[0]) {
    case '-': return -stringToInteger(intString.slice(1));
    case '+': return stringToInteger(intString.slice(1));
    default: return stringToInteger(intString);
  }
}

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100