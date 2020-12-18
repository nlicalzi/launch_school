// implement a function sliceTree
// sliceTree takes two arguments:
//   start (parent node's id)
//   end (innermost child's id)
// sliceTree returns an array of tagNames

// Requirements:
// * inclusive on the right hand side (unlike slice)
// * only consider element nodes
// * only elements that have `body` as an ancestor are sliceable
// * if id isn't in the DOM, return undefined
// * if there's no path from start to end, return undefined

function sliceTree(startIdx, endIdx) {
  let startEl = document.getElementById(startIdx);
  let endEl   = document.getElementById(endIdx);
  let currentEl;
  const sliced = [];

  if (!startEl || !endEl) { return undefined; }

  do {
    currentEl = endEl;
    sliced.unshift(currentEl.tagName);
    endEl = endEl.parentNode
  } while (currentEl.id !== String(startIdx) && endEl.tagName !== 'BODY');

  let hasValidPath = (endEl.tagName === 'BODY' && currentEl.id !== String(startIdx));

  return hasValidPath ? undefined : sliced;
}

function mapToTagNames(arr) {
  return arr.map(el => el.tagName);
}

console.log(sliceTree(1, 4));   // ["ARTICLE", "HEADER", "SPAN", "A"]
console.log(sliceTree(1, 76));  // undefined
console.log(sliceTree(2, 5));   // undefined
console.log(sliceTree(5, 4));   // undefined
console.log(sliceTree(1, 23));  // ["ARTICLE", "FOOTER"]
console.log(sliceTree(1, 22));  // ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
console.log(sliceTree(11, 19)); // ["SECTION", "P", "SPAN", "STRONG", "A"]