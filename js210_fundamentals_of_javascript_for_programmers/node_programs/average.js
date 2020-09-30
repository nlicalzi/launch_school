function sum(input_arr) {
  total = 0;
  for (let i = 0, len = input_arr.length; i < len; i++) {
    total += input_arr[i];
  }

  return total;
}

function average(input_arr) {
  return sum(input_arr) / input_arr.length;
}

// console.log(average(1, 2, 3));
temperatures = [122.123, 2.22, 313.3, 4555.0, 5]
console.log(average(temperatures));