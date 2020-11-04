// Write a program that cleans up user-entered phone numbers so that they can be sent as
// SMS messages. Other than digits, the number may also contain special character such as
// spaces, dash, dot, and parentheses that should be ignored.

// Requirements:
// * For bad numbers, just return a string of 10 0s

// * If the phone number is less than 10 digits, assume that it is a bad number.
// * If the phone number is 10 digits, assume that it is good.
// * If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
// * If the phone number is 11 digits and the first number is not 1, then it is a bad number.
// * If the phone number is more than 11 digits, assume that it is a bad number.

// P
  // Write a program that strips non-digit characters from a string input.
  // The program should check validity of the stripped number string, returning
  // either the produced numberstring if valid, or '0000000000' if  invalid. 
// E
  // See below
// D
  // In: Str, Out: Str, Intermediate: Array?
// A
// C

const INVALID_NUMBER = '0'.repeat(10);

function checkInvalidString(str) {
  return (typeof str !== 'string') || (str.length === 0);
}

function cleanedPhoneNumber(phoneStr) {
  if (checkInvalidString(phoneStr)) return INVALID_NUMBER;

  let invalidChars = /[^ -\/.()0-9]/                         // invalid characters (negated valid chars)
  if (invalidChars.test(phoneStr)) return INVALID_NUMBER;    // guard clause: input contains invalid char

  let digits = phoneStr.match(/[0-9]/g);              // cleaned array of digit characters from phoneStr
  if ((digits.length < 10) || (digits.length > 11)) { // # w/ <10 or >11 digits is invalid
    return INVALID_NUMBER;
  } else if (digits.length === 10) {                  // assume valid if len === 10
    return digits.join('');
  } else if (digits.length === 11) {                  // if leftmost el is '1', shift it or return invalid
    return (digits[0] === '1') ? digits.slice(1).join('') : INVALID_NUMBER;
  }
}

console.log(cleanedPhoneNumber('(012)3456789') === '0123456789');       // parentheses are valid
console.log(cleanedPhoneNumber('012.3456.789') === '0123456789');       // periods are valid
console.log(cleanedPhoneNumber('012 3456 789') === '0123456789');       // spaces are valid
console.log(cleanedPhoneNumber('012-3456-789') === '0123456789');       // dashes are valid
console.log(cleanedPhoneNumber('10123456789') === '0123456789');        // trimmed leading 1
console.log(cleanedPhoneNumber('012d3456789') === INVALID_NUMBER);      // invalid char: d
console.log(cleanedPhoneNumber('0123456789012345') === INVALID_NUMBER); // too long
console.log(cleanedPhoneNumber('012345') === INVALID_NUMBER);           // too short
console.log(cleanedPhoneNumber('') === INVALID_NUMBER);                 // too short
console.log(cleanedPhoneNumber(33) === INVALID_NUMBER);                 // invalid type: not string
console.log(cleanedPhoneNumber({}) === INVALID_NUMBER);                 // invalid type: not string
console.log(cleanedPhoneNumber([]) === INVALID_NUMBER);                 // invalid type: not string