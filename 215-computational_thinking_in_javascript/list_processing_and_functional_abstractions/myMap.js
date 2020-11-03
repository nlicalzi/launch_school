function myMap(array, func) {
  let mappedArray = [];
  array.forEach((element) => {
    mappedArray.push(func(element));
  })

  return mappedArray;
}

let plusOne = n => n + 1;
console.log(myMap([1, 2, 3, 4], plusOne)); // [ 2, 3, 4, 5 ];