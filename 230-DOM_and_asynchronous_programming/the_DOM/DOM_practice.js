// HTML source: https://d186loudes4jlv.cloudfront.net/fe2/exercises_objects_and_dom/dom_assignment.html

// document.querySelector('h1').setAttribute('class', 'heading');
document.getElementById('primary_heading').setAttribute('class', 'heading');
document.getElementById('list').setAttribute('class', 'bulleted');

// toggle #notice on clicking link in #toggle
document.getElementById('toggle').onclick = e => {
  e.preventDefault();
  let notice = document.getElementById('notice');
  if (notice.getAttribute('class') === 'hidden') {
      notice.setAttribute('class', 'visible');
  } else {
      notice.setAttribute('class', 'hidden');
  }
};

// hide element #notice on click
document.getElementById('notice').onclick = e => {
  e.preventDefault();
  e.currentTarget.setAttribute('class', 'hidden');
};

document.getElementById('multiplication').textContent = String(13 * 9);
// document.getElementById('multiplication').innerText = String(13 * 9);

document.body.setAttribute('id', 'styled');