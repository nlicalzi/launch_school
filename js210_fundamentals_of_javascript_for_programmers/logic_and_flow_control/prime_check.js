function isPrime(int) {
  if (int < 2) return false; // guard clause, first prime is 2

  for (let i = 3; i < int; i++) {
    if (int % i === 0) return false;
  }

  return true;
}

console.log(isPrime(1));   // false
console.log(isPrime(2));   // true
console.log(isPrime(3));   // true
console.log(isPrime(43));  // true
console.log(isPrime(55));  // false
console.log(isPrime(0));   // false