function incrementProperty(obj, propName) {
  if (obj[propName] === undefined) {
    obj[propName] = 0;
  } else {
    obj[propName] += 1;
  }
  return obj[propName];
}

let wins = {
  steve: 3,
  susie: 4,
};

console.log(incrementProperty(wins, 'susie'));  // 5
console.log(wins);                              // { steve: 3, susie: 5 }
console.log(incrementProperty(wins, 'lucy'));   // 1
console.log(wins);                              // { steve: 3, susie: 5, lucy: 1 }