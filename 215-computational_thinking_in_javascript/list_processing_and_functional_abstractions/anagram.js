function alphabetizeWord(word) {
  return word.split('').sort().join('')
}

function areAnagrams(word1, word2) {
  return alphabetizeWord(word1) === alphabetizeWord(word2);
}

function anagram(matchWord, list) {
  return list.filter(word => areAnagrams(word, matchWord));
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
