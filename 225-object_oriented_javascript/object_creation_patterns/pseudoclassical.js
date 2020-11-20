let Point = function(x = 0, y = 0) {  // capitalized constructor name as convention
  this.x = x;                         // initialize states with arguments
  this.y = y;                         // 0 as default value
};

Point.prototype.onXAxis = function() { // add shared behaviors to constructor's prototype
  return this.y === 0;
};

Point.prototype.onYAxis = function() { // these methods are added one by one
  return this.x === 0;
};

Point.prototype.distanceToOrigin = function() {
  return Math.sqrt((this.x * this.x) + (this.y * this.y));
};

let pointA = new Point(30, 40); // use new to create objects
let pointB = new Point(20);

pointA instanceof Point; // can use instanceof to verify type
pointB instanceof Point;

pointA.distanceToOrigin();  // 50
pointB.onXAxis();           // true