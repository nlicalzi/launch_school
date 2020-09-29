const readlineSync = require("readline-sync");

console.log("Enter the first number:")
let first_int  = Number(readlineSync.prompt())
console.log("Enter the second number:")
let second_int = Number(readlineSync.prompt())

console.log(`${first_int} + ${second_int} = ${first_int + second_int}`);
console.log(`${first_int} - ${second_int} = ${first_int - second_int}`);
console.log(`${first_int} * ${second_int} = ${first_int * second_int}`);
console.log(`${first_int} / ${second_int} = ${parseInt(first_int / second_int)}`);
console.log(`${first_int} % ${second_int} = ${first_int % second_int}`);
console.log(`${first_int} ** ${second_int} = ${first_int ** second_int}`);