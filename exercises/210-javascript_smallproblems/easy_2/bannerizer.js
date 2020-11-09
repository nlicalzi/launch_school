function logVerticalBound(len) {
  console.log(`+${'-'.repeat(len + 2)}+`);
}

function fillerLine(len) {
  console.log(`|${' '.repeat(len + 2)}|`);
}

function printMessage(str) {
  console.log(`| ${str} |`);
}

function logInBox(str) {
  let len = str.length;
  logVerticalBound(len);
  fillerLine(len);
  printMessage(str);
  fillerLine(len);
  logVerticalBound(len);
}

logInBox('message');

logInBox('');

logInBox('this is my message');