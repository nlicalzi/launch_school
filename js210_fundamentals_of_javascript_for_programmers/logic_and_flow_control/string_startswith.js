function startsWith(str, searchStr) {
  str = String(str)             // ensure explicit typecasting
  searchStr = String(searchStr) // ensure explicit typecasting

  for (let i = 0; i < searchStr.length; i += 1) {
    if (str[i] !== searchStr[i]) {
      return false;
    }
  }

  return true;
}

let str = 'We put comprehension and mastery above all else';
console.log(startsWith(str, 'We'));              // true
console.log(startsWith(str, 'We put'));          // true
console.log(startsWith(str, ''));                // true
console.log(startsWith(str, 'put'));             // false

let longerString = 'We put comprehension and mastery above all else!';
console.log(startsWith(str, longerString));      // false