let char;

$(function() { // on DOM load
  $('form').on('submit', function(e) {
    e.preventDefault();      // don't redirect on form submit
    char = $('#key').val();  // grab the submitted input

    $(document).off('keypress').on('keypress', function(e) { // on new keypress...
      if (e.key !== char) { return; }
      $('a').trigger('click');
    });
  });

  $('a').on('click', function(e) {
    e.preventDefault();
    $('#accordion').slideToggle();
  });
});