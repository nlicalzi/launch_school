// Write a function that takes an array of integers between 0 and 19, and returns
// an array of those integers sorted based on the English word for each number:
// zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
// thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

const ORDER = ("zero, one, two, three, four, five, six, seven, " +
               "eight, nine, ten, eleven, twelve, thirteen, fourteen, " +
               "fifteen, sixteen, seventeen, eighteen, nineteen").split(", ")

function alphabeticNumberSort(numbers) {
  return numbers.sort(sortNumbers);
}

const sortNumbers = function(num1, num2) {
    if (ORDER[num1] > ORDER[num2]) {
    return 1;
  } else if (ORDER[num1] < ORDER[num2]) {
    return -1;
  } else {
    return 0;
  }
}

let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
console.log(alphabeticNumberSort(numbers));