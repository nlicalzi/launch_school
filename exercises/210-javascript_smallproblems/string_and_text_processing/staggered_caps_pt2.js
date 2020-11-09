// Modify the function from the previous exercise so that it ignores non-alphabetic
// characters when determining whether a letter should be upper or lower case.
// Non-alphabetic characters should still be included in the output string, but should
// not be counted when determining the appropriate case.

function staggeredCase(str) {
  let upcaseNext = true;
  let characters = str.split('');

  for (let idx = 0; idx < characters.length; idx += 1) {
    if ((/[a-z]/i).test(characters[idx])) {
      if (upcaseNext) {
        characters[idx] = characters[idx].toUpperCase();
      } else {
        characters[idx] = characters[idx].toLowerCase();
      }
      upcaseNext = !upcaseNext;
    }
  }
  return characters.join('');
}

console.log(staggeredCase('I Love Launch School!') === 'I lOvE lAuNcH sChOoL!');
console.log(staggeredCase('ALL CAPS') === 'AlL cApS');
console.log(staggeredCase('ignore 77 the 444 numbers') === 'IgNoRe 77 ThE 444 nUmBeRs');