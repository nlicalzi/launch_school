function productOfSums(array1, array2) {
  let result = total(array1) * total(array2); // evaluates to NaN, since total returns undefined
  return result;
}

function total(numbers) {
  let sum;

  for (let i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  sum; // we're not using the keyword return here, so this returns undefined
}