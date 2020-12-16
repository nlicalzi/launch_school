$(function() {
  let $slideshow = $('#slideshow');
  let $images = $slideshow.find('ul');

  $images.on('click', 'a', function(e) {
    e.preventDefault();
    let $img = $(e.currentTarget).closest('li');
    let idx = $img.index();

    $slideshow.find('figure').stop().filter(':visible').fadeOut(250);
    $slideshow.find('figure').eq(idx).delay(250).fadeIn(250);
    $images.find('.selected').removeClass('selected');
    $img.addClass('selected');
  });
});