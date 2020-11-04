// You are given a list of numbers in a "short-hand" range where only the significant part
// of the next number is written because we know the numbers are always increasing
// (ex. "1, 3, 7, 2, 4, 1" represents [1, 3, 7, 12, 14, 21]). Some people use different
// separators for their ranges (ex. "1-3, 1-2", "1:3, 1:2", "1..3, 1..2" represent the
// same numbers [1, 2, 3, 11, 12]). Range limits are always inclusive.

// The possible separators are: ["-",
//                               ":",
//                               ".."]
// Your job is to return a list of complete numbers.

// P
  // Define a function "decodeShorthand" that takes an array of number strings
  // Create a new variable 'result' and assign it to the array [0]
  // Loop through the elements by index
  //    If an element in the array tests true for the regex /(-)|(:)|(\.\.)/g
  //      Expand the range into all covered numbers and push to result
  // 
// E
// D
// A
// C

function getSignificantPart(firstNum, secondNum) {
  let lenFirst = String(firstNum).length;
  let lenSecond = String(secondNum).length;

  return sigPart;
}



function expandRange(start, end) {
  let arr = [];
  // iterate from start to end, pushing each number to arr
  return arr;
}