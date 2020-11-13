const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    return [1, 2, 3].map(function(number) {
      return `${this.name} ${number}`;
    }, this);
  }
};

console.log(franchise.allMovies());

// using an anonymous function with map's thisArg hardbinding argument