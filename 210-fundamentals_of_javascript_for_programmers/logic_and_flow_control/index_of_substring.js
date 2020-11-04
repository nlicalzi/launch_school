function indexOf(firstString, secondString) {
  let limit = firstString.length - secondString.length;

  for (let indexFirst = 0; indexFirst <= limit; indexFirst += 1) {
    let matchCount = 0;

    for (let indexSecond = 0; indexSecond < secondString.length; indexSecond += 1) {
      if (firstString[indexFirst + indexSecond] === secondString[indexSecond]) {
        matchCount += 1;
      } else {
        break;
      }
    }

    if (matchCount === secondString.length) {
      return indexFirst;
    }
  }

  return -1;
}

function lastIndexOf(firstString, secondString) {
  let limit = firstStirng.length - secondString.length;

  for (let indexFirst = limit; indexFirst >= 0; indexFirst -= 1) {
    let matchCount = 0;

    for (let indexSecond = 0; indexSecond < secondString.length; indexSecond += 1) {
      if (firstString[indexFirst + indexSecond] === secondString[indexSecond]) {
        matchCount += 1;
      } else {
        break;
      }
    }

    if (matchCount === secondString.length) {
      return indexFirst;
    }
  }

  return -1;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1