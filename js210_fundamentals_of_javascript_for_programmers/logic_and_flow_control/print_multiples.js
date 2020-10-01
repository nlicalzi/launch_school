function logMultiples(num) {
  result = []
  for (let i = 1; (num * i) <= 100; i += 2) {
    result.push(num * i);
  }
  result.reverse().forEach(el => console.log(el));
}

logMultiples(17);

logMultiples(21);