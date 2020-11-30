// JS utility library created from scratch, emulating Underscore/Lodash
// Assignment: https://launchschool.com/lessons/d6ad18da/assignments/ecfbca20

(function() {
  const _ = function(element) {
    u = { // internal object, add methods here
      // Array methods
      first: function() { return element[0]; },
      last: function() { return element[element.length - 1]; },
      without: function() {
        // return array without argument elements
        let args = Array.prototype.slice.call(arguments);
        let new_arr = [];
        element.forEach(function(el) {
          if (args.indexOf(el) === -1) {
            new_arr.push(el);
          }
        });
        
        return new_arr;
      },
      range: function(startVal, endVal) {
        // return array form of either 0..el or first..second
        let args = Array.prototype.slice.call(arguments);
        if (args.length === 1) {
          startVal = 0;
          endVal = args[0];
        }

        let results = [];
        for (let val = startVal; val < endVal; val += 1) {
          results.push(val);
        }
        return results;
      },
      lastIndexOf: function(val) {
        // return last index of supplied value (or -1 if not present)
        let lastIdx = -1;
        element.forEach((el, idx) => {
          if (el === val) { lastIdx = idx; }
        });
        return lastIdx;
      },
      sample: function(picks) {
        picks ||= 1;
        if (picks === 1) {
          // if no arg is passed, return a single random value from an array
          let randIdx = Math.floor(Math.random() * Math.floor(element.length))
          return element[randIdx];
        } else {
          // otherwise return an array of X random unique elements 
          let results = [];
          for (let i = 0; i < picks; i += 1) {
            let randIdx = Math.floor(Math.random() * Math.floor(element.length));
            results.push(element[randIdx]);
          }

          return results;
        }
      },

      // Object/object collection methods
      findWhere: function(props) {
        let match;

        element.some(function(obj) {
          let all_match = true;

          for (let prop in props) {
            if (!(prop in obj) || obj[prop] !== props[prop]) {
              all_match = false;
            }
          }

          if (all_match) {
            match = obj;
            return true;
          }
        });
        // if no objects match all supplied properties, return undefined
        return match;        
      },
      where: function(props) {
        // return an array of all objects with properties that match supplied object
        let matchingObjs = [];
        element.forEach(obj => {
          let all_match = true;
          for (let prop in props) {
            if (obj[prop] !== props[prop]) { all_match = false; }
          }
          if (all_match) { matchingObjs.push(obj); }
        });
        return matchingObjs;
      },
      pluck: function(prop) {
        let result = [];
        element.forEach(obj => {
          if (obj[prop]) { result.push(obj[prop]); }
        });
        return result;
      },
      keys: function() {
        return Object.getOwnPropertyNames(element);
      },
      values: function() {
        let keys = Object.getOwnPropertyNames(element);
        return keys.map(key => element[key]);
      },
      extend: function(target, ...objs) {
        objs.forEach(obj => {
          Object.getOwnPropertyNames(obj)
                .forEach(key => { target[key] = obj[key]; });
        });
        return target;
      },
      pick: function(...props) {
        let newObj = {};
        props.forEach(prop => { newObj[prop] = element[prop]; });
        return newObj;
      },
      omit: function(...props) {
        let newObj = {};
        Object.assign(newObj, element);
        props.forEach(prop => {
          delete newObj[prop];
        });
        return newObj;
      },
      has: function(prop) {
        let keys = Object.getOwnPropertyNames(element);
        return keys.includes(prop);
      },
    };

    (["isElement", "isArray", "isObject", "isFunction",
      "isBoolean", "isString", "isNumber"]).forEach(function(method) {
        u[method] = function() { _[method].call(u, element); };
      });

    return u; // return internal object with methods
  };

  // // Utility Methods
  // // These should work with either syntax: _.isElement(obj) or _(obj).isElement()
  _.isElement = function(obj) {
    return obj && obj.nodeType === 1;
  };
  _.isArray = Array.isArray || function(obj) {
    return toString.call(obj) === "[object Array]";
  };
  _.isObject = function(obj) {
    var type = typeof obj;
    return type === "function" || type === "object" && !!obj;
  };
  _.isFunction = function(obj) {
    return typeof obj === "function";
  };
  (["Boolean", "String", "Number"]).forEach(function(method) {
    _["is" + method] = function(obj) {
      return toString.call(obj) === "[object " + method + "]";
    };
  });

  window._ = _; // attach underscore var as a property of the window object
})();           // invoke immediately (IIFE), no need to return anything