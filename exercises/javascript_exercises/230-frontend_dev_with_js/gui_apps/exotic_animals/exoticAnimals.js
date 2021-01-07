// figcaption is hidden by default in the CSS
// when a user hovers the mouse cursor over an image, start a timer
//    if the user moves the cursor off of the image, kill the timer
//    if the timer hits 2 seconds, display figcaption
// when a mouse exits an image, hide figcaption if it's showing

var App = {
  startTimer: function(e) {
    this.timer = setTimeout(function() {
      this.showToolTip(e);
    }.bind(this), 500);
  },

  showToolTip: function(e) {
    let caption = e.target.nextElementSibling;
    caption.style.display = 'inline-block';
    caption.style.position = 'absolute';
  },

  handleMouseLeave: function() {
    if (this.timer) {
      clearTimeout(this.timer);
    }

    $('figcaption').fadeOut(300);
  },

  init: function() {
    $('#exotic_animals').on('mouseenter', 'img', this.startTimer.bind(this));
    $('#exotic_animals').on('mouseleave', 'img', this.handleMouseLeave.bind(this));
  }
};


App.init();