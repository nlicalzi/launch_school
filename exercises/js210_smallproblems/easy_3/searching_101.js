// Write a program that solicits six numbers from the user, then logs a message that
// describes whether or not the sixth number appears amongst the first five numbers.

function searching101() {
  var readlineSync = require('readline-sync');

  let times = ['1st', '2nd', '3rd', '4th', '5th', 'last']
  
  times.forEach(time => {
    readlineSync.question(`Enter the ${time} number: `);
  });
}

searching101();