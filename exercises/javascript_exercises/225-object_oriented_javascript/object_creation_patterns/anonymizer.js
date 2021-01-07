// Using OLOO create an Account prototype object that anonymizes user objects on init.
// The created object should not have access to the function that anonymizes a user other
// than through the init and reanonymize methods. The function that anonymizes creates a
// 16 character sequence composed of letters and numbers.

const Account = (function() { // using an IIFE to create a private scope
  // private data goes here to be accessed via closure
  let userEmail;
  let userPassword;
  let userFirstName;
  let userLastName;
  
  function isValidPassword(testPassword) {
    return userPassword === testPassword;
  }

  function anonymize() {
    let result = '';
    while (result.length < 16) {
      result += getRandomChar();
    }
    return result;
  }

  function getRandomChar() {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    const randomIdx = Math.floor(Math.random() * 62);
    return chars[randomIdx];
  }

  // Return an object with our public methods and data to be accessed 
  return {
    init(email, password, firstName, lastName) {
      userEmail = email;
      userPassword = password;
      userFirstName = firstName; // issue: currently a property AND a method
      userLastName = lastName;
      this.displayName = anonymize(); // private anonymize func from IIFE closure
      return this;
    },
  
    reanonymize(password) {
      if (isValidPassword(password)) {
        this.displayName = anonymize();
        return true;
      } else {
        return 'Invalid Password';
      }
    },
  
    resetPassword(password, newPassword) {
      if (isValidPassword(password)) {
        userPassword = newPassword;
        return true;
      } else {
        return 'Invalid Password';
      }
    },

    firstName(password) {
      if (isValidPassword(password)) {
        return userFirstName;
      } else {
        return 'Invalid Password';
      }
    },

    lastName(password) {
      if (isValidPassword(password)) {
        return userLastName;
      } else {
        return 'Invalid Password';
      }
    },

    email(password) {
      if (isValidPassword(password)) {
        return userEmail;
      } else {
        return 'Invalid Password';
      }
    }
  };
})();

let nick = Object.create(Account).init('nick@gmail.com', 'abc123', 'Nicholas', 'LiCalzi');
console.log(nick.firstName);            // returns firstName()
console.log(nick.email);                // returns email()
console.log(nick.firstName('abc123'));  // logs 'Nicholas'
console.log(nick.firstName('wrong'));   // logs 'Invalid Password'
console.log(nick.email('abc123'));      // logs 'nick@gmail.com'