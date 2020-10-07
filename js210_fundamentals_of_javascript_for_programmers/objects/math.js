// 1: Use the Math.PI property to create a function that converts radians to degrees
function radToDeg(rad) {
  return rad / (Math.PI / 180);
}
console.log(`1 radian equals ${radToDeg(1)} degrees`); // 57.295...

// 2: Create a variable with a value of -180 and use Math.abs to log its positive value
let negative = -180;
console.log(`The absolute form of ${negative} is ${Math.abs(negative)}`)

// 3: Use Math.sqrt to find the square root of 16777216
let toSqrt = 16777216;
console.log(`The square root of ${toSqrt} is ${Math.sqrt(toSqrt)}`);

// 4: Use Math.pow to compute and log the value of 16 to the 6th power
console.log(`The value of 16 to the 6th power is ${Math.pow(16, 6)}`);

// 5: Use Math.round, Math.floor, and Math.ceil, to round each value to 50:
let a = 50.72;
let b = 49.2;
let c = 49.86;

console.log(Math.floor(a), Math.ceil(b), Math.ceil(c));

// 6: Create a function that takes two user input arguments (min and max) and return
//    a random integer between min and max, irrespective of place (unordered)
function randomizer(first, second) {
}