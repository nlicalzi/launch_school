const person = {
  firstName: 'Rick ',
  lastName: 'Sanchez',
  fullName: this.firstName + this.lastName,
}

console.log(person.fullName); // what will this log?

// Anywhere outside a function, `this` is implicitly bound to the global object
// Because we don't explicitly bind it, what we access is global.firstName + global.lastName
// Since both are undefined, we are left with undefined + undefined, which evals to NaN