// Update the implementation of myFilter by adding the functionality of accepting an
// optional thisArg just like the original Array.prototype.filter.

function myFilter(array, func, context) {
  const result = [];
  array.forEach(value => {
    if (func.call(context, value)) { result.push(value); } // context undefined if not passed
  });
  return result;
}

const filter = { allowedValues: [5, 6, 9] };

console.log(myFilter([2, 1, 3, 4, 5, 6, 12], function(val) {
  return this.allowedValues.includes(val);
}, filter)); // returns [5, 6]