function copyProperties(sourceObj, destinationObj) {
  let copyCount = 0;
  for (let prop in sourceObj) {
    destinationObj[prop] = sourceObj[prop];
    copyCount += 1;
  }

  return copyCount;
}

let hal = {
  model: 9000,
  enabled: true,
};

let sal = {};
console.log(copyProperties(hal, sal));  // 2
console.log(sal);                       // { model: 9000, enabled: true }