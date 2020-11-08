## JS225/Lesson 1: Objects

### Summary

### Notes

* **Objects and Methods**

  * Function Invocation and Method Invocation

    * How can we distinguish Function invocation from Method invocation?

      * ```javascript
        greeter.morning(); 	// method invocation
        evening(); 					// function invocation
        
        let functionGreeter = greeter.morning; // returns [function: morning]
        functionGreeter() ; // back to function invocation
        ```

  * `this` during Method Invocation

    * The value of `this` is a reference to the object itself, very loosely equivalent to `self` in Ruby

    * ```javascript
      let counter = {
        count: 0,
        advance: function() {
          this.count += 1; // accessing counter.count
        },
      };
      
      counter; 						// { count: 0, advance: [Function] }
      counter.advance();  // modifying counter.count;
      counter; 					 	// { count: 1, advance: [Function] }
      ```

    * Object methods are properties that happen to have a Function value.

      * You can define methods when you create the object:

        * ```javascript
          let car = {
            fuel: 7.8,
            running: false,
            start: function() {
              this.running = true;
            },
          };
          ```

      * You can add methods anytime later, same as with other properties:

        * ```javascript
          car.stop = function() {
            this.running = false;
          };
          ```

      * Object methods can take arguments and use them to perform/control the work:

        * ```javascript
          car.drive = function(distance) {
            this.fuel -= distance / 52;
          };
          ```

* **Mutating Objects**

  * While primitives like Number, String, and Boolean are immutable, Objects are mutable.
  * This is because JS can be considered a "pass by reference value" language-- variables hold references to objects in memory.

* **Functions as Object Factories**

* **Object Orientation**

### Concepts/Vocab

* You can think of methods as "Functions with a receiver"

  * The receiver is the object the method is called on.

* If a call doesn't have an explicit receiver, it is a function.

* Concise property/concise method syntax:

  * ```javascript
    // Return an object with 2 properties:
    // * A `bar` property whose value is given by the `bar` parameter
    // * A `qux` property that defines a method
    function foo(bar) {
      return {
        bar,		// foo.bar -> concise property
        qux() { // foo.qux() -> concise method
          console.log('hello');
        },
      };
    }
    ```

  * 