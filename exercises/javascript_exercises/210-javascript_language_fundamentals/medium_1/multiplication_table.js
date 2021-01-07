"use strict";

function padLeft(number) {
  const strNum = String(number);
  switch(strNum.length) {
    case 1: return `  ${strNum}`;   // don't have to worry about execution falling through
    case 2: return ` ${strNum}`;    // because return statements end the code
    default: return strNum;         // here too!
  }
}

for (let i = 1; i <= 10; i += 1) {
  let row = '';
  for (let j = 1; j <= 10; j += 1) {
    row += `${padLeft(i * j)} `;
  }

  console.log(row);
}