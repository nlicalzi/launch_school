// function isXor(arg1, arg2) {
//   return (!!arg1 + !!arg2) === 1;
// }

function isXor(arg1, arg2) {
  console.log(Boolean(arg1) !== Boolean(arg2));
}

isXor(false, true);     // true
isXor(true, false);     // true
isXor(false, false);    // false
isXor(true, true);      // false


isXor(false, 3);        // true
isXor('a', undefined);  // true
isXor(null, '');        // false
isXor('2', 23);         // false