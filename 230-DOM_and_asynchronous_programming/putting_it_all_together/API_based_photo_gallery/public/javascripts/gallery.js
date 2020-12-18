let slideshow;

document.addEventListener('DOMContentLoaded', event => {
  const templates = {};
  let photos;

  document.querySelectorAll("script[type='text/x-handlebars']").forEach(tmpl => {
    templates[tmpl['id']] = Handlebars.compile(tmpl['innerHTML']);
  });

  document.querySelectorAll('[data-type=partial]').forEach(tmpl => {
    Handlebars.registerPartial(tmpl['id'], tmpl['innerHTML']);
  });

  class Slideshow {
    constructor() {
      this.slideshow = document.querySelector('#slideshow');
      let slides = this.slideshow.querySelectorAll('figure');
      this.firstSlide = slides[0];
      this.lastSlide = slides[slides.length - 1];
      this.currentSlide = this.firstSlide;
      this.bind();
    }
    bind() {
      let prevButton = this.slideshow.querySelector('a.prev');
      let nextButton = this.slideshow.querySelector('a.next');
      prevButton.addEventListener('click', (e) => { this.prevSlide(e) });
      nextButton.addEventListener('click', (e) => { this.nextSlide(e) });
    }
    prevSlide(e) {
      e.preventDefault();
      let prev = this.currentSlide.previousElementSibling;
      if (!prev) { prev = this.lastSlide; }
      this.fadeOut(this.currentSlide);
      this.fadeIn(prev);
      this.renderPhotoContent(prev.getAttribute('data-id'));
      this.currentSlide = prev;
    }
    nextSlide(e) {
      e.preventDefault();
      let next = this.currentSlide.previousElementSibling;
      if (!next) { next = this.lastSlide; }
      this.fadeOut(this.currentSlide);
      this.fadeIn(next);
      this.renderPhotoContent(next.getAttribute('data-id'));
      this.currentSlide = next;
    }
    fadeOut(slide) {
      slide.classList.add('hide');
      slide.classList.remove('show');
    }
    fadeIn(slide) {
      slide.classList.remove('hide');
      slide.classList.add('show');
    }
    renderPhotoContent(idx) {
      renderPhotoInformation(Number(idx));
      renderComments(idx);
    }
  }

  fetch('/photos')
    .then(response => response.json())
    .then(json => {
      photos = json;
      renderPhotos();
      renderPhotoInformation(photos[0].id);
      renderComments(photos[0].id);
      slideshow = new Slideshow;
    });

  document.querySelector('section > header').addEventListener('click', function(e) {
    e.preventDefault();
    let button = e.target;
    let buttonType = button.getAttribute('data-property');
    if (buttonType) {
      let href = button.getAttribute('href');
      let dataId = button.getAttribute('data-id');
      let text = button.textContent;

      fetch(href, {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
        body: 'photo_id=' + dataId
      })
      .then(response => response.json())
      .then(json => {
        button.textContent = text.replace(/\d+/, json.total);
      });
    }
  });

  document.querySelector('form').addEventListener('submit', function(e) {
    e.preventDefault();
    let form = e.target;
    let href = form.getAttribute('action');
    let method = form.getAttribute('method');
    let data = new FormData(form);
    let currentSlideId = slideshow.currentSlide.getAttribute('data-id');
    data.set('photo_id', currentSlideId);

    fetch(href, {
      method: method,
      headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
      body: new URLSearchParams([...data])
    })
      .then(response => response.json())
      .then(json => {
        let commentsList = document.querySelector('#comments ul');
        commentsList.innerHTML = template.photo_comment(json);
        form.reset();
      });
  });

  function renderPhotos() {
    let slides = document.getElementById('slides');
    // slides.insertAdjacentHTML('beforeend', templates.photos({ photos: photos }));
    slides.innerHTML = templates.photos({ photos: photos });
  }

  function renderPhotoInformation(idx) {
    let photo = photos.filter(function(item) {
      return item.id === idx;
    })[0];
    let header = document.querySelector('section > header');
    // header.insertAdjacentHTML('beforeend', templates.photo_information(photo));
    header.innerHTML = templates.photo_information(photo);
  }

  function renderComments(id) {
    fetch(`/comments?photo_id=${id}`)
      .then(response => response.json())
      .then(comment_json => {
        let comment_list = document.querySelector('#comments ul');
        // comment_list.insertAdjacentHTML('beforeend', templates.photo_comments({ comments: comment_json}));
        comment_list.innerHTML = templates.photo_comments({ comments: comment_json});
      });
  }
});