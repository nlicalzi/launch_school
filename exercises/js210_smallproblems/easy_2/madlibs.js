let readlineSync = require('readline-sync');

let noun = readlineSync.question('Enter a noun: ');
let verb = readlineSync.question('Enter a verb: ');
let adj = readlineSync.question('Enter an adjective: ');
let adverb = readlineSync.question('Enter an adverb: ');

console.log(`Do you ${verb} your ${adj} ${noun} ${adverb}? That's hilarious!`);