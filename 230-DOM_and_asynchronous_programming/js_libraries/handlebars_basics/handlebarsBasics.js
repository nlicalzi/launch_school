let posts = [
  {
    title: 'Lorem ipsum dolor sit amet',
    published: 'April 1, 2015',
    body: 'Sed ut perspiciatis unde omnis iste natus error sit...',
  }
]
let post = {};
posts.push(post);

post.body = '<p>' + post.body + '</p>';
post.tags = ['first', 'blog'];

$(function() {
  Handlebars.registerPartial('tag', $('#tag').html());
  let postTemplate = Handlebars.compile(document.getElementById('post').innerHTML);
  $('body').append(postTemplate({ posts: posts }));
});