function passwordGuessing() {
  const PASSWORD = 'password';
  let rlSync = require('readline-sync');
  let guess_count = 0;

  while (guess_count < 3){
    let guess = rlSync.question('What is the password: ');

    if (guess === PASSWORD) {
      console.log('You have successfully logged in.')
      break;
    } else {
      guess_count += 1;
      if (guess_count === 3) {
        console.log('You have been denied access.')
      } else {
        continue;
      }
    }
  }
}

passwordGuessing();