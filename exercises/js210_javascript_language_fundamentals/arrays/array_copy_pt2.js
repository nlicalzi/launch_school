let myArray = [1, 2, 3, 4];
const myOtherArray = myArray.slice(); // refer to a copy of the original reference, instead of the ref

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);