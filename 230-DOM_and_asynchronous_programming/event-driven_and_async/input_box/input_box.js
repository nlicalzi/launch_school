// declare cursorInterval so we can set/clear it throughout
let cursorInterval;
let focusedTextField;
let textField = document.querySelector('.text-field');
let content = document.querySelector('.content');

document.addEventListener('DOMContentLoaded', () => {
  textField.addEventListener('click', event => {
    event.stopPropagation();

    focusedTextField = textField;
    textField.classList.add('focused')

    cursorInterval = cursorInterval || setInterval(() => textField.classList.toggle('cursor'), 500);
  });
});

document.addEventListener('click', event => {
  clearInterval(cursorInterval);
  if (focusedTextField) {
    focusedTextField.classList.remove('focused');
    focusedTextField.classList.remove('cursor');
    focusedTextField = null;
  }
});

document.addEventListener('keydown', event => {
  if (focusedTextField) {
    if (event.key === 'Backspace') {
      content.textContent = content.textContent.slice(0, -1);
    } else if (event.key.length === 1) {
      content.textContent += event.key;
    }
  }
});