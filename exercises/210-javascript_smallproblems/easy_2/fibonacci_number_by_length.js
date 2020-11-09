function findFibonacciIndexByLength(len) {
  let first = 1;      // initial values assuming len is at least 2
  let second = 1;     // initial values assuming len is at least 2
  let fibonacci = 2;  // initial values assuming len is at least 2
  let idx = 2;        // which fibonacci number are we dealing with?

  do {
    fibonacci = first + second;
    first = second;
    second = fibonacci;
    idx++;
  } while (String(fibonacci).length < len) 

  return idx;
}

console.log(findFibonacciIndexByLength(2));   // 7
console.log(findFibonacciIndexByLength(10));  // 45
console.log(findFibonacciIndexByLength(16));  // 74