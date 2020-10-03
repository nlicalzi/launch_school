let readlineSync = require('readline-sync');
const SQ_METERS_TO_FEET = 10.7639;

let length = readlineSync.question('Enter the length of the room in meters: ');
length =  parseInt(length, 10);

let width = readlineSync.question('Enter the width of the room in meters: ');
width = parseInt(width, 10);

let sqm = length * width;
let sqft = sqm * SQ_METERS_TO_FEET;

console.log(`The area of the room is ${sqm.toFixed(2)} square meters (${sqft.toFixed(2)} square feet).`)