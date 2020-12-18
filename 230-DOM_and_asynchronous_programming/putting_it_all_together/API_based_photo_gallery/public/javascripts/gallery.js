document.addEventListener('DOMContentLoaded', event => {
  const templates = {};
  let photos;
  
  document.querySelectorAll("script[type='text/x-handlebars']").forEach(tmpl => {
    templates[tmpl['id']] = Handlebars.compile(tmpl['innerHTML']);
  });

  document.querySelectorAll('[data-type=partial]').forEach(tmpl => {
    Handlebars.registerPartial(tmpl['id'], tmpl['innerHTML']);
  });

  fetch('/photos')
    .then(response => response.json())
    .then(json => {
      photos = json;
      renderPhotos();
      renderPhotoInformation(photos[0].id);
      renderComments(photos[0].id);
    });

  function renderPhotos() {
    let slides = document.getElementById('slides');
    slides.insertAdjacentHTML('beforeend', templates.photos({ photos: photos }));
  }

  function renderPhotoInformation(idx) {
    let photo = photos.filter(function(item) {
      return item.id === idx;
    })[0];
    let header = document.querySelector('section > header');
    header.insertAdjacentHTML('beforeend', templates.photo_information(photo));
  }

  function renderComments(id) {
    fetch(`/comments?photo_id=${id}`)
      .then(response => response.json())
      .then(comment_json => {
        let comments = document.querySelector('#comments ul');
        comments.insertAdjacentHTML('beforeend', templates.photo_comments({ comments: comment_json}));
      });
  }
});