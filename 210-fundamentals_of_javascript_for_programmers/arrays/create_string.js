function compressToString(arr) {
  let strOut = '';
  for (let idx = 0; idx < arr.length; idx += 1) {
    strOut += String(arr[idx]);
  }

  return strOut;
}

let arr = ['a', '1', 'b', '2'];
console.log(compressToString(arr));