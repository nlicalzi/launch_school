function isPrime(int) {
  if (int < 2) return false; // guard clause, first prime is 2

  for (let i = 3; i < int; i++) {
    if (int % i === 0) return false;
  }

  return true;
}

function checkGoldbach(expectedSum) {
  if ((expectedSum < 4) || (expectedSum % 2 === 1)) {
    console.log(null); // Goldbach's Conjecture is for evens > 4
    return;            // break out of the loop
  }

  for (let min = 2; min <= (expectedSum/2); min++) {
    let max = expectedSum - min;
    if (isPrime(min) && isPrime(max)) {
      console.log(`${min} ${max}`);
    }
  }
}

// first prime: 2
// get prime pairs: 
//   let min = 2;
//   loop until min = expectedSum/2;
//   increment min;
//   IF isPrime(min) && isPrime(expectedSum - min)
//     return min, expectedSum - min

checkGoldbach(3);
// logs: null

checkGoldbach(4);
// logs: 2 2

checkGoldbach(12);
// logs: 5 7

checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53

checkGoldbach(101);