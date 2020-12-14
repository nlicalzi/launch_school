// on form submit clicked:
//    perform a calculation based on the value of #operator (case statement)
//    #first-number #operator #second-number
//    assign the resulting value to #result

function calculate(first, second, operator) {
  switch (operator) {
    case '+':
      return Number(first) + Number(second);
      break;
    case '-':
      return Number(first) - Number(second);
      break;
    case '*':
      return Number(first) * Number(second);
      break;
    case '/':
      return Number(first) / Number(second);
      break;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  let result = document.getElementById('result');

  form.addEventListener('submit', (e) => {
    e.preventDefault();
    
    let firstNumber = document.getElementById('first-number').value;
    let secondNumber = document.getElementById('second-number').value;
    let operator = document.getElementById('operator').value;

    result.innerHTML = calculate(firstNumber, secondNumber, operator);
  })
})