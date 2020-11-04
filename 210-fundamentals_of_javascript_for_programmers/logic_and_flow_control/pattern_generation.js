function generatePattern(number) {
  let str = '*'.repeat(number);

  for (let i = 1; i <= number; i++) {
    str = str.replace('*', i);
    console.log(str);
  }
}

generatePattern(5);

generatePattern(9);