function studentGrade() {
  let rlSync = require('readline-sync');
  let scores = [];

  for (let i = 1; i < 4; i++) {
    scores.push(Number(rlSync.question(`Enter score ${i}: `)));
  }

  const reducer = (accumulator, currentVal) => accumulator + currentVal;
  let avg = scores.reduce(reducer) / scores.length;
  let grade;

  if (avg >= 90) {
    grade = 'A';
  } else if (avg >= 70) {
    grade = 'B';
  } else if (avg >= 50) {
    grade = 'C';
  } else if (avg < 50) {
    grade = 'F';
  }

  console.log(`Based on the average of your 3 scores, your letter grade is "${grade}"`)
}

studentGrade();