// SNIPPET 1
// var counter = 5;
// var rate = 3;
// console.log('The total value is ' + String(counter * rate));

// function counter(count) {
//   //
// }

// The above code snippet will print "The total value is 15"
// The function definition is hoisted to the top, then 'counter' is overwritten on line 2

// SNIPPET 2
// function counter(count) {
//   // 
// }

// console.log('The total value is ' + String(counter * rate));

// var counter = 5;
// var rate = 3;

// The above code snippet will print "The total value is NaN"

// SNIPPET 3

// var counter = 5;
// var rate = 3;

// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));

// The above code snippet will print "The total value is 15"

// SNIPPET 4

// let counter = 5;
// let rate = 3;

// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + String(counter * rate));

// The above code will throw an error because 'counter' exists before we try to 
// declare it with let, since the function definition is hoisted
// Variable declarations using `let` cannot declare an identifier that has already been declared