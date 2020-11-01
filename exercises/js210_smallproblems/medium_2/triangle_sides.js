// Write a function that takes the lengths of the three sides of a triangle as arguments,
// and returns one of the following four strings representing the triangle's classification: 
// 'equilateral', 'isosceles', 'scalene', or 'invalid'.
// Equilateral: All three sides are of equal length.
// Isosceles: Two sides are of equal length, while the third is different.
// Scalene: All three sides are of different lengths.
// To be a valid triangle, the sum of the lengths of the two shortest sides must be greater
// than the length of the longest side, and every side must have a length greater than 0.
// If either of these conditions is not satisfied, the triangle is invalid.

function triangle(...sides) {
  if (!isValidTriangle(sides)) { return "invalid" }; // guard clause
  return classifyTriangle(sides);
}

function classifyTriangle(sides) {
  let uniqueSides = new Set(sides).size;

  if (uniqueSides === 1) {
    return "equilateral";
  } else if (uniqueSides === 2) {
    return "isosceles";
  } else {
    return "scalene";
  }
}

function isValidTriangle(sides) {
  let checkSides = sides.slice();                            // don't mutate the passed argument
  if (checkSides.some(side => side <= 0)) { return false; }  // each side has len >= 0 ?
  
  let maxSide = checkSides.sort().pop();                     // sort sides and pop max value
  let sumOfSmallerSides = checkSides.reduce((a, b) => a + b); 
  if (sumOfSmallerSides <= maxSide) { return false; }        // ensure sum of smaller sides > maxSide

  return "true";
}

console.log(triangle(3, 3, 3) === "equilateral");
console.log(triangle(3, 3, 1.5) === "isosceles");
console.log(triangle(3, 4, 5) === "scalene");
console.log(triangle(0, 3, 3) === "invalid");
console.log(triangle(3, 1, 1) === "invalid");