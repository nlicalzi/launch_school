// Create a function newStack, that when called returns a stack object with three methods:
// push, pop, and printStack. push takes a value and inserts it at the end of the stack.
// pop removes the last element from the stack. printStack logs each remaining element of
// the stack on its own line.

let newStack = (function() {
  const stack = [];
  return {
    push(val) {
      stack.push(val);
    },
    pop() {
      return stack.pop();
    },
    printStack() {
      stack.forEach(el => console.log(el));
    },
  };
})();

newStack.push('first');
newStack.push('second');
newStack.push('third');

newStack.printStack();

console.log(newStack.pop());

newStack.printStack();