let myArray = [1, 2, 3, 4];
const myOtherArray = myArray;

myArray.pop();
console.log(myArray);       // logs [1, 2, 3]
console.log(myOtherArray);  // logs [1, 2, 3]

myArray = [1, 2];
console.log(myArray);       // logs [1, 2]
console.log(myOtherArray);  // logs [1, 2, 3]