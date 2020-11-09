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

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570

DIGITS[9];