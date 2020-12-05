// Problem 1
let h2Nodes = document.querySelectorAll('h2');
let h2NodesArray = Array.prototype.slice.call(h2Nodes);
h2NodesArray.map(node => node.textContent.split(' ').length);

// Problem 2
document.getElementById('toc');       // get first element with id 'toc'
document.querySelector('#toc');       // get first element with id 'toc'
document.querySelectorAll('.toc')[0]; // get all elements with class 'toc' and pick first

// Problem 3
let links = document.querySelectorAll('.toc a');
for (let i = 0; i < links.length; i += 1) {
  if (i%2 !== 0) { links[i].style.color = 'green'; }
}

// Problem 4
let captions = document.querySelectorAll('.thumbcaption');
let captionTexts = Array.prototype.slice.call(captions)
                                        .map(node => node.textContent.trim());
captionTexts;

// Problem 5
// predefine our keys for searching
let keys = ['Kingdom', 'Phylum', 'Clade', 'Class', 'Order', 'Suborder',
            'Family', 'Genus', 'Species']

// initialize and assign our classification object literal
let classification = {};

// tds is a NodeList having length 20 of `td` objects
let tds = document.querySelectorAll('.infobox td');
let cell;
let link;

// Iterate through our tds
for (let i = 0; i < tds.length; i += 1) {
  cell = tds[i];

  // for each predefined key
  keys.forEach(key => {
    // if the key is present in the text content of the cell
    if (cell.textContent.indexOf(key) !== -1) {
      // we know that the link we want is in the first element child of the next element sibling
      link = cell.nextElementSibling.firstElementChild;
      // assign our key property on classification object to the text content of that element
      classification[key] = link.textContent;
    }
  });
}

// log our object
console.log(classification);