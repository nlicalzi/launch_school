const person = { name: 'Victor' };
const otherPerson = { name: 'Victor' };

console.log(person === otherPerson); // false, but we expected true?

// the above code evaluates to false because person and otherPerson
// each point to a separate object that contains the same value.
// We can refactor it to the below in order for the code to eval to true

console.log(person['name'] === otherPerson['name']);

// or we can change how the assignment is happening and make both reference the same object
const newPerson = { name: 'Victor' };
const otherNewPerson = newPerson;

console.log(newPerson === otherNewPerson);