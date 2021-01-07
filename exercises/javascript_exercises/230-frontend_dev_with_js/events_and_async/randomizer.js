// Write a randomizer function that accepts n callbacks and calls each callback at some
// random point in time between now and 2*n seconds from now.

function randomizer(...callbacks) {
  let secondsElapsed = 0;
  let duration = 2 * callbacks.length;

  const secondsLogger = setInterval(() => {
    secondsElapsed += 1;
    console.log(secondsElapsed);
    if (secondsElapsed >= duration) { clearInterval(secondsLogger); }
  }, 1000);

  callbacks.forEach(callback => {
    let delay = getRandomInt(duration + 1);
    setTimeout(callback, delay * 1000);
  });
}

function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}


randomizer(callback1, callback2, callback3);