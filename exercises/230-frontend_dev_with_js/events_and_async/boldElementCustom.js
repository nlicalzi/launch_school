function makeBold(element, callback) {
  element.style.fontWeight = 'bold';
  if (callback && typeof callback === 'function' ) { callback(element); }
}