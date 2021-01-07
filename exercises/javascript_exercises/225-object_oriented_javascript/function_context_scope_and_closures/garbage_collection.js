// Read the following code carefully. Will the JavaScript garbage collection mechanism
// garbage collect the value assigned to the variable count after the function counter
// is run on line 10?

function makeCounter() {
  let count = 1;

  return () => {
    console.log(count++)
  };
}

const counter = makeCounter();
counter();

// count is NOT garbage collected on line 10 after the function is run
// the function returned still needs access to it if called again, i.e. counter();