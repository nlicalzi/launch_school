// The Luhn formula is a simple checksum formula used to validate a variety of
// identification numbers, such as credit card numbers Canadian Social Insurance Numbers.
// The formula verifies a number against its included check digit, which is usually
// appended to a partial number to generate the full number. This number must pass the
// following test:

// * Counting from the rightmost digit and moving left, double the value of every second digit
// * For any digit that thus become 10 or more, subtract 9 from the result
    // 1111 becomes 2121
    // 8763 becomes 7733 (from 2 x 6 = 12 -> 12 - 9 = 3 and 2 x 8 = 16 -> 16 - 9 = 7)
// * Add all these digits together
    // 1111 becomes 2121 sums as 2 + 1 + 2 + 1 to give a checksum of 6
    // 8763 becomes 7733, and 7 + 7 + 3 + 3 is 20

// If the total (the checksum) ends in 0 (put another way, if the total modulo 10 is
// congruent to 0), then the number is valid according to the Luhn Formula; else it is not
// valid. Thus, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid
// (as shown above, it comes out to 20).

// Write a program that, given a number in string format, check if it is valid per the
// Luhn formula. This should treat, for example, "2323 2005 7766 3554" as valid. You can
// ignore all non-numeric characters in the input string.

// P
  // Input: number string
  // Output: boolean
  // Rules:
    // ignore non-numeric characters in input string
    // if checksum % 10 === 0, return true else return false
  // Process an input numberstring, returning a boolean based on applying the Luhn Formula
  // Luhn formula algo:
    // remove any non-number characters from input numberstring
    // split the resulting numberstring into chars
    // map every second digit (incl. first) from right to left to its number form * 2
      // if this mapping results in a number > 10, return number - 9
    // create a variable checksum by reducing through addition
    // return checksum % 10 === 0;

// E
  // console.log(checkLuhnValidity("2323 2005 7766 3554") === true);
  // console.log(checkLuhnValidity("8763") === true);
  // console.log(checkLuhnValidity("1111") === false);
// D
  // Use an array to leverage built-in methods
// A
  // create new array from input string, stripping non-digit characters
  // reverse the new array and map it:
    // convert the element to Number(element)
    // if the index of an element is odd
      // create variable newEl: element * 2
        // if newEl > 10, reassign newEl to newEl - 9;
      // return newEl;
    // else return the element
  // reduce the resulting array with an adder, and return checksum % 10 === 0
// C

function checkLuhnValidity(string) {
  let digits = string.match(/[0-9]/g)
                     .map(Number)
                     .reverse();

  let mappedDigits = digits.map((digit, idx) => {
    if (idx % 2 !== 0) {
      let doubled = digit * 2;
      return doubled >= 10 ? (doubled - 9) : doubled;
    } else {
      return digit;
    }
  });

  let checksum = mappedDigits.reduce((a, b) => a + b);

  return (checksum % 10 === 0);
}

console.log(checkLuhnValidity("2323 2005 7766 3554") === true);
console.log(checkLuhnValidity("8763") === true);
console.log(checkLuhnValidity("1111") === false);