function makeMultipleLister(num) {
  let abs = Math.abs(num);
  return function() {
    for (let i = abs; i < 100; i += abs) {
      console.log(i);
    }
  } 
}

let lister = makeMultipleLister(13);
lister();