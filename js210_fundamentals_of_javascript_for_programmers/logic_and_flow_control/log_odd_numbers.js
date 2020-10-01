function logOddNumbers(max) {
  for (let i = 1; i <= max; i += 2) {
    console.log(i);
  }
}

// function logOddNumbers(max) {
//   for (let i = 1; i <= max; i += 1) {
//     if (i % 2 === 1) {
//       console.log(i);
//     }
//   }
// }

// function logOddNumbers(max) {
//   for (let i = 1; i <= max; i += 1) {
//     if (i % 2 === 0) {
//       continue;
//     } else {
//       console.log(i);
//     }
//   }
// }


logOddNumbers(19);