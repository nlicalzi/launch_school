// Alter the myBind function written in the previous exercise to support partial function
// application.

function improvedBind(func, context, ...partialArgs) {
  return function(...args) {
    const fullArgs = partialArgs.concat(args);
    return func.apply(context, fullArgs);
  };
}

function addNumbers(a, b) { return a + b; }
const addFive = improvedBind(addNumbers, null, 5);
console.log((addFive(10) === 15));