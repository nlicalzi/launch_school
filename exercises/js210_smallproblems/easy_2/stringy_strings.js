function stringy(int) {
  if (int === 1) return '1';

  let timesRepeat = parseInt(int/2, 10);
  let str = '10';
  str = str.repeat(timesRepeat);
  
  if (int % 2 === 1) {
    return str + '1';
  } else {
    return str;
  }
}

console.log(stringy(6) === '101010');    // "101010"
console.log(stringy(9) === '101010101');    // "101010101"
console.log(stringy(4) === '1010');    // "1010"
console.log(stringy(7) === '1010101');    // "1010101"