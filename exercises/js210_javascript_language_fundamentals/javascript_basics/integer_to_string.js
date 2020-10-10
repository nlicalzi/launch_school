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

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"