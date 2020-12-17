const WORDS = ['apple', 'banana', 'orange', 'pear']
const randomWord = (function generateRandomWordWithClosure() {
  let choices = [...WORDS];
  return function() {
    if (choices === undefined || choices.length === 0) { return undefined; }

    let choice = choices[choices.length * Math.random() | 0];
    choices.splice(choices.indexOf(choice), 1);
    return choice;
  }
})()