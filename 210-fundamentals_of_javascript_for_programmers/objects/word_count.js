function wordCount(str) {
  let count = {};
  let words = str.split(' ');
  for (let idx in words) {
    let word = words[idx];
    count[word] ? count[word] += 1 : count[word] = 1
  }
  return count;
}

console.log(wordCount('box car cat bag box car')); // { box: 2, car: 2, cat: 1, bag: 1 }