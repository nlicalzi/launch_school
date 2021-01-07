// 735291 - starting position
// 352917
// 329175
// 321597
// 321579 - maximum rotation

function maxRotation(number) {
  let numStr = String(number);
  let times = numStr.length - 1;
  for (let idx = 0; idx < times; idx += 1) {
    let first = numStr.slice(0, idx);
    let second = numStr.slice(idx);
    numStr = first + rotate(second);
  }

  return Number(numStr);
}

function rotate(str) {
  return str.slice(1) + str[0];
}

console.log(maxRotation(735291) === 321579);          // 321579
console.log(maxRotation(3) === 3);                    // 3
console.log(maxRotation(35) === 53);                  // 53
console.log(maxRotation(105) === 15);                 // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146) === 7321609845);  // 7321609845