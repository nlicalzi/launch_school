// Which letter is the most frequent starting letter of the elements in `names`?
let names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];

let letters = names.map(name => name[0]); // [ "H", "G", "K", "H", "K", "K", "O" ]

let counts = letters.reduce((obj, letter) => {
  obj[letter] = obj[letter] || 0; // set obj[letter] to 0 if it doesn't have a value
  obj[letter] += 1;
  return obj;
}, {}); // { H: 2, G: 1, K: 3, O: 1 }

let letter = Object.keys(counts).reduce((lastLetter, currentLetter) => {
  if (counts[lastLetter] > counts[currentLetter]) {
    return lastLetter;
  } else {
    return currentLetter;
  }
}); // "K"

console.log(letter === 'K');