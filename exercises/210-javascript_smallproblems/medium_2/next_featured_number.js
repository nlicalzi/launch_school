/*
A featured number (something unique to this exercise) is an odd number that is a multiple
of 7, with all of its digits occuring exactly once each. For example, 49 is a featured
number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is
not (the digit 3 appears twice).

Write a function that takes an integer as an argument, and returns the next featured number
greater than the integer. Issue an error message if there is no next featured number.

NOTE: The largest possible featured number is 9876543201.
*/

function featured(num) {
  for (let i = num + 1; i < 9876543201; i += 1) {
    if (isFeatured(i)) {
      return i;
    }
  }

  return 9876543201; 
}

function isFeatured(num) { 
  let digits = String(num).split('').map(Number);
  let onlyUniqueDigits = (digits.length === new Set(digits).size);
  return (num % 7 === 0) && (num % 2 === 1) && onlyUniqueDigits;
}

console.log(featured(12));
console.log(featured(12) === 21);           // 21
console.log(featured(20) === 21);           // 21
console.log(featured(21) === 35);           // 35
console.log(featured(997) === 1029);          // 1029
console.log(featured(1029) === 1043);         // 1043
console.log(featured(999999) === 1023547);       // 1023547
// console.log(featured(999999987) === 1023456987);    // 1023456987