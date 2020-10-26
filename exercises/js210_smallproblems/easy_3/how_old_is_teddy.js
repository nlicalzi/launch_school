function getRandomInt(val1, val2) {
  let [ min, max ] = [Math.min(val1, val2), Math.max(val1, val2)]

  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function calculateTeddysAge() {
  let age = getRandomInt(20, 200);

  return `Teddy is ${age} years old!`;
}

console.log(calculateTeddysAge());