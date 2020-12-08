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

  * An **event** is an object that represents some occurrence, containing information about what happened and where it happened.
    * The browser can trigger events as the page loads, when the user interacts with the page, and when the browser performs some action required by the program.
  * The code that the browser runs in response to a given event is the **event listener**.
  * Since a lot of web apps consist mainly of a user interface, the code within them has two main tasks:
    * Set up the user interface and display it
    * Handle events resulting from user or browser actions

* A Simple Exchange

  * The code snippet below displays a string representation of a number and a button labeled "Add One", each time the button is clicked the number increments by one.

    1. When the browser loads the page, the JS within the `script` tag is evaluated, adding an event listener for when `DOMContentLoaded` fires (i.e. the browser fully loads the HTML on the page below the `script` and uses it to build the DOM then **fire** the `DOMContentLoaded` event on `document`.
    2. This executes the code in the callback passed to `addEventListener` (the **event handler**), which gets references to 2 DOM elements (`addButton` and `output`), as well as initializing the variable `count` and adding an event listener for `click` events on `addButton`.
    3. The browser then goes back into the event loop, waiting for an event to fire.
    4. When the user clicks the button, the `click` event fires and the browser runs the handler (increasing the value of `count` and updating the `textContent` of the `#output` `span`)
    5. The browser goes back to waiting for an event to fire, etc.

  * ```html
    <!doctype html>
    <html lang="en-US">
      <head>
        <title>title</title>
        <meta charset="UTF-8">
        <script>
          document.addEventListener('DOMContentLoaded', event => {
            let addButton = document.getElementById('add');
            let output = document.getElementById('output');
            let count = 0;
            
            addButton.addEventListener('click', event => {
              count += 1;
              output.textContent = String(count);
            });
          });
        </script>
        <body>
          <p>
            <span id="output">0</span>
            <button id="add">Add One</button>
          </p>
        </body>
      </head>
    </html>
    ```

  * 

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