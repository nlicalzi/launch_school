function integerToString(int) {
  if (int === 0) return '0';

  const DIGIT_CHARS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  let convertedString = '';

  while (int > 0) {
    let currentValue = int % 10;
    convertedString = DIGIT_CHARS[currentValue] + convertedString;
    int = Math.floor(int / 10);
  }

  return convertedString;
}

function signedIntegerToString(int) {
  if (int < 0) {
    return `-${integerToString(Math.abs(int))}`;
  } else if (int > 0) {
    return `+${integerToString(int)}`;
  } else {
    return integerToString(int);
  }
}

console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"