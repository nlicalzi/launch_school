function myReduce(array, func, initial) {
  // create a copied array so we don't mutate the original
  let copiedArray = array.slice();

  // unless there is an argument passed as 'initial'
  if (!initial) {
    // declare and assign initial to the result of calling shift on the copiedArray
    let initial = copiedArray.shift();
  }

  // for each element in our (non-mutating) array copy
  copiedArray.forEach(element => {
    // reassign initial to the result of func(initial, element)
    initial = func(initial, element);
  })
  
  // return our now-modified "initial" value
  return initial;
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest));  // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));   // 49