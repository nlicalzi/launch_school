document.addEventListener('DOMContentLoaded', event => {
  const words   = ['APPLE', 'BANANA', 'ORANGE', 'PEAR']; // game words
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
      return choice;                                            // return el
    }
  })();
  
  class Game {
    constructor() {
      this.resetGame();
      this.bindGuessProcessor(); // add our guess handler on keydown event listener
    }

    resetGame() {
      this.word = this.selectNewWord();
      if (!this.word) { this.displayMessage("Sorry, I've run out of words!")};
      this.targetLetters = this.word.toUpperCase().split('');

      this.resetGameState();
      this.resetDisplay();
    }

    resetGameState() {
      this.correctGuesses = 0;
      this.incorrectGuesses = 0;
      this.guessedLetters = [];
    }

    resetDisplay() {
      this.createBlankSpaces();
      this.hideReplayLink();
      this.clearGuessList();
      this.displayMessage('');
      apples.classList.remove(...apples.classList);
    }

    displayMessage(text) {
      message.innerText = text;
    }

    selectNewWord() {
      return randomWord();
    }

    createBlankSpaces() {
      let spaces = (new Array(this.targetLetters.length + 1)).join('<span></span>');
      let spans = letters.querySelectorAll('span');

      spans.forEach(span => span.parentNode.removeChild(span));
      letters.insertAdjacentHTML('beforeend', spaces);
      this.spaces = document.querySelectorAll('#spaces span');
    }

    processGuess(e) {
      let letter = e.key.toUpperCase();

      // guard clauses for invalid keypress / letter already guessed
      if ((this.invalidAlphaKey(e.keyCode)) || (this.guessedLetters.includes(letter))) {
        return; // early return
      }

      this.updateGuessList(letter);

      this.correctGuess(letter) ? this.processCorrectGuess(letter) : this.processIncorrectGuess();
    }

    updateGuessList(guess) {
      this.guessedLetters.push(guess);
      let span = document.createElement('span');
      span.textContent = guess;
      guesses.appendChild(span);
    }

    clearGuessList() {
      let spans = guesses.querySelectorAll('span');
      spans.forEach(span => span.parentNode.removeChild(span));
    }

    populateGuessedSpaces(letter) {
      this.targetLetters.forEach((val, idx) => {
        if (letter === val) { this.spaces[idx].textContent = letter; }
      }, this);
    }

    processCorrectGuess(letter) {
      this.correctGuesses += 1;
      this.populateGuessedSpaces(letter);
      if (this.gameIsWon()) {
        console.log("winning from process correct guess")
        this.winGame();
      }
    }

    gameIsWon() {
      let uniqueTargetLetters = [...new Set(this.targetLetters)];
      return (this.correctGuesses === uniqueTargetLetters.length);
    }

    processIncorrectGuess() {
      this.incorrectGuesses += 1;
      apples.className = 'guess_' + String(this.incorrectGuesses);
      if (this.incorrectGuesses === 6) { this.loseGame(); }
    }

    showReplayLink() {
      replay.hidden = false;
    }

    hideReplayLink() {
      replay.hidden = true;
    }

    winGame() {
      this.displayMessage("Congratulations, you guessed the word correctly!")
      this.showReplayLink();
      this.unbindGuessProcessor();
    }

    loseGame() {
      this.displayMessage("Sorry, you've run out of guesses and lost!")
      this.showReplayLink();
      this.unbindGuessProcessor();
    }

    correctGuess(letter) {
      return (this.targetLetters.includes(letter));
    }

    invalidAlphaKey(keyCode) { // a-z keys, inclusive
      return !(keyCode >= 65 && keyCode <= 90);
    }

    bindGuessProcessor() {
      // arrow func uses the `this` in lexical scope, or the Game class here
      this.processGuessHandler = (e) => this.processGuess(e);
      // allowing us to add an event listener that retains context properly
      document.addEventListener('keydown', this.processGuessHandler);
    }

    unbindGuessProcessor() {
      document.removeEventListener('keydown', this.processGuessHandler);
    }
  }

  replay.addEventListener('click', (e) => {
    e.preventDefault();
    new Game();
  });

  new Game();
});