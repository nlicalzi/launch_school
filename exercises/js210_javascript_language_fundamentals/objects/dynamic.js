///// FIRST PROBLEM
const myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

const prop2 = '456';
myObject['prop2'] = '456';
myObject[prop2] = '678';

console.log(myObject[prop2]); // 678, reassigned in line 9 (key is '456')
console.log(myObject.prop2);  // 456, reassigned in line 8

///// SECOND PROBLEM
const myObj = {};
myObj[myFunc()] = 'hello, '; // same as myObj['funcProp'] = 'hello, ' after hoisting line 19

function myFunc() { // this is hoisted to the top
  return 'funcProp';
}

console.log(myObj); // logs { funcProp: 'hello, ' }
myObj[myFunc()] = 'world!';
console.log(myObj); // logs { funcProp: 'world!' }