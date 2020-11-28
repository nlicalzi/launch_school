// JS utility library created from scratch, emulating Underscore/Lodash
// Assignment: https://launchschool.com/lessons/d6ad18da/assignments/ecfbca20

(function() {
  const _ = function(element) {
    u = { // internal object, add methods here
      first: function() { return element[0]; },
      last: function() { return element[element.length - 1]; },
      without: function() {
        let args = Array.prototype.slice.call(arguments);
        let new_arr = [];
        element.forEach(function(el) {
          if (args.indexOf(el) === -1) { new_arr.push(el); }
        });
        
        return new_arr;
      },
      range: function() {
        // if one arg is supplied, return array of values from 0 to arg
        // if two args supplied, return array starting from first up to second minus 1
      },
      lastIndexOf: function() {
        // return last index of supplied value (or -1 if not present)
      },
      sample: function() {
        // if no arg is passed, return a single random value from an array
        // otherwise return an array of X random unique elements 
      }
    };

    return u; // return internal object with methods
  };

  window._ = _; // attach underscore var as a property of the window object
})();           // invoke immediately (IIFE)
