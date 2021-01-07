// Rewrite your fibonacci function so that it computes its results without recursion.

function fibonacci(nthFib) {
  let prevNums = [1, 1];
  for (let count = 3; count <= nthFib; count += 1) {
    prevNums = [prevNums[1], prevNums[0] + prevNums[1]];
  }

  return prevNums[1];
}

console.log(fibonacci(20) === 6765);
console.log(fibonacci(50) === 12586269025);
console.log(fibonacci(75) === 2111485077978050);