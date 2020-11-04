function totalArea(rectangles) {
  let areas = rectangles.map(el => el[0] * el[1]);
  return areas.reduce((sum, area) => sum + area);
}

function totalSquareArea(rectangles) {
  let squares = rectangles.filter(el => el[0] === el[1]);
  return totalArea(squares);
}

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles) === 141);           // 141
console.log(totalSquareArea(rectangles) === 121);     // 121