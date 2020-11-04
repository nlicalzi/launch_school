function fibonacci(number) {
  if (number < 2) return number; // 0 if number is 0, 1 if number is 1
  return fibonacci(number - 1) + fibonacci(number - 2);
}

console.log(fibonacci(6)); // should log 8
console.log(fibonacci(20)); // should log 6765