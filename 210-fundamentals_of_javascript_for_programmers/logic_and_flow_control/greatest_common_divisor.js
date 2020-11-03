function gcd(val1, val2) {
  let arr = [val1, val2];
  let min = Math.min(...arr);
  let max = Math.max(...arr);

  for (let divisor = min; divisor > 1; divisor--) {
    if ((max % divisor === 0) && (min % divisor === 0)) return divisor;
  }

  return 1;
}

// function gcd(num1, num2) {
//   var temp;

//   while (num2 !== 0) {
//     temp = num2;
//     num2 = num1 % num2;
//     num1 = temp;
//   }

//   return num1;
// }

console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1