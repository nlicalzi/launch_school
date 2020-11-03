const NAMES = ['Nick', 'Abby', 'Bean', 'Beatrice'];

function rollCall(names) {
  for (let idx = 0; idx < names.length; idx += 1) {
    console.log(names[idx]);
  }
}

rollCall(NAMES);