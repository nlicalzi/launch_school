// Create a function myBind, that accepts two arguments: 1) The function to bind, 2) The
// context object, and returns a new function that's hard-bound to the passed in context
// object.

function myBind(func, context) {
  return function(...args) {
    return func.apply(context, args);
  };
}