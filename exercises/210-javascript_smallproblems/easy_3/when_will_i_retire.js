// Build a program that logs when the user will retire and how many more years the
// user has to work until retirement.

function retirementCalculator() {
  var readlineSync = require('readline-sync');

  let age = readlineSync.question('What is your age? ');
  let retirementAge = readlineSync.question('At what age would you like to retire? ');

  let currentYear = new Date().getFullYear();
  let yearsLeft = (retirementAge - age);
  let retirementYear = currentYear + yearsLeft;

  console.log(`It's ${currentYear}. You will retire in ${retirementYear}.`);
  console.log(`You have only ${yearsLeft} years of work to go!`);
}

retirementCalculator();