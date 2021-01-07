function debugIt() {
  const status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();

// The above code will log 'debugging' because when we declare the function logger()
// on line 3, it creates a closure that allows it to reference the constant 'status',
// which points to the string 'debugging'. Functions have access to outer-scoped variables