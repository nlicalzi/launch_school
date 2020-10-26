// A collection of spelling blocks has two letters per block, as shown in this list:
// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M

// This limits the words you can spell with the blocks to only those words that do not use
// both letters from any given block. You can also only use each block once.

// Write a function that takes a word string as an argument, and returns true if the word
// can be spelled using the set of blocks, or false otherwise. You can consider the letters
// to be case-insensitive when you apply the rules.

// P
  // For a given case-insensitive input word
  // Check if the word includes EITHER:
    // any alpha character more than once (detectRepeatElements)
    // OR
    // both sides of any individual block (subarray) (detectRepeatedBlock)
  // Return true if neither of the above is true, else return false
// E
  // console.log(isBlockWord('BATCH') === true);
  // console.log(isBlockWord('BUTCH') === false);
  // console.log(isBlockWord('jest') === true);
// D
  // We can create an array with subarrays consisting of pseudo 2-tuples for each block
  // Split the input word into an array of characters also, so we can iterate over it
// A
  // take an input string, capitalize it, and split it into characters
  // return false if EITHER of two functions is true:
    // detectRepeatElements(arr)
      // create new object 'elements' 
      // iterate through arr, incrementing the value of key 'el' by 1 each time it appears or setting it to 0
      // return a boolean based on whether some key in 'elements' has value > 1
    // detectRepeatedLetterBlock(arr)
      // create an array constant BLOCKS containing subarrays with letter 2-tuples
      // iterate through BLOCKS using a for loop
        // return true if both elements in each sub array are present in elements
      // return false
// C

function noRepeatElements(characters) {
  let charCount = characters.reduce((count, char) => {
    count[char] = (count[char] || 0) + 1;
    return count;
  }, {});

  return Object.values(charCount).every(el => el === 1); // does any char occur more than once?
}

function eachBlockUsedOnlyOnce(word) {
  const BLOCKS = [
    ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
    ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
    ['V', 'I'], ['L', 'Y'], ['Z', 'M']
  ];

  for (let idx = 0; idx < BLOCKS.length; idx += 1) {
    let firstSide = BLOCKS[idx][0];
    let secondSide = BLOCKS[idx][1];

    // console.log([ firstSide, secondSide ])
    if (word.includes(firstSide) && word.includes(secondSide)) return false;
  }

  return true;
}

function isBlockWord(str) {
  // do we have to check for non-alpha characters? could use a guard clause here
  let word = str.toUpperCase();
  let chars = word.split('');

  return noRepeatElements(chars) && eachBlockUsedOnlyOnce(word);
}

console.log(isBlockWord('BATCH') === true);
console.log(isBlockWord('BUTCH') === false);
console.log(isBlockWord('jest') === true);