## JS230/Lesson 2: Event Driven & Async Programming

### Summary

### Notes

* Asynchronous Execution with `setTimeout`

  * **Sequential code** is code that runs from top to bottom, with each line being executed by the JS runtime in sequence, skipping around when functions are called.

  * **Asynchronous code** is code that doesn't run continuously or even when the runtime encounters it; it can run partly now, then pause and continue after a delay of any interval.

  * `setTimeout` is a function that takes two arguments: a callback function and a waittime (in ms):

    * ```javascript
      // form: setTimeout(callback, waitTime)
      setTimeout(() => {
        console.log('!');
      }, 3000);
      
      setTimeout(() => {
        console.log('World');
      }, 1000);
      
      console.log('Hello');
      
      // the above code logs:
      // Hello 	            (immediately)
      // World 	(after 1000ms)
      // ! 			(after 3000ms)
      ```

    * Note: `setTimeout` is not part of the JS specification, but most environments (modern browsers and Node) have schedulers that make it available.

* Repeating Execution with `setInterval`

  * `setInterval` behaves similarly to `setTimeout`, except it will repeatedly invoke the passed callback at the specified time interval until explicitly stopped. (Also not part of the JS specification, but implemented in runtimes.)

    * ```javascript
      // initialize variable to store our interval counter
      let counterId;
      
      function startCounting() {
        let count = 0;
        // assign interval func to counter id
        counterId = setInterval(() => {
          count += 1;
          console.log(count);
        }, 1000);
      }
      
      function stopCounting() {
        // clear the interval that counterId points to (stopping it)
        clearInterval(counterId);
      }
      ```

* User Interfaces and Events

* A Simple Exchange

* Page Lifecycle Events

* User Events

* Adding Event Listeners

* The `Event` Object

* Capturing and Bubbling

* Event Delegation

* What is the Event Loop?

* Promises

* Douglas Crockford: An Inconvenient API

### Concepts and Vocab