function makeCountry(name, continent, visited = false) {
  return {
    name,
    continent,
    visited, // setting default values in params list is an ES6 feature
    visitCountry() {
      this.visited = true;
    },
    getDescription() {
      return `${this.name} is located in ${this.continent}. ` + 
        `I ${this.visited ? 'have' : "haven't"} visited this country.`;
    },
  };
}

let chile = makeCountry('The Republic of Chile', 'South America');
console.log(chile.getDescription());

chile.visitCountry();
console.log(chile.getDescription());