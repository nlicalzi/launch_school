function splitString(str, delim) {
  if (delim === undefined) {
    console.log('ERROR: No delimiter');
    return;
  };

  let tempStr = '';
  for (let idx = 0; idx < str.length; idx += 1) {
    if (str[idx] === delim) {
      console.log(tempStr);
      tempStr = ''; // reset tempStr
    } else if (delim === '') {
      console.log(str[idx]); // log each char in str
    } else {
      tempStr += str[idx]; // append to tempStr
    }
  }

  if (tempStr) {
    console.log(tempStr);
  }
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello