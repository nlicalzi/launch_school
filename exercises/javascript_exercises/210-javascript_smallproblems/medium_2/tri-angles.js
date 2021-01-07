// Write a function that takes the three angles of a triangle as arguments, and returns one
// of the following four strings representing the triangle's classification:
// 'right', 'acute', 'obtuse', or 'invalid'.

// Right: One angle is a right angle (exactly 90 degrees).
// Acute: All three angles are less than 90 degrees.
// Obtuse: One angle is greater than 90 degrees.

// You may assume that all angles have integer values, so you do not have to worry about
// floating point errors. You may also assume that the arguments are in degrees.

function triangle(...sides) {
  if (!isValidTriangle(sides)) { return "invalid"; }
  return classifyTriangle(sides);
}

function classifyTriangle(sides) {
  let uniqueSides = new Set(sides).size;
  if (sides.includes(90)) {
    return "right"
  } else if (sides.every(side => side < 90)) {
    return "acute";
  } else if (sides.some(side => side > 90)) {
    return "obtuse"
  }
}

function isValidTriangle(sides) {
  if (sides.some(side => side <= 0)) { return false; }
  return (sides.reduce((a, b) => a + b) === 180);
}

console.log(triangle(60, 70, 50) === 'acute');       // "acute"
console.log(triangle(30, 90, 60) === 'right');       // "right"
console.log(triangle(120, 50, 10) === 'obtuse');      // "obtuse"
console.log(triangle(0, 90, 90) === 'invalid');        // "invalid"
console.log(triangle(50, 50, 50) === 'invalid');       // "invalid"