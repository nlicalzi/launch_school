// Write a function that counts the number of occurrences of each element in a given array.
// Once counted, log each element alongside the number of occurrences.

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

function countOccurrences(elements) {
  let count = vehicles.reduce((count, el) => {
    count[el] = (count[el] || 0) + 1;
    return count;
  }, {})

  Object.keys(count).forEach(el => {
    console.log(el + " => " + count[el]);
  });
}