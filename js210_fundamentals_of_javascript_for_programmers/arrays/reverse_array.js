const NAMES = ['Nick', 'Abby', 'Bean', 'Beatrice'];

function reverse(array) {
  let outputArr = [];
  for (let idx = array.length -1; idx >= 0; idx -= 1) {
    outputArr.push(array[idx]);
  }

  return outputArr;
}

console.log(reverse(NAMES));