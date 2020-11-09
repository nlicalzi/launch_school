// Write a function that rotates the last n digits of a number. For the rotation, rotate
// by one digit to the left, moving the first digit to the end.

function rotateRightmostDigits(num, count) {
  let arr = String(num).split('').map(Number);              // return array of digits
  let firstChunk = arr.slice(0, -count);                    // get first half, up to `count`
  let secondChunk = rotateFirst(arr.slice(-count));         // rotate second half
  let resultStr = [firstChunk, secondChunk].flat().join('') // merge both and join to str
  return Number(resultStr);                                 // convert back to number and return
}

function rotateFirst(nums) {
  let [ first, ...rest ] = nums;
  return [...rest, first];
}

console.log(rotateRightmostDigits(735291, 1) === 735291);      // 735291
console.log(rotateRightmostDigits(735291, 2) === 735219);      // 735219 (rotate 9 to the end, or idx -2)
console.log(rotateRightmostDigits(735291, 3) === 735912);      // 735912 (rotate 2 to the end, or idx -3)
console.log(rotateRightmostDigits(735291, 4) === 732915);      // 732915 (rotate 5 to the end, or idx -4)
console.log(rotateRightmostDigits(735291, 5) === 752913);      // 752913 (rotate 3 to the end, or idx -5)
console.log(rotateRightmostDigits(735291, 6) === 352917);      // 352917 (rotate 7 to the end, or idx -6)