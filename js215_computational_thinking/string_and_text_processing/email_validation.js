// Implement a function that checks whether an email is valid using the following criteria:
// * There must be one @ sign.
// * The local part must contain one or more letters (A-Z, a-z) and/or digits (0-9).
//   It may not contain any other characters.
// * The domain part must contain two or more components with a single dot (.) between each
//   component. Each component must contain one or more letters (A-Z, a-z) only.

// valid email follows the form: localpart@domainpart

function isValidEmail(email) {
  let parts = email.split('@');
  if (parts.length !== 2) return false;

  let localPart = parts[0];
  let domainPart = parts[1];

  return isValidLocalPart(localPart) && isValidDomainPart(domainPart);
}

function isValidLocalPart(str) {
  if (str === undefined) return false;

  let onlyAlphaAndDigits = /[^a-z0-9]/ig.test(str);
  return !onlyAlphaAndDigits && (str.length > 0);
}

function isValidDomainPart(str) {
  if (str === undefined) return false;

  let domainParts = str.split('.')
  let onlyAlphaParts = !domainParts.some(part => /[^a-z]/ig.test(part));
  let validLengthParts = domainParts.every(part => part.length >= 2);

  return onlyAlphaParts && validLengthParts && (domainParts.length >= 2);
}

console.log(isValidEmail('Foo@baz.com.ph'));                    // returns true
console.log(isValidEmail('Foo@mx.baz.com.ph'));                 // returns true
console.log(isValidEmail('foo@baz.com'));                       // returns true
console.log(isValidEmail('foo@baz.ph'));                        // returns true
console.log(isValidEmail('HELLO123@baz') === false);            // returns false
console.log(isValidEmail('foo.bar@baz.to') === false);          // returns false
console.log(isValidEmail('foo@baz.') === false);                // returns false
console.log(isValidEmail('foo_bat@baz') === false);             // returns false
console.log(isValidEmail('foo@bar.a12') === false);             // returns false
console.log(isValidEmail('foo_bar@baz.com') === false);         // returns false
console.log(isValidEmail('foo@bar.....com') === false);         // returns false