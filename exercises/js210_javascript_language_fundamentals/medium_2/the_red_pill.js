function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne(...args) {
    let result = '';
    for (let i = 0; i < args.length; i += 1) {
      result += String.fromCharCode(args[i]);
    }

    log(result);
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101));
    anotherOne(116, 111);
  }

  anotherAnotherOne();
  anotherOne(116, 104, 101);
  return anotherOne;
}

one()(77, 97, 116, 114, 105, 120, 33);

// this code contains the following 8 function calls and results:
// 1: one();
// 2: anotherAnotherOne();                         // Welcome
// 3: anotherOne(116, 111);
// 4: log(result);                                 // to
// 5: anotherOne(116, 104, 101);
// 6: log(result);                                 // the
// 7: anotherOne(77, 97, 116, 114, 105, 120, 33);
// 8: log(result);                                 // Matrix!