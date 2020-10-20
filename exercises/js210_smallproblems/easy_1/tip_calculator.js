let readlineSync = require('readline-sync');

let bill    = Number(readlineSync.question('What is the bill? '));
let tip_pct = Number(readlineSync.question('What is the tip percentage? '));

let tip = (bill * tip_pct / 100);
let total = bill + tip;

console.log(`The tip is $${tip.toFixed(2)}.`);
console.log(`The total is $${total.toFixed(2)}.`);