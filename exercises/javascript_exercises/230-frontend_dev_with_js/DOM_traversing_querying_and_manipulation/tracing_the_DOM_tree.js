// for a given element's id
// return a 2d array of each level of the DOM tree (up to but not incl. body):
// [element + siblings], [parent + siblings], ... [body.childNodes]

function domTreeTracer(id) {
  let currentElement = document.getElementById(id);
  let parentElement;
  const domTree = [];

  do {
    parentElement = currentElement.parentNode;
    domTree.push(getTagNames(parentElement.children));
    currentElement = parentElement;
  } while (parentElement.tagName !== 'BODY');

  return domTree;
}

function getTagNames(htmlCollection) {
  return [...htmlCollection].map(({tagName}) => tagName);
}

console.log(domTreeTracer(2));
console.log(domTreeTracer(6));