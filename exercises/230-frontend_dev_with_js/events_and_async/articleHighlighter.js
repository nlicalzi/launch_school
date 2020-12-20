document.addEventListener('DOMContentLoaded', () => {
  document.addEventListener('click', (e) => {
    let tagName = e.target.tagName;
    removeAllHighlights();
    
    if (tagName === 'A') {
      let articleID = e.target.getAttribute('href');
      let article = document.querySelector(articleID);
      article.classList.add('highlight');
    } else if (tagName === 'H2' || tagName === 'P') {
      let article = e.target.parentNode;
      article.classList.add('highlight');
    } else {
      let main = document.querySelector('main');
      main.classList.add('highlight');
    }
  });
});

function removeAllHighlights() {
  document.querySelectorAll('.highlight')
          .forEach(el => el.classList.remove('highlight'));
}