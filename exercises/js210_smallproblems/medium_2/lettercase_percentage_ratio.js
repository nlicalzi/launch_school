// Write a function that takes a string, and returns an object containing the following
// three properties:
  // * the percentage of characters in the string that are lowercase letters
  // * the percentage of characters that are uppercase letters
  // * the percentage of characters that are neither
// You may assume that the string will always contain at least one character.

function letterPercentages(str) {
  let lowercaseCount, uppercaseCount, nonAlphaCount;
  let lowercasePct, uppercasePct, nonAlphaPct;
  let len = str.length;

  lowercaseCount = str.match(/[a-z]/g)   ? str.match(/[a-z]/g).length   : 0;
  uppercaseCount = str.match(/[A-Z]/g)   ? str.match(/[A-Z]/g).length   : 0;
  nonAlphaCount  = str.match(/[^a-z]/gi) ? str.match(/[^a-z]/gi).length : 0;

  lowercasePct = (lowercaseCount / len * 100).toFixed(2);
  uppercasePct = (uppercaseCount / len * 100).toFixed(2);
  nonAlphaPct  = (nonAlphaCount / len * 100).toFixed(2);

  return { lowercasePct, uppercasePct, nonAlphaPct };
}


console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }