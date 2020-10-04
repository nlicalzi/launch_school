function shortLongShort(str1, str2) {
  return (str1.length > str2.length) ? str2 + str1 + str2 : str1 + str2 + str1
}

console.log(shortLongShort('abc', 'defgh') === 'abcdefghabc');    // "abcdefghabc"
console.log(shortLongShort('abcde', 'fgh') === 'fghabcdefgh');    // "fghabcdefgh"
console.log(shortLongShort('', 'xyz') === 'xyz');         // "xyz"