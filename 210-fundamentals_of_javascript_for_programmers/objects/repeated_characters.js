function repeatedCharacters(str) {
  let charCount = {};
  let characters = str.toLowerCase().split('');
  for (let idx in characters) {
    let char = characters[idx];
    if (charCount[char]) {
      charCount[char] += 1;
    }
    else {
      charCount[char] = 1;
    }
  }

  for (let key in charCount) {
    if (charCount[key] === 1) {
      delete charCount[key];
    }
  }

  return charCount;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }