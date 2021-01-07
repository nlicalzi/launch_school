const greeter = {
  message: (() => { // use an IIFE to set message & allow name/greeting to be GC'd
    const name = 'Naveed';
    const greeting = 'Hello';

    return `${greeting} ${name}!`;
  })(),
  sayGreetings() {
    console.log(this.message);
  }
};

console.log(greeter.message);