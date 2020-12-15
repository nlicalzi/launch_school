// add an event handler for the submit event on the form
// retrieve the item name and value from the form elements
// use a quantity of 1 if the quantity field is left empty
// create a new list item object using the name and quantity as strings
// add the list item to the grocery list portion of the HTML
// clear the form's contents

document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  let ul = document.querySelector('ul');
  const getValueOf = (selector) => form.querySelector(selector).value;

  form.addEventListener('submit', (e) => {
    e.preventDefault();
    let name = getValueOf('#name');
    let quantity = getValueOf('#quantity') || '1';
    let li = document.createElement('li');

    li.appendChild(document.createTextNode(`${quantity} ${name}`));
    ul.appendChild(li);

    form.reset();
  });
});