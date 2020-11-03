function objectHasProperty(obj, propertyName) {
  let keys = Object.keys(obj);
  return keys.indexOf(propertyName) !== -1;
}

let pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

console.log(objectHasProperty(pets, 'dog') === true);       // true
console.log(objectHasProperty(pets, 'lizard') === false);    // false
console.log(objectHasProperty(pets, 'mice') === true);      // true