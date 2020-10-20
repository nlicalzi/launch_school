// Write a function that takes a grocery list (a two-dimensional array) with each element
// containing a fruit and a quantity, and returns a one-dimensional array of fruits, in
// which each fruit appears a number of times equal to its quantity.

function buyFruit(fruitPairs) {
  let items = [];

  fruitPairs.forEach(el => {
    for (let times = 0; times < el[1]; times += 1) {
      items.push(el[0]);
    }
  })

  return items;
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]