function century(year) {
  let centuryNumber = Math.floor(year / 100) + 1;

  if (year % 100 === 0) {
    centuryNumber -= 1;
  }

  return String(centuryNumber) + centurySuffix(centuryNumber);
}

function centurySuffix(centuryNumber) {
  if (catchWithTh(centuryNumber % 100)) {
    return 'th';
  }

  let lastDigit = centuryNumber % 10;
  switch (lastDigit) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

function catchWithTh(lastTwo) {
  return lastTwo === 11 || lastTwo === 12 || lastTwo === 13;
}

console.log(century(2000) === '20th');        // "20th"
console.log(century(2001) === '21st');        // "21st"
console.log(century(1965) === '20th');        // "20th"
console.log(century(256) === '3rd');         // "3rd"
console.log(century(5) === '1st');           // "1st"
console.log(century(10103) === '102nd');       // "102nd"
console.log(century(1052) === '11th');        // "11th"
console.log(century(1127) === '12th');        // "12th"
console.log(century(11201) === '113th');       // "113th"