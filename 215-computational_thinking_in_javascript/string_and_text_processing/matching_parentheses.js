// Write a function that takes a string as an argument and returns true if the string
// contains properly balanced parentheses, false otherwise. Parentheses are properly
// balanced only when '(' and ')' occur in matching pairs, with each pair starting
// with '('.

function isBalanced(string) {
  let parentheses = string.replace(/[^()]/g, '').split(''); // strip non-parens chars
  let openCount = 0;

  for (let idx = 0; idx < parentheses.length; idx += 1) {
    if (parentheses[idx] === '(') {
      openCount += 1;
    } else if (parentheses[idx] === ')') {
      openCount -= 1;
    }
    if (openCount < 0) return false;
  }

  console.log(openCount);
  return (openCount === 0);
}

console.log(isBalanced('What (is) this?') === true);          // true
console.log(isBalanced('What is) this?') === false);          // false
console.log(isBalanced('What (is this?') === false);          // false
console.log(isBalanced('((What) (is this))?') === true);      // true
console.log(isBalanced('((What)) (is this))?') === false);    // false
console.log(isBalanced('Hey!') === true);                     // true
console.log(isBalanced(')Hey!(') === false);                  // false
console.log(isBalanced('What ((is))) up(') === false);        // false