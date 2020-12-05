let main = document.body.children[0];
let header = document.body.children[1];
let footer = document.body.children[2];

document.body.insertAdjacentElement('afterbegin', header);
header.insertAdjacentElement('afterbegin', main.firstElementChild);

let content = main.children[0];
let firstImg = content.childNodes[3].childNodes[1];
let secondImg = content.childNodes[5].childNodes[1];

content.children[1].insertAdjacentElement('afterbegin', secondImg);
content.children[2].insertAdjacentElement('afterbegin', firstImg);

let firstFig = content.children[1];
let secondFig = content.children[2];

content.children[0].insertAdjacentElement('beforeend', firstFig);
content.children[0].insertAdjacentElement('beforeend', secondFig);