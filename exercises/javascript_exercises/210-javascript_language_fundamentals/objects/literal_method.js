const person = {
  firstName() {
    return 'Victor';
  },
  lastName() {
    return 'Reyes';
  },
};

console.log(`${person.firstName} ${person.lastName}`);
// in the line above, the object literal methods are being called without parentheses ()
// and therefore are returning the function itself rather than a call to said function