const readlineSync = require("readline-sync");

console.log("Please enter a phrase")
let input = readlineSync.prompt()
let charCount = input.length

console.log(`There are ${charCount} characters in "${input}".`)