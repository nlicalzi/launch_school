// Write a Function named octalToDecimal that performs octal to decimal conversion. 
// When invoked on a String that contains the representation of an octal number, the Function returns a decimal version of that value as a Number.
// Implement the conversion yourself: do not use something else to perform the conversion for you.


// p: see above
// e
console.log(octalToDecimal('1') === 1);         // 1
console.log(octalToDecimal('10') === 8);        // 8
console.log(octalToDecimal('130') === 88);      // 88
console.log(octalToDecimal('17') === 15);       // 15
console.log(octalToDecimal('2047') === 1063);   // 1063
console.log(octalToDecimal('011') === 9);       // 9

// datastructure: array
// algo
  // take a given number string
    // split that string into an array
    // reverse the array
    // map each element in the array to its numeric form
  // initialize a variable "result" 
  // for the number array
    // iterate over the array with a for loop
    // multiply the array element at the index position by 8^idx
    // add the resulting number to "result"
  // return "result"
// code

function octalToDecimal(numberString) {
  let result = 0;
  let numbers = numberString.split('')
                            .reverse()
                            .map(el => Number(el));
  
  numbers.forEach((el, idx) => {
    result += el * Math.pow(8, idx);
  });
  return result;
}