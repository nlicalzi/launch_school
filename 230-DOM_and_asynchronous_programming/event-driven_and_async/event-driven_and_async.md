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
      </head>
    
      <body>
        <p>
          <span id="output">0</span>
          <button id="add">Add One</button>
        </p>
      </body>
    </html>
    ```

* Page Lifecycle Events

  * What steps does a browser go through to display a website? (**MENTAL MODEL**)
    * HTML code received from server.
    * HTML parsed and JavaScript evaluated.
    * DOM constructed from parsed HTML.
    * **`DOMContentLoaded`** event fires on **document**.
      * We usually use this event when we have JS code that must access the DOM.
    * Page displayed on screen.
    * Embedded assets are loaded.
    * **load** event fires on **window**.

* User Events

  * What are some examples of user events we might need to listen to based on device?
    * Keyboard: `keydown`, `keyup`, `keypress`
    * Mouse: `mouseenter`, `mouseleave`, `mousedown`, `mouseup`, `click`
    * Touch: `touchdown`, `touchup`, `touchmove`
    * Window: `scroll`, `resize`
    * Form: `submit`
  * Full list of events can be found here: https://developer.mozilla.org/en-US/docs/Web/Events

* Adding Event Listeners

  * **Event listeners** / **event handlers** are functions that the JS runtime calls when a particular event occurs.

  * There are four steps needed to set up an event handler:

    1. Identify the event that you need to handle: user actions, the page lifecycle, etc. can fire events
    2. Identify the element that will receive the event: a button, input field, etc.
    3. Define a function to call when this event occurs: function should take a single Event arg.
    4. Register the function as an event listener: tie the first 3 steps together

  * The `GlobalEventHandlers` mixin provides an alternative way to register a function as an event listener for an element.

    * Rather than adding a `click` handler with `button.addEventListener`, we can assign the listener to the `onclick` property of the button itself

      * ```javascript
        document.addEventListener('DOMContentLoaded', () => {
          let button = document.getElementById('alert');
          button.onclick = displayAlert;
        });
        ```

      * Other useful features of `GlobalEventHandlers` include `onsubmit` and `onkeypress`

* The `Event` Object

  * The argument object passed to the event handler in `addEventListener` provides extra information about the event (beyond just that it occurred):

    * ```javascript
      document.body.addEventListener('click', event => { // event is an Event object
        let elementClicked = event.target;
        let elementAttached = event.currentTarget;
        let p = document.getElementById('message');
        p.textContent = elementClicked.tagName;
        let p2 = document.getElementById('message2');
        p2.textContent = elementAttached.tagName;
      });
      ```

  * Some useful properties that appear in `Event` objects include:

    * `type`: the name of the event (e.g. 'click')
    * `currentTarget`: the current object that the event is on (that has the event listener attached)
    * `target`: The initial object to receive notification of the event (e.g. the element that was clicked)

  * Mouse Events

    * `button`: read-only property that indicates which button was pressed

    * `clientX` / `clientY`: mouse position (in visible area of page, from upper-left) on event occuring

    * ```javascript
      // move the element having class selector '.x' on mouse move
      
      document.addEventListener('mousemove', event => {
        let x = document.querySelector('.x');
        x.style.left = String(event.clientX) + 'px';
        x.style.top = String(event.clientY) + 'px';
      });
      ```

  * Keyboard Events

    * `key`: the string value of the pressed key (older browsers do not support this property)

    * `shiftKey` / `altKey` / `ctrlKey`: bool that indicates whether the specified key was also pressed

      * Modified keys (shift, ctrl, etc.) don't fire `keypress`, only `keyup` and `keydown`

    * ```javascript
      // change color of the x based on key presses
      document.addEventListener('keyup', event => {
        let key = event.key;
        let color;
      
        if (key === 'r') {
          color = 'red';
        } else if (key === 'g') {
          color = 'green';
        } else if (key === 'b') {
          color = 'blue';
        }
      
        if (color) {
          let x = document.querySelector('.x');
          // convert x.children to an array to map both .horizontal and .vertical
          [...x.children].map(child => {
            return child.style.background = color;
          });
        }
      });
      ```

    * ```javascript
      // Updating a textarea and reporting text based on character length
      let text;
      let maxLen = 140;
      
      document.addEventListener('keyup', event => {
        text = document.getElementsByTagName('textarea')[0].value;
        
        let charsRemaining = maxLen - text.length;
        let reportCharLength = String(charsRemaining) + ' characters remaining.';
        let reporter = document.querySelector('.reporter');
        
        reporter.innerText = reportCharLength;
        
        if (charsRemaining < 0) { document.getElementsByTagName('textarea')[0].style.color = 'red'; }
      });
      ```

    * 

* Capturing and Bubbling

* Event Delegation

* What is the Event Loop?

* Promises

* Douglas Crockford: An Inconvenient API

### Concepts and Vocab