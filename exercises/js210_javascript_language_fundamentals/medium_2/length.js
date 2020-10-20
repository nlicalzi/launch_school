const languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages);         // ['JavaScript', 'Ruby', 'Python']
console.log(languages.length);  // 3

languages.length = 4;
console.log(languages);         // ['JavaScript', 'Ruby', 'Python', empty x1]
console.log(languages.length);  // 4

languages.length = 1;
console.log(languages);         // ['JavaScript']
console.log(languages.length);  // 1

languages.length = 3;
console.log(languages);         // ['JavaScript', empty x2]
console.log(languages.length);  // 3

languages.length = 1;
languages[2] = 'Python';
console.log(languages);         // ['JavaScript', empty, 'Python']
console.log(languages[1]);      // undefined
console.log(languages.length);  // 3

// We get the above results because we are able to change the length property of an array
// Adding to the length property of the array results in the creation of extra empty indices
// Those empty indices do not contain values and will return `undefined` if accessed, but count
// towards the length of the array, which is determined by adding 1 to its highest index