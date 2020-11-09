const array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges';
console.log(array.length); // 3. array length is determined by adding 1 to the highest index
console.log(Object.keys(array).length); // array now has a property '3.4', since anything but a positive integer is a 'key'

array[-2] = 'Watermelon';
console.log(array.length); // 3. array length is determined by adding 1 to the highest index
console.log(Object.keys(array).length); // array now has a property '-2', since anything but a positive integer is a 'key'

// lines 3 and 7 result in the creation of new K/V pairs inside the array object
// this happens because arrays are a subtype of the object datatype, where any array
// element that has a key consisting of a positive integer is treated as an array element,
// while any other value for an index is treated as the key for a key/value pair