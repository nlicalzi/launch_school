// Write a function that takes a floating point number representing an angle between 0 and
// 360 degrees, and returns a string representing that angle in degrees, minutes, and
// seconds. You should use a degree symbol (˚) to represent degrees, a single quote (') to
// represent minutes, and a double quote (") to represent seconds. There are 60 minutes in
// a degree, and 60 seconds in a minute.

function dms(angle) {
  if (angle > 360) { angle %= 360; } // solve the wrap around edge case
  let degrees = Math.floor(angle);
  let minutes = Math.floor((angle - degrees) * 60);
  let seconds = Math.floor((((angle - degrees) * 60) - minutes) * 60);

  return `${degrees}°${padLeftZeros(minutes)}'${padLeftZeros(seconds)}"`;
}

function padLeftZeros(num) {
  let str = String(num);
  return str.length < 2 ? ('0' + str) : str;
}

console.log(dms(30));           // 30°00'00"
console.log(dms(76.73));        // 76°43'48"
console.log(dms(254.6));        // 254°35'59"
console.log(dms(93.034773));    // 93°02'05"
console.log(dms(0));            // 0°00'00"
console.log(dms(360));          // 360°00'00" or 0°00'00"