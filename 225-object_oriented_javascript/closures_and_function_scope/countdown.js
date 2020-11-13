function countdown(count) {
  (function(n) {
      for (let i = n; i >= 0; i -= 1) {
          console.log(i);
      }
      
      console.log('Done!');
  })(count);
}

countdown(10);

// lines 2-8 consist of an IIFE, called with the arg passed to count