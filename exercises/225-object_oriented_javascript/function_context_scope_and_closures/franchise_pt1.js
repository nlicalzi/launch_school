const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    return [1, 2, 3].map(number => `${this.name} ${number}`);
  },
};

console.log(franchise.allMovies());

// arrow functions don't create their own `this` binding
// the value of `this` within an arrow function is determined lexically