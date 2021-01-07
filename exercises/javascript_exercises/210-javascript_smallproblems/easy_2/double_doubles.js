function twice(num) {
  let numStr = String(num);
  let midpoint = parseInt(numStr.length / 2, 10);

  let firstHalf = numStr.substring(0, midpoint);
  let secondHalf = numStr.substring(midpoint);

  if (firstHalf === secondHalf) {
    return num;
  } else {
    return num * 2;
  }
}


console.log(twice(37) === 74);          // 74
console.log(twice(44) === 44);          // 44
console.log(twice(334433) === 668866);      // 668866
console.log(twice(444) === 888);         // 888
console.log(twice(107) === 214);         // 214
console.log(twice(103103) === 103103);      // 103103
console.log(twice(3333) === 3333);        // 3333
console.log(twice(7676) === 7676);        // 7676