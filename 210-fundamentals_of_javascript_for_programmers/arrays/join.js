function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}

function join(arr, joinStr) {
  if (arr.length <= 1) return joinStr;

  let strOut = '';
  for (let idx = 0; idx < arr.length; idx += 1) {
    let str = String(arr[idx]) + joinStr;
    strOut += str;
  }

  return strOut;
}

console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'
console.log(join([1], ' and '));                       // ' and '
console.log(join([], ' solo '));                       // ' solo '