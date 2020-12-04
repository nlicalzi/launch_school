function walk(node, callback) {
  callback(node);

  for (let i = 0; i < node.childNodes.length; i += 1) {
    walk(node.childNodes[i], callback);
  }
}

let images = [];
walk(document, node => {
  if (node.nodeName === 'IMG') { images.push(node); }
  if (node.nodeName === 'A') { node.style.color = 'red'; }
});

console.log(images.length);

let pngCount = images.filter(img => img.getAttribute('src').match(/png$/))
                     .length;

console.log(pngCount);