function objectsEqual(first, second) {
  let firstKeys = Object.keys(first);
  let secondKeys = Object.keys(second);
  
  return firstKeys.every(key => {
    return first[key] === second[key];
  }) && secondKeys.every(key => {
    return second[key] === first[key];
  });
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}) === true);
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}) === false);
console.log(objectsEqual({}, {}) === true);
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}) === false);