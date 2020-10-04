function multisum(int) {
  let arr = [];
  for (let i = 1; i <= int; i += 1) {
    if (i % 3 === 0 || i % 5 === 0) {
      arr.push(i);
    }
  }

  const reducer = (accumulator, currentVal) => accumulator + currentVal;

  return arr.reduce(reducer);
}

console.log(multisum(3) === 3);       // 3
console.log(multisum(5) === 8);       // 8
console.log(multisum(10) === 33);      // 33
console.log(multisum(1000) === 234168);    // 234168