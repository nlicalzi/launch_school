let readlineSync = require('readline-sync');

let int = readlineSync.question('Please enter an integer greater than 0: ');
let operation = readlineSync.question('Enter "s" to compute the sum, or "p" to compute the product: ');

let arr = []; 

for (let i = 1; i <= int; i += 1) {
  arr.push(i);
}

if (operation === "s") {
  const reducer = (accumulator, currValue) => accumulator + currValue;
  let result = arr.reduce(reducer);
  console.log(`The sum of the integers between 1 and ${int} is ${result}`);
} else if (operation === "p") {
  const reducer = (accumulator, currValue) => accumulator * currValue;
  let result = arr.reduce(reducer);
  console.log(`The product of the integers between 1 and ${int} is ${result}`);
} else {
  console.log('Invalid operation selection.')
}
