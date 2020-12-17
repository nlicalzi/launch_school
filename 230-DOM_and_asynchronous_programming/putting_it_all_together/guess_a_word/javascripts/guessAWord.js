document.addEventListener('DOMContentLoaded', event => {
  const words = ['apple', 'banana', 'orange', 'pear']; // game words

  const message = document.querySelector('#message');
  const letters = document.querySelector('#spaces');
  const guesses = document.querySelector('#guesses');
  const apples  = document.querySelector('#apples');
  const replay  = document.querySelector('#replay');

  const randomWord = (function() {
    let choices = [...words];
    return function() {
      if (choices === undefined || choices.length === 0) { return undefined; }
  
      let choice = choices[choices.length * Math.random() | 0]; // get rand el
      choices.splice(choices.indexOf(choice), 1);               // delete el from arr
      return choice;
    }
  })();
  
  class Game {
    constructor() {
      this.resetGame();
    }

    // Set current number of incorrect guesses to 0
    resetGame() {
      this.word = this.selectNewWord();
      if (!this.word) { this.displayMessage("Sorry, I've run out of words!")};
      this.word = this.word.split('');

      this.incorrectGuesses = 0;
      this.guessedLetters = [];
      this.maxIncorrectGuesses = 6;
      this.createBlankSpaces();
    }

    displayMessage(text) { message.innerText = text; }

    selectNewWord() { return randomWord(); }

    createBlankSpaces() {
      // get correct number of spaces
      let spaces = (new Array(this.word.length + 1)).join('<span></span>');
      // let spans = letters.querySelectorAll('span');

      // 
      // spans.forEach(span => span.parentNode.removeChild(span));
      letters.insertAdjacentHTML('beforeend', spaces);
      this.spaces = document.querySelectorAll('#spaces span');
    }
  }

  document.addEventListener('keyup')

  let game = new Game();
});

