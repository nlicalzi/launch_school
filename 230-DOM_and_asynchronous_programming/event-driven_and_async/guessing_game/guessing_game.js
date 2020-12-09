// Once the DOM is loaded...
document.addEventListener('DOMContentLoaded', event => {
  // generate random number between 1 and 100, inclusive
  let answer = Math.floor(Math.random() * 100) + 1;
  let input     = document.querySelector('#guess');
  let form      = document.querySelector('form');
  let paragraph = document.querySelector('p');

  // when `form` is submitted (button is pressed)
  form.addEventListener('submit', event => {
    // prevent form from submitting and redirecting
    event.preventDefault();

    let guess = parseInt(input.value, 10);
    let message;

    if (guess === answer) {
      message = "Good job, you guessed the right number!";
    } else if (guess > answer) {
      message = `Your guess of ${guess} is too high!`;
    } else if (guess < answer) {
      message = `Your guess of ${guess} is too low!`;
    }

    paragraph.textContent = message;
  });

  let newGameLink = document.querySelector('a');
  newGameLink.addEventListener('click', event => {
    answer = Math.floor(Math.random() * 100) + 1;
    paragraph.textContent = "Please guess a number from 1 to 100, inclusive.";
  });
});